<?php

namespace App\Controllers;

use Sober\Controller\Controller;
use Valitron\Validator;

class App extends Controller{
	protected $acf                 = true;
	static    $front_page_id       = 2;


	/**
	 * Get image
	 *
	 * Function returns image using wp_get_attachment_image function
	 *
	 * @param  array  $options		Input array
	 *
	 * @return	string
	 */
	public static function get_image($options){
		$id = $options['id'];

		/** default */
		$size = "full";
		$is_icon = false;
		$classes = "";

		if(isset($options['size'])) $size = $options['size'];
		if(isset($options['is_icon'])) $is_icon = $options['is_icon'];
		if(isset($options['classes'])) $classes = $options['classes'];
		if(isset($options['is_gallery'])) $is_gallery = $options['is_gallery'];
		if(isset($options['gallery_classes'])) $gallery_classes = $options['gallery_classes'];

		$image_alt = get_post_meta($id , '_wp_attachment_image_alt', true);

		// $image = wp_get_attachment_image($id, $size, $is_icon, array("class" => 'lazy '.$classes, "alt" => $image_alt));
		$image = wp_get_attachment_image($id, $size, $is_icon, array("class" => $classes, "alt" => $image_alt));

		echo $image;
	}

	/**
	 * Get image src
	 *
	 * Function returns image src using wp_get_attachment_image_src function
	 *
	 * @param  array  $options		Input array
	 *
	 * @return	string
	 */
	public static function get_image_src($options){
		$id = $options['id'];

		/** default */
		$size = "full";

		if(isset($options['size'])) $size = $options['size'];

		return  wp_get_attachment_image_src($id, $size)[0];
	}

	public static function get_image_path(){
		return get_template_directory_uri().'/assets/images/';
	}

	/**
	 * Get posts
	 *
	 * Function use WP_Query returns post of specified type
	 *
	 * @param  array  $param		Input array
	 *
	 * @return	object
	 */
	public static function get_posts($args) {

		/** default */
		if(!isset($args['post_type'])) $args += [
			'post_type' => 'post',
		];
		if(!isset($args['post_status'])) $args += [
			'post_status' => 'publish',
		];
		if(isset($args['posts_per_page'])) $args += [
			'posts_per_page' => -1,
		];
		$args += [
			'paged' => (get_query_var('paged')) ? get_query_var('paged') : 1,
		];

		/**
		 * Args
		 * 	'post_type',
				'post_status',
				'posts_per_page',
				'paged',
				'offset',
				's',
				'post_parent',
				'category_name',
				'tax_query'
				'meta_query',
				'post__in',
				'lang',
				'order',
				orderby'
		 */

		$posts = new \WP_Query( $args );
		return $posts;
	}
}
