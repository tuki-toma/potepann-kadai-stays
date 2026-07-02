// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.querySelector(".menu").addEventListener("click", () => {
  document.querySelector(".drop").classList.toggle("show");
});
