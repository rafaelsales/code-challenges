import "./gumroad-embed.css";

const renderProduct = (productContainer) => {
  const productAnchor = productContainer.children[0];
  const iframe = document.createElement("iframe");
  /* Ideally the product page should communicate via postMessage
   * the exact height needed for the iframe.
   * E.g. https://github.com/davidjbradshaw/iframe-resizer */
  iframe.setAttribute("src", productAnchor.getAttribute("href"));
  iframe.setAttribute("class", "gumroad-embed-iframe");
  iframe.setAttribute("scrolling", "no");

  productContainer.parentElement.append(iframe);
  productAnchor.remove();
};

const productContainers = document.getElementsByClassName(
  "gumroad-product-embed"
);
for (var i = 0; i < productContainers.length; i++) {
  renderProduct(productContainers[i]);
}
