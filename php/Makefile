#=============================================================================
OPIS = Sustav za upravljanje sadržajem
NAZIV = cmszpk
VERZIJA = 2.0.0
MAK = Makefile
DEP = $(MAK).dep

PHP = php
PHPAB = bin/phpab-1.29.0.phar
PHPUNIT = bin/phpunit-10.5.9.phar
PHPDOC = bin/doctum.phar

PHPCS = bin/phpcs.phar
PHPCBF = bin/phpcbf.phar
PHPSTAN = bin/phpstan.phar

SQLITE = sqlite3

#---------- makefile postavke ----------------------------

SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .php

#---------- pomoćni programi -----------------------------

RM  = rm -f
CAT = cat
TOUCH = touch

#---------- programski kod -------------------------------

CMSZPK_DIR = src
CMSZPK_PHP = \
src/cmszpk-razvoj.php src/cmszpk-proizvod.php \
src/sustav.php src/Funkcije.php \
src/Postavke.php src/HTTPStatus.php \
src/Model.php src/Spremnik.php src/Facebook.php \
src/Pogled.php src/Sadrzaj.php \
src/Upravljac.php src/Sesija.php src/Zahtjev.php

CMSZPK_RES = \
src/autoload.php src/database/demo.sql \
$(strip $(foreach d,src/template,$(wildcard $(d)/*.php))) \
$(strip $(foreach d,src/template/snip,$(wildcard $(d)/*.php))) \
$(strip $(foreach d,src/template/admin,$(wildcard $(d)/*.php))) \
$(strip $(foreach d,src/template/admin/snip,$(wildcard $(d)/*.php)))

TEST_DIR  = test
TEST_PHP  = $(strip $(foreach d,$(TEST_DIR),$(wildcard $(d)/*.php)))
TEST_RES  =

# biblioteke programskog koda (LIB_PHP, LIB_RES)
include $(DEP)

#---------------------------------------------------------

SOURCES   = $(CMSZPK_PHP) $(TEST_PHP) $(LIB_PHP)
RESOURCES = $(CMSZPK_RES) $(TEST_RES) $(LIB_RES)
DISTRIBUTABLES = $(MAK) $(DEP) $(SOURCES) $(RESOURCES)

#---------- ciljevi --------------------------------------

.PHONY: all help check autoload test coverage api

all: help

help:
	@echo "$(OPIS) - $(NAZIV) $(VERZIJA)"
	@echo "Korištenje:"
	@echo "    make           - prikaži pomoć"
	@echo "    make autoload  - generiraj autoload funkciju"
	@echo "    make test      - testiraj programski kod"
	@echo "    make coverage  - provjeri pokrivenost programskog koda testovima"
	@echo "    make api       - generiraj api dokumentaciju"
	@echo "    make check     - make database autoload test api"

check: database autoload test api

database:
	$(RM) src/database/cmszpk.db
	$(CAT) src/database/demo.sql | $(SQLITE) src/database/cmszpk.db

autoload: src/autoload.php
src/autoload.php: $(CMSZPK_PHP) $(HTMLPUR_PHP) $(SLUGGEN_PHP) $(MINIFY_PHP)
	$(PHP) $(PHPAB) -n --tolerant -o src/autoload.php src/

test: test.txt
test.txt: $(TEST_PHP) $(CMSZPK_PHP)
	$(PHP) $(PHPUNIT) --bootstrap src/autoload.php \
		--testdox-text test.txt test

api: sami.php ../docs/api/index.html
../docs/api/index.html: $(CMSZPK_PHP)
	$(PHP) $(PHPDOC) update sami.php

minify:
	$(PHP) bin/minify.php

psr2: $(CMSZPK_PHP)
	$(PHP) $(PHPCS) --standard=psr2 $(CMSZPK_PHP)

psr2fix: $(CMSZPK_PHP)
	$(PHP) $(PHPCBF) --standard=psr2 $(CMSZPK_PHP)

stan: phpstan.neon
phpstan.neon: $(CMSZPK_PHP)
	$(PHP) $(PHPSTAN) analyse --level 0 -c phpstan.neon src
	$(TOUCH) phpstan.neon

stan4:
	$(PHP) $(PHPSTAN) analyse --level 4 -c phpstan.neon src
	$(TOUCH) phpstan.neon

stan7:
	$(PHP) $(PHPSTAN) analyse --level 7 -c phpstan.neon src
	$(TOUCH) phpstan.neon
