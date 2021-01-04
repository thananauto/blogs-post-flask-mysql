//close the flashing message after 5 second



document.addEventListener('DOMContentLoaded', function(e){
    setTimeout(function () {
        document.querySelector(".alert button").click()
    }, 5000);
})

//pass the data from html to modal
const modals = document.querySelectorAll(".open_modal");
const footer_modal = document.querySelector(".modal-footer")

//querying each modal overlay
modals.forEach((modal) => {
  modal.addEventListener("click", () => {
    console.log("Came inside");
    var article_id = modal.getAttribute("data-id");
    var confirm = footer_modal.querySelector("#confirm");
    if (confirm.hasAttribute("href")) {
      confirm.removeAttribute("href");
    }
    confirm.setAttribute("href", `delete/${article_id}`);
  });
});

