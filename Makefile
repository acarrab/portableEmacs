EMACS_D = ~/.emacs.d
FILES =	loader.org \
	init.el

emacs: $(EMACS_D)
	@$(foreach f, $(FILES), cp $(f) $(EMACS_D)/$(f) ;)
	@$(foreach f, $(FILES), echo cp $(f) $(EMACS_D)/$(f) ;)

$(EMACS_D):
	mkdir -p $(EMACS_D)
github:
	@$(foreach f, $(FILES), cp $(EMACS_D)/$(f) $(f) ;)
	@$(foreach f, $(FILES), echo cp $(EMACS_D)/$(f) $(f) ;)

readme:
	python ./genReadme.py
clean:
	rm *~
