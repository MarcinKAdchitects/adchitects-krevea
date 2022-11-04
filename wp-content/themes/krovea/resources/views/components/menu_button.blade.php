<div class="flex flex-col lg:flex-row">
@foreach (get_field('additionals_btns', 'options') as $item)
    <a href="{{ $item['link'] }}" title=""{{ $item['title'] }}" class="mr-2 last:mr-0 flex items-center justify-center w-12 h-12 rounded-full transition-colors duration-300 ease-in-out border border-transparent hover:border-primary focus:border-gray-300">
        {{ App::get_image([
            'id' => $item['icon'],
            'classes' => 'w-auto h-6',
        ]) }}
    </a>
@endforeach
</div>