<template>
  <v-col cols="auto">
    <v-dialog transition="dialog-bottom-transition" max-width="600">
      <template #activator="{ on, attrs }">
        <v-btn
          text
          v-bind="attrs"
          class="ml-4 mr-2 font-weight-bold"
          color="white"
          v-on="on"
          >ヘルプ</v-btn
        >
      </template>
      <template #default="dialog">
        <v-card>
          <v-card-text>
            <schedule-card-info-init />
          </v-card-text>
          <v-card-actions class="justify-end">
            <v-btn text @click="dialog.value = false">Close</v-btn>
          </v-card-actions>
        </v-card>
      </template>
    </v-dialog>
  </v-col>
</template>
