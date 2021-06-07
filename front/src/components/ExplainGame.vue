<template>
  <transition>
    <div class="modal-overlay">
      <div class="modal-window">
        <div class="modal-content">
          <p>
              SUSHIゲームは、寿司と共に過ごすゲームです。
          </p>
          <button @click="closeModal()">
            <p>閉じる</p>
          </button>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  props:{
    displayModal:{
      type:Function,
      required: true
    }
  },
  methods:{
    closeModal(){
      this.displayModal()
    }

  }

}
</script>

<style lang="scss">

.modal-overlay {
  display: flex;
  align-items: center;
  justify-content: center;
  position: fixed;
  z-index: 30;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
}

.modal-window {
  background: #fff;
  border-radius: 4px;
  overflow: hidden;
}

.modal-content {
  padding: 10px 20px;
}

 /* オーバーレイのトランジション */
.v-enter-active, .v-leave-active {
  transition: opacity 0.2s;

  /* オーバーレイに包含されているモーダルウィンドウのトランジション */
  .v-modal-window {
    transition: opacity 0.2s, transform 0.2s;
  }
}

 /* ディレイを付けるとモーダルウィンドウが消えた後にオーバーレイが消える */
.v-leave-active {
  transition: opacity 0.6s ease 0.3s;
}

.v-enter, .v-leave-to {
  opacity: 0;

  .v-modal-window {
    opacity: 0;
    transform: translateY(-20px);
  }
}
</style>