<?php
namespace Sustav\Upravljac;

use Sustav\Postavke;
use Sustav\Pogled\Sadrzaj;
use Sustav\Model\Spremnik;
use Sustav\Upravljac\Zahtjev;

/**
 * Upravljač sadržaja.
 */
class Upravljac
{
    private $zahtjev;

    /**
     * Konstruktor.
     *
     * @param Zahtjev $zahtjev HTTP zahtjev.
     */
    public function __construct(Zahtjev $zahtjev)
    {
        $this->zahtjev = $zahtjev;
    }

    /**
     * Pokreni upravljač za prikaz sadržaja.
     *
     * @param Sadrzaj $sadrzaj Sadržaj.
     * @return array Status.
     */
    public function pokreni(Sadrzaj $sadrzaj) : array
    {
        $postavke = new Postavke();
        $cfg = [
            'development' => $postavke->development(),
            'cache' => $postavke->cache(),
            'url' => $postavke->url(),
            'database' => $postavke->database(),
            'htmldir' => $postavke->htmldir(),
            'lang' => $postavke->lang(),
            'tables' => $postavke->tables(),
            'templates' => $postavke->templates(),
            'uploaddir' => $postavke->uploaddir(),
            'facebook_url' => $postavke->facebookUrl(),
            'googlemap_token' => $postavke->googleMapToken(),
            'googlemap_latlng' => $postavke->googleMapLatLng()
        ];
        return $this->route($sadrzaj, Zahtjev::uri(), $cfg);
    }

    /**
     * Preusmjeri prikaz na željeni sadržaj prema stazi zahtjeva.
     *
     * @param Sadrzaj $sadrzaj Sadržaj.
     * @param string $uri Staza HTTP zahtjeva.
     * @param array $cfg Polje postavki sustava.
     * @return array Status.
     */
    private function route(Sadrzaj $sadrzaj, string $uri, array $cfg) : array
    {
        $urlp = parse_url('http://example.com' . rawurldecode($uri));
        if (isset($urlp['query'])) {
            if ($urlp['path'] == '/admin/sqlite') {
                return $sadrzaj->renderSqlite($cfg);
            }
            return ['code' => 404];
        }
        if (!isset($urlp['path'])) {
            return $sadrzaj->renderTemplate($uri, '', '', '', $cfg);
        }
        $path = mb_strtolower($urlp['path'], 'UTF-8');
        if ($path !== $urlp['path']) {
            return ['code' => 301, 'path' => $path];
        }
        if ($cfg['cache']) {
            $cache = new Spremnik($path, $cfg['database']);
            if ($cache->ready()) {
                return ['code' => 200, 'cache' => $cache];
            } else {
                ob_start();
            }
        }
        $www = array(
            // Blog listing
            '/^\/blog$/u'
            => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderBlogList($uri, 'hr', $vars);
            },
            '/^\/([a-z][a-z])\/blog$/u'
            => function ($uri, $lang, $vars) use ($sadrzaj) {
                return $sadrzaj->renderBlogList($uri, $lang, $vars);
            },
            // Article listing
            '/^\/article$/u'
            => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderArticleList($uri, 'hr', $vars);
            },
            '/^\/([a-z][a-z])\/article$/u'
            => function ($uri, $lang, $vars) use ($sadrzaj) {
                return $sadrzaj->renderArticleList($uri, $lang, $vars);
            },
            // Homepage
            '/^\/?$/u' => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderTemplate($uri, '', '', '', $vars);
            },
            '/^\/([a-z][a-z])$/u' => function ($uri, $lang, $vars) use ($sadrzaj) {
                return $sadrzaj->renderTemplate($uri, $lang, '', '', $vars);
            },
            // Template primary language
            '/^(\/[^\/[:space:]]+)$/u'
            => function ($uri, $slug, $vars) use ($sadrzaj) {
                return $sadrzaj->renderTemplate($uri, '', '', $slug, $vars);
            },
            '/^\/(blog|article)(\/[^\/[:space:]]+)$/u'
            => function ($uri, $table, $slug, $vars) use ($sadrzaj) {
                return $sadrzaj->renderTemplate($uri, '', $table, $slug, $vars);
            },
            // Template secondary language(s)
            '/^\/([a-z][a-z])(\/[^\/[:space:]]+)$/u'
            => function ($uri, $lang, $slug, $vars) use ($sadrzaj) {
                return $sadrzaj->renderTemplate($uri, $lang, '', $slug, $vars);
            },
            '/^\/([a-z][a-z])\/(blog|article)(\/[^\/[:space:]]+)$/u'
            => function ($uri, $lang, $table, $slug, $vars) use ($sadrzaj) {
                return $sadrzaj->renderTemplate($uri, $lang, $table, $slug, $vars);
            },
            // Admin
            '/^\/admin\/(website|page|blog|article|staff|media|users)$/u'
            => function ($uri, $table, $vars) use ($sadrzaj) {
                return $sadrzaj->renderAdmin($uri, $table, $vars);
            },
            // Admin edit
            '/^\/admin\/(website|page|blog|article|staff|media|users)\/([1-9][0-9]*)$/u'
            => function ($uri, $table, $id, $vars) use ($sadrzaj) {
                return $sadrzaj->renderEdit($uri, $table, $id, $vars);
            },
            // Admin create
            '/^\/admin\/(website|page|blog|article|staff|media|users)\/new$/u'
            => function ($uri, $table, $vars) use ($sadrzaj) {
                return $sadrzaj->renderCreate($uri, $table, $vars);
            },
            // Admin upload
            '/^\/admin\/upload$/u'
            => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderUpload($uri, $vars);
            },
            // Admin cleanup
            '/^\/admin\/cleanup$/u'
            => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderCleanup($uri, $vars);
            },
            // Admin login/logout
            '/^\/admin\/login$/u'
            => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderLogin($uri, $vars);
            },
            '/^\/admin\/logout$/u'
            => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderLogout($uri, $vars);
            },
            // Admin log
            '/^\/admin\/log$/u'
            => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderLog($uri, $vars);
            },
            '/^\/admin\/log\/clean$/u'
            => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderLogClean($uri, $vars);
            },
            // Admin help
            '/^\/admin\/help$/u'
            => function ($uri, $vars) use ($sadrzaj) {
                return $sadrzaj->renderHelp($uri, $vars);
            },
            // Redirect
            '/^(\/.*)\/$/u'
            => function ($uri, $path, $vars) {
                return ['code' => 301, 'path' => $path];
            },
            // Not found
            '/^.*$/u'
            => function ($uri, $vars) {
                return ['code' => 404];
            }
        );
        foreach ($www as $pattern => $callback) {
            if (preg_match($pattern, $path, $params) === 1) {
                $params[] = $cfg;
                return call_user_func_array($callback, array_values($params));
            }
        }
        return ['code' => 500];
    }
}
