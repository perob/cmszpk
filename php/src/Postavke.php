<?php
namespace Sustav;

use Sustav\Postavke;
use Sustav\Upravljac\Zahtjev;

/**
 * Postavke sustava.
 */
class Postavke
{
    private $postavke = [];
    private $default = array(
        'tables' => array(
            'website', 'page', 'blog', 'article', 'users', 'staff', 'media'
        ),
        'templates' => array(
            'home', 'page', 'blog', 'article', 'staff', 'product', 'gallery',
            'about', 'contact', 'bloglist', 'articlelist', 'stafflist',
            'blogonly', 'articleonly'
        ),
        'mediadirs' => array(
            'media', 'upload'
        )
    );

    public function __construct()
    {
        $this->postavke = require __DIR__.'/cmszpk.php';
    }

    public static function htmldir()
    {
        return __DIR__.'/template/';
    }

    public function tables()
    {
        return $this->default['tables'];
    }

    public function templates()
    {
        return $this->default['templates'];
    }

    public function mediadirs()
    {
        return $this->default['mediadirs'];
    }

    public function uploaddir()
    {
        return realpath( __DIR__.'/../..' );
    }

    public function url()
    {
        return Zahtjev::httphost();
    }

    public function lang()
    {
        return $this->postavke['lang'];
    }

    public function database()
    {
        return $this->postavke['database'];
    }

    public function development()
    {
        return $this->postavke['development'];
    }

    public function cache()
    {
        return $this->postavke['cache'];
    }

    public function timezone()
    {
        return 'UTC';
    }

    public function purifyhtml()
    {
        return true;
    }

    public function facebookUrl()
    {
        if ( !empty( $this->postavke['facebook_url'] ))
            return $this->postavke['facebook_url'];
        return 'https://www.facebook.com';
    }

    public function facebookPageId()
    {
        return $this->postavke['facebook_page_id'];
    }

    public function facebookAppId()
    {
        return $this->postavke['facebook_app_id'];
    }

    public function facebookAppSecret()
    {
        return $this->postavke['facebook_app_secret'];
    }

    public function facebookApiVersion()
    {
        return $this->postavke['facebook_api_version'];
    }

    public function googleMapToken()
    {
        if ( isset( $this->postavke['googlemap_token'] ))
            return $this->postavke['googlemap_token'];
        return '';
    }

    public function googleMapLatLng()
    {
        if ( !empty( $this->postavke['googlemap_latlng'] ))
            return $this->postavke['googlemap_latlng'];
        return '42.644079,18.100319';
    }
}
