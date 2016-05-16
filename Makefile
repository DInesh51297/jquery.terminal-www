VERSION=0.10.7
UPLOAD=upload $(1) $(2)
SIZE=ls -sh $(1) | cut -d ' ' -f1

ALL: index.php api_reference.php examples.php js/jquery.terminal.min.js css/jquery.terminal.css

index.php: ../.$(VERSION) index.php.in
	sed -e "s/{{VER}}/$(VERSION)/g" -e "s/{{JSMIN}}/`ls -lh ../js/jquery.terminal-$(VERSION).min.js | cut -d' ' -f5`B/" -e "s/{{JS}}/`ls -lh ../js/jquery.terminal-$(VERSION).js | cut -d' ' -f5`B/"  -e "s/{{CSS}}/`ls -lh ../css/jquery.terminal-$(VERSION).css | cut -d' ' -f5`B/" -e "s/{{CSSMIN}}/`ls -lh ../css/jquery.terminal-$(VERSION).min.css | cut -d' ' -f5`B/" -e "s/{{UNIX}}/`ls -lh ../js/unix_formatting.js | cut -d' ' -f5`B/" index.php.in > index.php

api_reference.php: ../.$(VERSION) api_reference.php.in
	sed -e "s/{{VER}}/$(VERSION)/g" api_reference.php.in > api_reference.php

examples.php: ../.$(VERSION) examples.php.in
	sed -e "s/{{VER}}/$(VERSION)/g" examples.php.in > examples.php

js/jquery.terminal.min.js: ../js/jquery.terminal.min.js
	cp ../js/jquery.terminal.min.js js/jquery.terminal.min.js

css/jquery.terminal.css: ../css/jquery.terminal.css
	cp ../css/jquery.terminal.css css/jquery.terminal.css


upload: .upload/service.php .upload/notification.rss .upload/api_reference.php .upload/examples.php .upload/jquery.terminal.min.js .upload/jquery.terminal-src.js .upload/jquery.terminal-$(VERSION).min.js .upload/jquery.terminal-$(VERSION).js .upload/jquery.terminal-$(VERSION).css .upload/jquery.terminal.min.css .upload/jquery.terminal-$(VERSION).min.css .upload/jquery.terminal.css .upload/style.css .upload/index.php .upload/unix_formatting.js

.upload/unix_formatting.js: ../js/unix_formatting.js
	@$(call UPLOAD, ../js/unix_formatting.js,/js/)
	@touch .upload/unix_formatting.js

.upload/jquery.terminal.css: css/jquery.terminal.css
	@$(call UPLOAD, css/jquery.terminal.css,/css/)
	@touch .upload/jquery.terminal.css

.upload/service.php: service.php
	@$(call UPLOAD, service.php,/)
	@touch .upload/service.php

.upload/notification.rss: notification.rss
	@$(call UPLOAD, notification.rss,/)
	@touch .upload/notification.rss

.upload/index.php: index.php
	@$(call UPLOAD, index.php,/)
	@touch .upload/index.php

.upload/jquery.terminal-src.js: ../js/jquery.terminal-src.js
	@$(call UPLOAD, ../js/jquery.terminal-src.js,/js/)
	@touch .upload/jquery.terminal-src.js

.upload/jquery.terminal.min.js: ../js/jquery.terminal.min.js
	@$(call UPLOAD, ../js/jquery.terminal.min.js,/js/)
	@touch .upload/jquery.terminal.min.js

.upload/jquery.terminal-$(VERSION).min.js: ../js/jquery.terminal-$(VERSION).min.js
	@$(call UPLOAD, ../js/jquery.terminal-$(VERSION).min.js,/js/)
	@touch .upload/jquery.terminal-$(VERSION).min.js

.upload/jquery.terminal-$(VERSION).js: ../js/jquery.terminal-$(VERSION).js
	@$(call UPLOAD, ../js/jquery.terminal-$(VERSION).js,/js/)
	@touch .upload/jquery.terminal-$(VERSION).js

.upload/jquery.terminal-$(VERSION).css: ../css/jquery.terminal-$(VERSION).css
	@$(call UPLOAD, ../css/jquery.terminal-$(VERSION).css,/css/)
	@touch .upload/jquery.terminal-$(VERSION).css

.upload/jquery.terminal-$(VERSION).min.css: ../css/jquery.terminal-$(VERSION).min.css
	@$(call UPLOAD, ../css/jquery.terminal-$(VERSION).min.css,/css/)
	@touch .upload/jquery.terminal-$(VERSION).min.css

.upload/jquery.terminal.min.css: ../css/jquery.terminal.min.css
	@$(call UPLOAD, ../css/jquery.terminal.min.css,/css/)
	@touch .upload/jquery.terminal.min.css

.upload/style.css: css/style.css
	@$(call UPLOAD, css/style.css,/css/)
	@touch .upload/style.css

.upload/api_reference.php: api_reference.php
	@$(call UPLOAD, api_reference.php,/)
	@touch .upload/api_reference.php

.upload/examples.php: examples.php
	@$(call UPLOAD, examples.php,/)
	@touch .upload/examples.php
