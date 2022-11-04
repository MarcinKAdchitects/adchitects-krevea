!function(){"use strict";new class{constructor(e){this.btn=document.querySelectorAll(e.btn),this.submenuBtn=document.querySelectorAll(e.submenuBtn),this.btnCloseShipping=document.querySelector(e.btnCloseShipping),this.pageHeader=document.querySelector(e.pageHeader),this.lastElToAnim=document.querySelectorAll(e.lastElToAnim),this.elToAnim=document.querySelectorAll(e.elToAnim),this.classWhenOpen=e.classWhenOpen||"is-open",this.classAnim=e.classAnim,this.classWithShipping=e.classWithShipping,this.shippingStorageKey=e.shippingStorageKey,this.headerHeight=e.headerHeight,this.delay=this.delayReset=e.delay,this.scroll=window.pageYOffset,this.bindEvents(),this.defaultSettings()}bindEvents(){this.btn.forEach(e=>{e.addEventListener("click",()=>{this.toggleOpen()})}),window.addEventListener("scroll",()=>{this.onScroll()}),this.submenuBtn.forEach(e=>{e.addEventListener("click",()=>{e.parentNode.classList.toggle("is-open")})}),this.btnCloseShipping.addEventListener("click",()=>{this.hideShippingBanner()})}toggleOpen(){this.pageHeader.classList.toggle(this.classWhenOpen),this.animate(this.elToAnim),0<this.lastElToAnim.length&&(this.recalculateDelay(this.elToAnimate),this.animate(this.lastElToAnim)),this.delay=this.delayReset}onScroll(){var e=window.pageYOffset;e>this.headerHeight?this.pageHeader.classList.add("is-scrolled-down"):this.pageHeader.classList.remove("is-scrolled-down"),e>this.scroll?this.pageHeader.classList.remove("is-scrolled-up"):this.pageHeader.classList.add("is-scrolled-up"),this.scroll=window.pageYOffset}animate(e){let s=this.delay;e.forEach(e=>{setTimeout(()=>{e.classList.toggle(this.classAnim)},s),s+=150})}defaultSettings(){this.scroll>this.headerHeight&&this.pageHeader.classList.add("is-scrolled-down"),null!==localStorage.getItem(""+this.shippingStorageKey)?this.btnCloseShipping.parentNode.parentNode.classList.add("hidden"):(this.pageHeader.classList.add(this.classWithShipping),this.btnCloseShipping.parentNode.parentNode.classList.remove("-translate-y-8","opacity-0"))}hideShippingBanner(){this.btnCloseShipping.parentNode.parentNode.classList.add("-translate-y-8","opacity-0"),this.pageHeader.classList.remove(this.classWithShipping),localStorage.setItem(""+this.shippingStorageKey,"is-hidden")}recalculateDelay(e){e=e.length;this.delay+=150*e}}({btn:".js-toggle-menu",submenuBtn:".js-submenu-btn",btnCloseShipping:".js-free-shipping-close",pageHeader:".page-navigation",lastElToAnim:".menu-anim-last",elToAnim:".menu > .menu-item",classAnim:"is-visible",classWithShipping:"page-navigation--moved",shippingStorageKey:"freeShipping",headerHeight:88,delay:150})}();