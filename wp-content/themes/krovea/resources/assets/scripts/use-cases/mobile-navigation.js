import MobileNavigation from "../modules/mobile-navigation";

new MobileNavigation({
  btn: ".js-toggle-menu",
  submenuBtn: ".js-submenu-btn",
  btnCloseShipping: ".js-free-shipping-close",

  pageHeader: ".page-navigation",
  lastElToAnim: ".menu-anim-last",
  elToAnim: ".menu > .menu-item",

  classAnim: "is-visible",
  classWithShipping: "page-navigation--moved",

  shippingStorageKey: "freeShipping",
  headerHeight: 88,
  delay: 150,
});
