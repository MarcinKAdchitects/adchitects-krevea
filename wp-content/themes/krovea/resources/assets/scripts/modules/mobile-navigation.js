/* example
    const menu = new Menu({
      btn: ".js-toggle-menu",
      submenuBtn: ".js-submenu-btn",
      btnCloseShipping: ".js-free-shipping-close",

      pageHeader: ".page-navigation",
      lastElToAnim: ".menu-anim-last",
      elToAnim: ".menu > .menu-item",

      classWhenOpen: "is-open",
      classAnim: "is-visible",
      classWithShipping: "page-navigation--moved",

      shippingStorageKey: 'freeShipping',
      headerHeight: 88,
      delay: 150,
    });
*/

export default class MobileNavigation {
  constructor(args) {
    this.btn = document.querySelectorAll(args.btn);
    this.submenuBtn = document.querySelectorAll(args.submenuBtn);
    this.btnCloseShipping = document.querySelector(args.btnCloseShipping);

    this.pageHeader = document.querySelector(args.pageHeader);
    this.lastElToAnim = document.querySelectorAll(args.lastElToAnim);
    this.elToAnim = document.querySelectorAll(args.elToAnim);

    this.classWhenOpen = args.classWhenOpen ? args.classWhenOpen : "is-open";
    this.classAnim = args.classAnim;
    this.classWithShipping = args.classWithShipping;

    this.shippingStorageKey = args.shippingStorageKey;
    this.headerHeight = args.headerHeight;
    this.delay = this.delayReset = args.delay;
    this.scroll = window.pageYOffset;

    this.bindEvents();
    this.defaultSettings();
  }
  bindEvents() {
    this.btn.forEach((item) => {
      item.addEventListener("click", () => {
        this.toggleOpen();
      });
    });

    this.pageHeader.addEventListener("click", (event) => {
      if (event.target.localName === "a") {
        this.reset();
      }
    });

    window.addEventListener("scroll", () => {
      this.onScroll();
    });

    this.submenuBtn.forEach((item) => {
      item.addEventListener("click", () => {
        item.parentNode.classList.toggle("is-open");
      });
    });

    this.btnCloseShipping.addEventListener("click", () => {
      this.hideShippingBanner();
    });

    window.addEventListener("resize", () => {
      this.reset();
      this.submenuBtn.forEach((item) => {
        item.parentNode.classList.remove("is-open");
      });
    });
  }
  toggleOpen() {
    this.pageHeader.classList.toggle(this.classWhenOpen);

    this.animate(this.elToAnim);

    if (this.lastElToAnim.length > 0) {
      this.recalculateDelay(this.elToAnim);
      this.animate(this.lastElToAnim);
    }
    this.delay = this.delayReset;
  }

  reset() {
    this.pageHeader.classList.remove(this.classWhenOpen);

    this.resetAnimate(this.elToAnim);

    if (this.lastElToAnim.length > 0) {
      this.resetAnimate(this.lastElToAnim);
    }
  }

  onScroll() {
    let scrolled = window.pageYOffset;
    if (scrolled > this.headerHeight) {
      this.pageHeader.classList.add("is-scrolled-down");
    } else {
      this.pageHeader.classList.remove("is-scrolled-down");
    }

    if (scrolled > this.scroll) {
      this.pageHeader.classList.remove("is-scrolled-up");
    } else {
      this.pageHeader.classList.add("is-scrolled-up");
    }
    this.scroll = window.pageYOffset;
  }

  animate(el) {
    let delay = this.delay;
    el.forEach((item) => {
      setTimeout(() => {
        item.classList.toggle(this.classAnim);
      }, delay);
      delay += 150;
    });
  }

  resetAnimate(el) {
    el.forEach((item) => {
      item.classList.remove(this.classAnim);
    });
  }

  defaultSettings() {
    if (this.scroll > this.headerHeight) {
      this.pageHeader.classList.add("is-scrolled-down");
    }
    if (localStorage.getItem(`${this.shippingStorageKey}`) !== null) this.btnCloseShipping.parentNode.parentNode.classList.add("hidden");
    else {
      this.pageHeader.classList.add(this.classWithShipping);
      this.btnCloseShipping.parentNode.parentNode.classList.remove("-translate-y-8", "opacity-0");
    }
  }

  hideShippingBanner() {
    this.btnCloseShipping.parentNode.parentNode.classList.add("-translate-y-8", "opacity-0");
    this.pageHeader.classList.remove(this.classWithShipping);
    localStorage.setItem(`${this.shippingStorageKey}`, "is-hidden");
  }

  recalculateDelay(el) {
    let size = el.length;
    this.delay += size * 150;
  }
}
