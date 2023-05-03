import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["cartItems"]

  connect() {
    this.renderCart();
  }

  renderCart() {
    const cart = JSON.parse(localStorage.getItem("cart")) || [];  //  ['1', '2', '4', '3']
    // const products = this.fetchProducts(cart);
    // console.log(products);
    this.cartItemsTarget.innerHTML = cart
      .map((productId) => {
        return `
        <div class="cart-item">
          <span><%= Product.find(${productId})%> </span>
          <a href="#" data-action="click->cart#removeFromCart" data-product-id="${productId}">Remove from cart</a>
        </div>`;
      })
      .join("");
  }

  fetchProducts(cart) {
    const response = fetch(`/products?ids=${cart.join(",")}`)
    console.log(response);
  }

  addToCart(event) {
    // # This metjod should sabe in local storage the ID of the product
    event.preventDefault();
    const productId = event.target.dataset.productId;
    const cart = JSON.parse(localStorage.getItem("cart")) || [];
    if (cart.includes(productId)) {
      return;
    } else {
      cart.push(productId);
      localStorage.setItem("cart", JSON.stringify(cart));
      window.location.reload();
    }
  }

  removeFromCart(event) {
    // # This metjod should sabe in local storage the ID of the product
    event.preventDefault();
    const productId = event.target.dataset.productId;
    const cart = JSON.parse(localStorage.getItem("cart")) || [];
    const newCart = cart.filter((id) => id !== productId);
    localStorage.setItem("cart", JSON.stringify(newCart));
    window.location.reload();
  }
}
