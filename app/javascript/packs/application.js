// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// External imports
import "bootstrap"
import Flickity from "flickity"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  const elem = document.querySelector('.main-carousel');
  const flkty = new Flickity(elem, {
    // options
  freeScroll: true,
  wrapAround: true

  });

    const elem2 = document.querySelector('.main-carousel2');
    const flkty2 = new Flickity( elem2, {
    // options
      freeScroll: true,
      wrapAround: true

      });

  const elem3 = document.querySelector('.carousel-main');
  const elemnav = document.querySelector('.carousel-nav');

  const flkty3 = new Flickity(elem3, {
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

  const form = document.querySelector('#booking-form');
  const formInputs = form.querySelectorAll('input');

  formInputs.forEach(input => {
    input.addEventListener('change', (e) => {
      const dateStart = document.querySelector('#booking_date_start');
      const dateEnd = document.querySelector('#booking_date_end');

      const dateOfStart = new Date(dateStart.value);
      const dateOfEnd = new Date(dateEnd.value);

      const Difference_In_Time = dateOfEnd.getTime() - dateOfStart.getTime();
      const Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);

      const price = document.getElementById('price-per-night');
      const daysBooked = document.getElementById('days-booked');
      daysBooked.innerHTML = `${Difference_In_Days} days`

      const totalPrice = price.innerHTML * Difference_In_Days; 
      const priceToChange = document.getElementById('total-price');

      priceToChange.innerHTML = totalPrice;
    });
  });
  
});

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
