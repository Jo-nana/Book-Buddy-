const init_showButton = () => {
  const chatroomTitles = document.querySelectorAll(`[id^="chatroomTitle"]`);
  chatroomTitles.forEach(chatroomTitle => {
    chatroomTitle.addEventListener('mouseover', (e) => {
      const chatroomId = chatroomTitle.id.split('-')[1]
      const chatroomButton = document.getElementById(`chatJoinButton-${chatroomId}`)
      chatroomButton.classList.add('showButton')
    })

    chatroomTitle.addEventListener('mouseout', (e) => {
      const chatroomId = chatroomTitle.id.split('-')[1]
      const chatroomButton = document.getElementById(`chatJoinButton-${chatroomId}`)
      setTimeout(() => {
        chatroomButton.classList.remove('showButton')
      }, 1500);
    })
  })

  window.addEventListener("turbolinks:load", (e) => {
    const allButtons = document.querySelectorAll(`[id^="chatJoinButton"]`)
    console.log(allButtons)
    allButtons.forEach(button => {
      button.classList.remove('showButton')
    })
  })
}

export { init_showButton }
