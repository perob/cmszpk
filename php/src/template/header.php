<!DOCTYPE html>
<html lang="<?php echoOutput( $page['lang'] ); ?>">
<head>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<title><?php echoOutput( $page['title'] ); ?></title>
<link rel="alternate" hreflang="<?= $lang ?>" href="<?= $vars['url'] . $uri ?>">
<?php if ( isset( $langnav )) {
    foreach ( $langnav as $item )
        echo '<link rel="alternate" hreflang="'
        . $item['lang'] . '" href="' . $vars['url'] . $item['slug'] . '">' . PHP_EOL;
} ?>
<link rel="icon" href="/favicon.ico">
<link href="/vendor/uikit/dist/css/uikit.css" rel="stylesheet">
<script src="/vendor/js/jquery.js"></script>
<script src="/vendor/uikit/dist/js/uikit.min.js"></script>
<link href="/vendor/uikit/dist/css/components/sticky.css" rel="stylesheet">
<script src="/vendor/uikit/dist/js/components/sticky.js"></script>
<link href="/vendor/uikit/dist/css/components/slideshow.css" rel="stylesheet">
<script src="/vendor/uikit/dist/js/components/slideshow.js"></script>
<script src="/vendor/uikit/dist/js/components/lightbox.js"></script>
</head>
<body>

<!-- header -->
<div class="uk-block uk-padding-bottom-remove uk-contrast uk-hidden-small">
<div class="uk-container uk-container-center">
<div class="uk-grid uk-margin-bottom">
<div class="uk-width-1-2">
<h1 class="uk-heading-large"><?php echoOutput( $site['logo'] ); ?></h1>
</div>
<div class="uk-width-1-2">
<p class="uk-text-right uk-text-small">
<?php echoOutput( $site['description'] ); ?><br>
<?php echoOutput( $site['comment'] ); ?>
</p>
</div>
</div>
</div>
</div>

