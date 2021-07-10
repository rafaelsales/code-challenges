import "./gumroad-overlay.css";

const displayProductDialog = (button) => {
  const overlay = document.createElement("div");
  overlay.setAttribute("class", "gumroad-popup-overlay");
  overlay.addEventListener("click", () => {
    iframe.remove();
    overlay.remove();
  });

  const iframe = document.createElement("iframe");
  /* Ideally the product page should communicate via postMessage
   * the exact height needed for the iframe.
   * E.g. https://github.com/davidjbradshaw/iframe-resizer */
  iframe.setAttribute("src", button.getAttribute("href"));
  iframe.setAttribute("class", "gumroad-popup-iframe");
  iframe.setAttribute("scrolling", "no");

  button.parentElement.append(overlay);
  button.parentElement.append(iframe);
};

const buttons = document.getElementsByClassName("gumroad-button");
for (var i = 0; i < buttons.length; i++) {
  buttons[i].addEventListener("click", (event) => {
    event.preventDefault();
    displayProductDialog(event.target);
  });
}
