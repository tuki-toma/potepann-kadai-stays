// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener("turbo:load", () =>{
  const menu = document.querySelector(".menu");
  const drop = document.querySelector(".drop");

  menu.addEventListener("click",() =>{
    drop.classList.toggle("show");
  });
});