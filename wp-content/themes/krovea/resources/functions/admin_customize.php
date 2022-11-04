<?php
function remove_from_admin_bar(){
    global $wp_admin_bar;
    $wp_admin_bar->remove_menu( 'wp-logo' );
    $wp_admin_bar->remove_menu( 'comments' );
    $wp_admin_bar->remove_menu( 'feedback' );
    $wp_admin_bar->remove_menu( 'updates' );
    $wp_admin_bar->remove_menu( 'documentation' );
    $wp_admin_bar->remove_menu( 'support-forums' );
    $wp_admin_bar->remove_menu( 'about' );
    $wp_admin_bar->remove_menu( 'wporg' );
}
add_action('wp_before_admin_bar_render', 'remove_from_admin_bar');

function add_ss_to_menu(){
    global $wp_admin_bar;
    $args_ss_menu = array(
        'id'    => 'ss_menu',
        'title' => "<img style='margin-top:6px;height:20px' src='".get_template_directory_uri()."/assets/images/adchitects_logo.svg' alt='Logo Adchitects'/>",
        'href'  => 'https://adchitects.co/',
        'meta'  => array(
            'title'  => 'Template coded by Marcin Kowalski',
            'target' => '_blank',
        )
    );
    $wp_admin_bar->add_node( $args_ss_menu );
}
add_action('admin_bar_menu', 'add_ss_to_menu');

function modify_footer_admin(){
    $date = date('Y');
    echo "
			<span style='display:flex;align-items:center;'>
				Copyright $date
				<span style='margin:0 .5rem'>|</span>
				Template coded by
				<a href='https://github.com/AwesomeLezf' title='Marcin Kowalski' target='_blank' style='display:flex;align-items:center;'>
					Marcin Kowalski
				</a>
				<span style='margin:0 .5rem'>|</span>
				Powered by <a href='https://pl.wordpress.org/' title='Wordpress' target='_blank' rel='nofollow'>Wordpress</a></span>";
}
add_filter('admin_footer_text','modify_footer_admin');

function my_login_logo()
{
    echo '
	<style type="text/css">
			#login h1 a, .login h1 a {
				z-index: 20;
				margin-bottom: -24px;
				width:100%;
				height:100%;
				padding-bottom: 0px;
				background:none;
				color: transparent;
				text-indent: 0;
			}
			#login h1 a{
				disable: none;
			}
			#login h1{
				display:block;
				width:320px;
			}
			#login h1:before {
				content: "";
				background: url(' . get_template_directory_uri() . '/assets/images/logo.svg) center / cover no-repeat;
				display:block;
				margin: 0 auto;
				width: 320px;
				height: 37px;
				overflow:hidden;
			}
			.login-action-login,
			body{
				background:#E4E4E4!important;
			}
			#login .button-primary{
				background:#FE9E47;
				border:none;
				transition: background 0.2s ease-in-out;
			}
			
			#loginform{
				border-radius: 20px;
				border:none!important;
				box-shadow: 6px 6px 12px #FE9E4740;
			}
			#login #nav a{ color:#000; }
			#login #backtoblog a{ color:#000; }
			#login .privacy-policy-link{ color:#000; }
			.dashicons-translation:before{color:#000;}
			#language-switcher .button{
				color:#fff;
				border-color: #FE9E47;
				background: #FE9E47;
				transition: background 0.2s ease-in-out;
			}
			#login .button-primary:hover,
			#language-switcher .button:hover{
				background-color:#a14d00;
				border-color: #a14d00;
			}
	</style>';
}
add_action('login_enqueue_scripts', 'my_login_logo');

function template_admin_color_schemes() {
    wp_admin_css_color(
        'fresh',
        'Adchitects',
        get_template_directory_uri().'/color.css',
        array( '#323232', '#191919', '#FE9E47', '#a14d00' ),
        array(
            'base'    => '#f1f2f3',
            'focus'   => '#fff',
            'current' => '#fff',
        )
    );
}
add_action( 'admin_init', 'template_admin_color_schemes' );
