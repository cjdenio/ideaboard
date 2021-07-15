window.addEventListener("turbolinks:load", () => {
  const links = document.querySelectorAll(".idea__upvote a[data-remote]");

  links.forEach((element) => {
    element.addEventListener("ajax:success", (e) => {
      if (!element.parentElement.classList.contains("is-upvoted")) {
        element.parentElement.classList.add("is-upvoted");

        const upvotes = parseInt(
          element.parentElement.getAttribute("data-upvotes")
        );
        element.innerHTML = "🔼 " + (upvotes + 1);
        element.parentElement.setAttribute(
          "data-upvotes",
          (upvotes + 1).toString()
        );
      } else {
        element.parentElement.classList.remove("is-upvoted");

        const upvotes = parseInt(
          element.parentElement.getAttribute("data-upvotes")
        );
        element.innerHTML = "🔼 " + (upvotes - 1);
        element.parentElement.setAttribute(
          "data-upvotes",
          (upvotes - 1).toString()
        );
      }
    });
  });
});
