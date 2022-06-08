// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

scroll = document.querySelector(".scroll-down")
if (scroll) {
  scroll.addEventListener("click",(event) => {
    window.scrollTo(0, window.innerHeight);
    event.preventDefault()
   if (window.scrollY >= window.innerHeight) {
    document.querySelector(".grid-container").style.display = "none"
  } else {
  }
  })
}

import { init_showButton } from '../plugins/init_showButton';
document.addEventListener('turbolinks:load', () => {
  init_showButton();
});


// document.addEventListener('turbolinks:load', () => {
//   if (document.querySelector(".remove-landing").innerText === "true"){
//     document.querySelector(".grid-container").style.display = "none"
//   }
// })
