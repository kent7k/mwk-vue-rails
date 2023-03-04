# ----- GitHub Action -----
##########################
# IAM identity providers （Githubが提供するOIDCプロバイダをAWSに登録）
##########################
# GitHub ActionsのOIDCのIDプロパイダのthumbprintを計算するため必要
data "http" "github_actions_openid_configuration" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

# GitHub ActionsのOIDCのIDプロパイダのthumbprintを計算するため必要
data "tls_certificate" "github_actions" {
  url = jsondecode(data.http.github_actions_openid_configuration.body).jwks_uri
}

resource "aws_iam_openid_connect_provider" "github_oidc" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  # https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc_verify-thumbprint.html
  thumbprint_list = [data.tls_certificate.github_actions.certificates[0].sha1_fingerprint]
}

##########################
# IAM Role （信頼関係を登録して一時的なAWSリソースへのアクセストークンを発行するIAMロールを作成）
##########################
data "aws_iam_policy_document" "github_actions_assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type       = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_oidc.arn]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:kent7k/__deleted__rr:*"]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name               = "iam_role_for_github_actions"
  assume_role_policy = data.aws_iam_policy_document.github_actions_assume_role_policy.json
}

##########################
# IAM Policy (AWS ECRへコンテナイメージがプッシュできるよう必要な権限をポリシーとして定義)
##########################
data "aws_iam_policy_document" "github_actions_resource_role_policy" {
  statement {
    actions = [
      "iam:PassRole",
      "ecs:DescribeServices",
      "ecs:DescribeTaskDefinition",
      "ecs:UpdateService",
      "ecs:RegisterTaskDefinition",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:GetAuthorizationToken",
      "ssm:GetParameters",
      "secretsmanager:GetSecretValue",
      "kms:Decrypt"
    ]
    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_policy" "github_actions" {
  name        = "iam_policy_for_github_actions"
  path        = "/"
  description = "IAM Policy for GitHub Actions"
  policy      = data.aws_iam_policy_document.github_actions_resource_role_policy.json
}

# 作成したIAMロールとIAMポリシーを関連付け
resource "aws_iam_role_policy_attachment" "github_actions" {
  role       = aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.github_actions.arn
}
# ----- GitHub Action -----