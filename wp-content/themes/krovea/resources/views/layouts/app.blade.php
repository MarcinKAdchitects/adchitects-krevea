<!doctype html>
<html {!! language_attributes(); !!}>
	@include('components.the_head')	
	<body class="max-w-screen overflow-x-hidden">
	@include('components.the_header')
	<main class="relative overflow-hidden">
      @yield('content')
	</main>
    @include('components.the_footer')
  </body>
</html>
