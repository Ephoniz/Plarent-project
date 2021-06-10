// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// External imports
import "bootstrap";
import Flickity from "flickity";



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  const elem = document.querySelector('.main-carousel');
  const flkty = new Flickity(elem, {
    // options
    wrapAround: true,
    groupCells: true,
    freeScroll: true,
    cellAlign: 'left'

  });

  const elem2 = document.querySelector('.carousel-main');
  const elemnav = document.querySelector('.carousel-nav');

  const flkty2 = new Flickity(elem2, {
    // options
    wrapAround: true,

    freeScroll: true,
    cellAlign: 'left'
  });


  //JS To move the comet in home Page
  const comet = document.getElementById('comet');

  window.addEventListener('scroll', () => {
    const value = window.scrollY;

    comet.style.right = value * 3 + 'px';
  });
});

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------