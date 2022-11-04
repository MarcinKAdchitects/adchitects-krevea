<div class="z-100 fixed flex items-center w-full h-8 bg-primary transition-transform duration-300 ease-in-out -translate-y-8 opacity-0">
	<div class="container z-10 relative text-[12px] text-white text-center">
		{{ get_field('free_shipping', 'options') }}
		<button type="button" class="absolute -top-[2px] right-0 hover:scale-110 focus:scale-110 transtion-all duration-300 js-free-shipping-close">
			@include('icon::close', ['classes' => 'w-6 h-6'])
		</button>
	</div>
</div>
<header class="page-navigation">
	<div class="container relative flex items-center justify-between lg:border-b lg:border-gray-100">
		<a href="{{ home_url('/') }}" class="transition-transform duration-300 ease-in-out hover:scale-95 focus:scale-95 focus:border-b focus:border-primary">
			{{ App::get_image([
				'id'  	  => get_field('logo', 'options'),
				'classes' =>  'w-[103px] h-[23px]',
			]) }}
		</a>
		<button class="navbutton lg:hidden js-toggle-menu">
			<span class="navbutton__item"></span>
			<span class="navbutton__item"></span>
			<span class="navbutton__item"></span>
		</button>		
		<div class="page-navigation__menu">
			<div class="-mx-2 lg:hidden pt-2 pb-2">
				<button type="button" class="ml-auto block hover:scale-110 focus:scale-110 transtion-all duration-300 js-toggle-menu">
					@include('icon::close', ['classes' => 'ml-auto w-12 h-12 text-primary'])
				</button>				
			</div>
			<nav class="lg:flex lg:justify-center lg:flex-1 lg:h-full js-menu-navi">
				{{ wp_nav_menu([
					'theme_location' => 'krove_menu',
					'container'  => 'ul',
					'menu_class' => 'menu'
				]) }}
			</nav>
			@include('components.menu_button')
		</div>
	</div>
</header>

{{-- <button class="navbutton xl:hidden js-toggle-menu">
			<span class="navbutton__item"></span>
			<span class="navbutton__item"></span>
			<span class="navbutton__item"></span>
		</button> --}}

{{-- <button class="navbutton-close js-toggle-menu">
					<span class="navbutton-close__item"></span>
					<span class="navbutton-close__item"></span>
				</button> --}}




{{-- <div class="mt-8 xl:mt-0">
				@foreach (get_field('btns_menu', 'options') as $btn)
					
				@endforeach
			</div>		 --}}