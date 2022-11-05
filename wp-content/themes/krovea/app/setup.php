<?php

namespace App;

use Roots\Sage\Container;
use Roots\Sage\Assets\JsonManifest;
use Roots\Sage\Template\Blade;
use Roots\Sage\Template\BladeProvider;

/**
 * Theme assets
 */
add_action('wp_enqueue_scripts', function () {
    // global $post;
    wp_enqueue_style('main.bundle.css', asset_path('main.bundle.css#deferload'), false, filemtime(dirname(__DIR__).'/dist/main.bundle.css'));
    wp_enqueue_script('main.bundle.js', asset_path('main.bundle.js#deferload'), ['jquery'], filemtime(dirname(__DIR__).'/dist/main.bundle.js'), true);

    //Remove css
    wp_dequeue_style('classic-theme-styles');

}, 100);

/**
 * Theme setup
 */
add_action('after_setup_theme', function () {
    /**
     * Enable features from Soil when plugin is activated
     * @link https://roots.io/plugins/soil/
     */
    add_theme_support('soil-clean-up');
    add_theme_support('soil-jquery-cdn');
    add_theme_support('soil-nav-walker');
    add_theme_support('soil-nice-search');
    add_theme_support('soil-relative-urls');

    /**
     * Enable plugins to manage the document title
     * @link https://developer.wordpress.org/reference/functions/add_theme_support/#title-tag
     */
    add_theme_support('title-tag');

    /**
     * Register navigation menus
     * @link https://developer.wordpress.org/reference/functions/register_nav_menus/
     */
    register_nav_menus([
      'krove_menu'  => __('Krove Menu', 'ss-template'),
    ]);

		/**
		 * Enable excerpt for post type 'page'
		 */
		add_post_type_support( 'page', 'excerpt' );

    /**
     * Enable post thumbnails
     * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
     */
    add_theme_support('post-thumbnails');

    /**
     * Enable HTML5 markup support
     * @link https://developer.wordpress.org/reference/functions/add_theme_support/#html5
     */
    add_theme_support('html5', ['caption', 'comment-form', 'comment-list', 'gallery', 'search-form']);

    /**
     * Enable selective refresh for widgets in customizer
     * @link https://developer.wordpress.org/themes/advanced-topics/customizer-api/#theme-support-in-sidebars
     */
    add_theme_support('customize-selective-refresh-widgets');

    /**
     * Use main stylesheet for visual editor
     * @see resources/assets/styles/layouts/_tinymce.scss
     */
    add_editor_style(asset_path('styles/main.css'));
}, 20);

/**
 * Register sidebars
 */
add_action('widgets_init', function () {
    // $config = [
    //     'before_widget' => '<section class="widget %1$s %2$s js-reveal" data-dir="right">',
    //     'after_widget'  => '</section>',
    //     'before_title'  => '<span>',
    //     'after_title'   => '</span>'
    // ];
    // register_sidebar([
    //     'name'          => __('Primary', 'sage'),
    //     'id'            => 'sidebar-primary'
    // ] + $config);
    // register_sidebar([
    //     'name'          => __('Footer', 'sage'),
    //     'id'            => 'sidebar-footer'
    // ] + $config);
});

/**
 * Updates the `$post` variable on each iteration of the loop.
 * Note: updated value is only available for subsequently loaded views, such as partials
 */
add_action('the_post', function ($post) {
    sage('blade')->share('post', $post);
});

/**
 * Setup Sage options
 */
add_action('after_setup_theme', function () {
    /**
     * Add JsonManifest to Sage container
     */
    sage()->singleton('sage.assets', function () {
        return new JsonManifest(config('assets.manifest'), config('assets.uri'));
    });

    /**
     * Add Blade to Sage container
     */
    sage()->singleton('sage.blade', function (Container $app) {
        $cachePath = config('view.compiled');
        if (!file_exists($cachePath)) {
            wp_mkdir_p($cachePath);
        }
        (new BladeProvider($app))->register();
        return new Blade($app['view']);
    });

    /**
     * Create @asset() Blade directive
     */
    sage('blade')->compiler()->directive('asset', function ($asset) {
        return "<?= " . __NAMESPACE__ . "\\asset_path({$asset}); ?>";
    });
});




/* -------------------------------------------------------------------------- */
/*                                    CUSTOM                                  */
/* -------------------------------------------------------------------------- */

/**
 * HOW ADMIN BAR
 */
show_admin_bar( false );

/**
 * Disable emojis
 */
add_action( 'init', function(){
    remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
    remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
    remove_action( 'wp_print_styles', 'print_emoji_styles' );
    remove_filter( 'the_content_feed', 'wp_staticize_emoji' );
    remove_action( 'admin_print_styles', 'print_emoji_styles' );
    remove_filter( 'comment_text_rss', 'wp_staticize_emoji' );
    remove_filter( 'wp_mail', 'wp_staticize_emoji_for_email' );
} );
/**
 * ACF CPT INIT
 */
add_action('acf/init', function(){
	// Check function exists.
	if( function_exists('acf_add_options_page') ) {

		// Add parent.
		$parent = acf_add_options_page(array(
			'page_title'  => __('Pola globalne'),
			'menu_title'  => __('Pola globalne'),
			'menu_slug'   => 'global-fields',
			'redirect'    => true,
			'icon_url'    => 'dashicons-schedule',
			'autoload'    => false,
		));

		acf_add_options_page(array(
			'page_title'  => __('Nagłówek'),
			'menu_title'  => __('Nagłówek'),
			'parent_slug' => $parent['menu_slug'],
		));
	}
});