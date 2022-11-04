@extends('layouts.app')

@php
	$hero = get_field('hero');
@endphp
@section('content')
	<section class="min-h-[200vH]">		
		<div class="flex items-center justify-center min-h-screen py-32 lg:py-38">
			<div class="max-w-160 px-4 text-center">
				<h1 class="mb-8 block font-bold text-6.5">{{ $hero['title'] }}</h1>
				{!! $hero['content'] !!}
			</div>
		</div>
	</section>
@endsection
