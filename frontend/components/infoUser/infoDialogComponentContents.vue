<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialogComponent"
      hide-overlay
      transition="dialog-bottom-transition"
      max-width="600"
      persistent
    >
      <v-row no-gutters>
        <v-col> </v-col>
        <v-col cols="sm" class="text-center align-self-center">
          <v-sheet elevation="4" class="rounded-pill">
            <template>
              <!--               <v-chip
                label
                color="transparent"
                x-large
                outlined
                text-color="purple"
              >
                <v-icon class="ml-2 mr-2">mdi-account-circle</v-icon>
                アカウント
              </v-chip>
 -->
            </template>
          </v-sheet>
        </v-col>
        <v-col>
          <button-close @close-dialog="closeDialog" />
        </v-col>
      </v-row>

      <v-sheet
        width="500px"
        color="transparent"
        class=" mx-auto pb-3 mb-10 rounded-card"
      >
        <template>
          <schedule-card-info :post="posting" />
        </template>
      </v-sheet>
      <v-sheet class="d-flex justify-center transparent">
        <v-btn
          transparent
          color="white"
          class="pink--text font-weight-bold mt-n10 mb-2"
          min-width="125px"
          @click="closeDialog"
        >
          <v-icon>mdi-window-close</v-icon>
          閉じる
        </v-btn>
      </v-sheet>
    </v-dialog>
  </v-row>
</template>

<script>
import buttonClose from '~/components/layouts/ButtonClose.vue'
import scheduleCardInfo from '~/components/infoUser/ScheduleCardInfo.vue'

export default {
  components: {
    buttonClose,
    scheduleCardInfo,
  },
  props: {
    dialogComponent: {
      type: Boolean,
      default: false,
    },
    posting: {
      type: Object,
      default: () => ({}),
      required: false,
    },
    isScheduleCardInfo: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    closeDialog() {
      this.$emit('result', { res: true, message: '' })
    },
  },
}
</script>
