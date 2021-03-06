PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE website (
    id          INTEGER PRIMARY KEY,
    datum       TEXT NOT NULL,          -- When the website was published
    lang        CHAR(2) NOT NULL,       -- Language of the website
    enabled     CHAR(4) NOT NULL,       -- Is website enabled?
    name        VARCHAR(255) NOT NULL,  -- Name of the website
    address     VARCHAR(255) NOT NULL,  -- Address of the website
    zipcode     VARCHAR(255) NOT NULL,  -- Zip code of the website
    city        VARCHAR(255) NOT NULL,  -- City of the website
    country     VARCHAR(255) NOT NULL,  -- Country of the website
    phone       VARCHAR(255) NOT NULL,  -- Phone of the website
    logo        VARCHAR(255) NOT NULL,  -- Logo of the website
    description VARCHAR(255) NOT NULL,  -- Description of the website
    comment     VARCHAR(255) NOT NULL   -- Comment of the website
);
INSERT INTO "website" VALUES(1,'2018-02-12','hr','yes','Primjer CMS sadržaja','Ulica BB','20000','Dubrovnik','Hrvatska','345 7689','Primjer','Sustav za upravljanje sadržajem','Programsko inženjerstvo');
INSERT INTO "website" VALUES(2,'2018-02-12','en','yes','Example CMS content','Street BB','20000','Dubrovnik','Croatia','345 7689','Example','Content Management System','Software engineering');
CREATE TABLE users (
    id          INTEGER PRIMARY KEY,
    datum       TEXT NOT NULL,
    username    VARCHAR(255) NOT NULL,
    password    VARCHAR(255) NOT NULL,
    email       VARCHAR(255) NOT NULL 
);
INSERT INTO "users" VALUES(1,'2018-02-12','cmszpk','$2y$10$JQg4rldboI/tr2rVu9oFAOeQbr.7XNTe3WhtSDJBN9lmWiJ1yWS1m','');
CREATE TABLE page (
    id          INTEGER PRIMARY KEY,
    sourceid    INTEGER NOT NULL,
    menuid      INTEGER NOT NULL,
    datum       TEXT NOT NULL,          -- When the page was published
    lang        CHAR(2) NOT NULL,       -- Language of the page
    slug        VARCHAR(255) NOT NULL,  -- URL slug of the page
    template    VARCHAR(255) NOT NULL,  -- HTML template of the page
    media       VARCHAR(255) NOT NULL,  -- Featured image of the page
    title       VARCHAR(255) NOT NULL,  -- Full title of the page
    summary     TEXT NOT NULL,          -- A short summary of the page
    keywords    TEXT NOT NULL,          -- Page keywords
    content     TEXT NOT NULL           -- The HTML content of the page
);
INSERT INTO "page" VALUES(1,0,1,'2018-02-12','hr','/','home','/media/trippy.jpg','Naslovnica','Naslovna stranica','naslovna, stranica','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>Primjer CMS sadržaja</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
INSERT INTO "page" VALUES(2,1,1,'2018-02-12','en','/','home','/media/trippy.jpg','Homepage','Home page','home, page','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>Example CMS content</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
INSERT INTO "page" VALUES(3,0,2,'2018-02-12','hr','/blog','blogonly','','Blog','Blog objave','blog, objave','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>Objava</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
INSERT INTO "page" VALUES(4,3,2,'2018-02-12','en','/blog','blogonly','','Blog','Blog posts','blog, post','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>Post</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
INSERT INTO "page" VALUES(5,0,3,'2018-02-12','hr','/dokumentacija','articleonly','','Dokumentacija','Korisnička dokumentacija','dokumentacija, korisnik','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>Korisnička dokumentacija</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
INSERT INTO "page" VALUES(6,5,3,'2018-02-12','en','/documentation','articleonly','','Documentation','User documentation','documentation, user','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>User documentation</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
CREATE TABLE blog (
    id          INTEGER PRIMARY KEY,
    sourceid    INTEGER NOT NULL,
    datum       TEXT NOT NULL,          -- When the post was published
    lang        CHAR(2) NOT NULL,       -- Language of the post
    slug        VARCHAR(255) NOT NULL,  -- URL slug of the post
    media       VARCHAR(255) NOT NULL,  -- Featured image of the post
    title       VARCHAR(255) NOT NULL,  -- Full title of the post
    summary     TEXT NOT NULL,          -- A short summary of the post
    keywords    TEXT NOT NULL,          -- Post keywords
    content     TEXT NOT NULL           -- The HTML content of the post
);
INSERT INTO "blog" VALUES(1,0,'2018-02-12','hr','/objava','','Objava','Blog objava','blog, objava','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>Primjer objave</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
INSERT INTO "blog" VALUES(2,1,'2018-02-12','en','/post','','Post','Blog post','blog, post','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>Example post</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
CREATE TABLE article (
    id          INTEGER PRIMARY KEY,
    sourceid    INTEGER NOT NULL,
    datum       TEXT NOT NULL,          -- When the article was published
    lang        CHAR(2) NOT NULL,       -- Language of the article
    slug        VARCHAR(255) NOT NULL,  -- URL slug of the article
    media       VARCHAR(255) NOT NULL,  -- Featured image of the article
    title       VARCHAR(255) NOT NULL,  -- Full title of the article
    summary     TEXT NOT NULL,          -- A short summary of the article
    keywords    TEXT NOT NULL,          -- Article keywords
    content     TEXT NOT NULL           -- The HTML content of the article
);
INSERT INTO "article" VALUES(1,0,'2018-02-12','hr','/dokument','','Dokument','Primjer dokumenta','primjer, dokument','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>Primjer dokumenta</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
INSERT INTO "article" VALUES(2,1,'2018-02-12','en','/document','','Document','Example document','example, document','<div class="uk-block uk-padding-top-remove"><div class="uk-container uk-container-center"><h1>Example document</h1><h2>Lorem ipsum</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div></div>');
CREATE TABLE staff (
    id          INTEGER PRIMARY KEY,
    datum       TEXT NOT NULL,          -- When the staff was published
    lang        CHAR(2) NOT NULL,       -- Language of the staff
    slug        VARCHAR(255) NOT NULL,  -- URL slug of the staff
    media       VARCHAR(255) NOT NULL,  -- Featured image of the staff
    title       VARCHAR(255) NOT NULL,  -- Full title of the staff
    summary     TEXT NOT NULL,          -- A short summary of the staff
    content     TEXT NOT NULL           -- The HTML content of the staff
);
CREATE TABLE media (
    id          INTEGER PRIMARY KEY,
    datum       TEXT NOT NULL,          -- When the image was published
    lang        CHAR(2) NOT NULL,       -- Language of the image
    display     VARCHAR(255) NOT NULL,  -- Display type: media, gallery, product
    media       VARCHAR(255) NOT NULL,  -- Path of the image
    title       VARCHAR(255) NOT NULL,  -- Full title of the image
    summary     TEXT NOT NULL           -- A short summary of the image
);
INSERT INTO "media" VALUES(1,'2018-02-12','hr','gallery','/media/trippy.jpg','Trippy street art bristol','Photo by Mec Rawlings on Unsplash');
CREATE TABLE fbfeed (
    id                  INTEGER PRIMARY KEY,
    stamp               INTEGER NOT NULL,
    fb_id               TEXT,
    fb_type             TEXT NOT NULL,
    fb_message          TEXT,
    fb_picture          TEXT,
    fb_link             TEXT,
    fb_name             TEXT,
    fb_caption          TEXT,
    fb_created_time     TEXT,
    fb_object_id        TEXT
);
INSERT INTO "fbfeed" VALUES(1,0,'','demo','<p>Photo by Mec Rawlings on Unsplash</p>','/media/trippy.jpg','','','','','');
INSERT INTO "fbfeed" VALUES(2,0,'','demo','<p>Photo by Mec Rawlings on Unsplash</p>','/media/trippy.jpg','','','','','');
INSERT INTO "fbfeed" VALUES(3,0,'','demo','<p>Photo by Mec Rawlings on Unsplash</p>','/media/trippy.jpg','','','','','');
INSERT INTO "fbfeed" VALUES(4,0,'','demo','<p>Photo by Mec Rawlings on Unsplash</p>','/media/trippy.jpg','','','','','');
INSERT INTO "fbfeed" VALUES(5,0,'','demo','<p>Photo by Mec Rawlings on Unsplash</p>','/media/trippy.jpg','','','','','');
INSERT INTO "fbfeed" VALUES(6,0,'','demo','<p>Photo by Mec Rawlings on Unsplash</p>','/media/trippy.jpg','','','','','');
INSERT INTO "fbfeed" VALUES(7,0,'','demo','<p>Photo by Mec Rawlings on Unsplash</p>','/media/trippy.jpg','','','','','');
INSERT INTO "fbfeed" VALUES(8,0,'','demo','<p>Photo by Mec Rawlings on Unsplash</p>','/media/trippy.jpg','','','','','');
INSERT INTO "fbfeed" VALUES(9,0,'','demo','<p>Photo by Mec Rawlings on Unsplash</p>','/media/trippy.jpg','','','','','');
CREATE TABLE servercache (
    id                  INTEGER PRIMARY KEY,
    uri                 VARCHAR(255) NOT NULL,      -- Uri
    valid               INTEGER NOT NULL DEFAULT 0, -- Content is valid
    html                TEXT NOT NULL               -- Content
);
CREATE UNIQUE INDEX uri_index ON servercache (uri);
COMMIT;
