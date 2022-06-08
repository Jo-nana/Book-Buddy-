const init_hoverIcon = () => {
  const circles = document.querySelectorAll(`[id^="circle"]`);
  console.log(circles)
  circles.forEach(circle => {
    circle.addEventListener('mouseover', (e) => {
      console.log("test")
      const circleId = circle.id.split('-')[1]
      const availableTag = document.getElementById(`available-tag-${circleId}`)
      availableTag.classList.add('show-element')
    })

    circle.addEventListener('mouseout', (e) => {
      const circleId = circle.id.split('-')[1]
      const availableTag = document.getElementById(`available-tag-${circleId}`)
      setTimeout(() => {
        availableTag.classList.remove('show-element')
      }, 1500);
    })
  })

  window.addEventListener("turbolinks:load", (e) => {
    const allButtons = document.querySelectorAll(`[id^="available-tag"]`)
    console.log(allButtons)
    allButtons.forEach(button => {
      button.classList.remove('show-element')
    })
  })
}

export { init_hoverIcon }
