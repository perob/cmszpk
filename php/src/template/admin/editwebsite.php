<!-- website -->
<?php
include __DIR__.'/snip/formbegin.php';
include __DIR__.'/snip/language.php';
include __DIR__.'/snip/enabled.php';
$key = 'name';
$input = [ 'name' => $key, 'label' => ucwords($key), 'value' => $page[$key] ];
include __DIR__.'/snip/inputtext.php';
$key = 'address';
$input = [ 'name' => $key, 'label' => ucwords($key), 'value' => $page[$key] ];
include __DIR__.'/snip/inputtext.php';
$key = 'zipcode';
$input = [ 'name' => $key, 'label' => 'Postal code', 'value' => $page[$key] ];
include __DIR__.'/snip/inputtext.php';
$key = 'city';
$input = [ 'name' => $key, 'label' => ucwords($key), 'value' => $page[$key] ];
include __DIR__.'/snip/inputtext.php';
$key = 'country';
$input = [ 'name' => $key, 'label' => ucwords($key), 'value' => $page[$key] ];
include __DIR__.'/snip/inputtext.php';
$key = 'phone';
$input = [ 'name' => $key, 'label' => ucwords($key), 'value' => $page[$key] ];
include __DIR__.'/snip/inputtext.php';
$key = 'logo';
$input = [ 'name' => $key, 'label' => ucwords($key), 'value' => $page[$key] ];
include __DIR__.'/snip/inputtext.php';
$key = 'description';
$input = [ 'name' => $key, 'label' => ucwords($key), 'value' => $page[$key] ];
include __DIR__.'/snip/inputtext.php';
$key = 'comment';
$input = [ 'name' => $key, 'label' => ucwords($key), 'value' => $page[$key] ];
include __DIR__.'/snip/inputtext.php';
include __DIR__.'/snip/formendedit.php';
