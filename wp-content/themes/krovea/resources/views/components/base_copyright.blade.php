<div class="text-xxs md:text-base bg-gray-100">
	<div class="container text-black">
		<div class="flex items-center justify-between w-full h-12">
			<div class="flex items-center">
				@include('icon::copyright-regular', ['classes' => 'mr-4 w-6 h-6'])
				<span>{{ date('Y') }}</span>
			</div>
			<div class="flex items-center js-g-f-tl">
				Coded by
				<a href="https://github.com/AwesomeLezf" target="_blank" class="ml-2 hover:text-primary focus:text-primary" title="Go to Github account">Marcin Kowalski</a>
			</div>
		</div>
	</div>
</div>
