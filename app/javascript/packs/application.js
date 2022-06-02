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

scroll = document.querySelector(".down-arrow")
scroll.addEventListener("click",(event) => {
  event.preventDefault()
 console.log("xwxwx")
 window.scrollTo(0, document.body.scrollHeight);
})

import { init_showButton } from '../plugins/init_showButton';
document.addEventListener('turbolinks:load', () => {
  init_showButton();
});
