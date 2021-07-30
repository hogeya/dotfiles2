MKDIR     = mkdir $(MKDIR_OPT)
MKDIR_OPT = -p
LN        = ln $(LN_OPT)
LN_OPT    = -sfn
RM        = rm $(RM_OPT)
RM_OPT    = -rf

define link
	$(MKDIR) $(dir $2)
	$(LN) $(realpath $1) $2
endef

zplug: zsh
	git clone \
		https://github.com/zplug/zplug \
		~/.zsh/zplug
.PHONY: zplug

local:
	$(MKDIR) ~/.local
	touch ~/.local/vimrc
	touch ~/.local/zshrc
.PHONY: local

nvim:
	$(call link,nvim,~/.config/nvim)
	$(call link,nvim/init.vim,~/.config/nvim/init.vim)
.PHONY: nvim

zsh:
	$(call link,zsh/.zshenv,~/.zshenv)
	$(call link,zsh/.zshrc,~/.zshrc)
	export ZDOTDIR=$HOME/.zshrc
.PHONY: zsh

tmux:
	$(call link,tmux/.tmux.conf,~/.tmux.conf)
.PHONY: tmux

hammerspoon:
	$(MKDIR) ~/.hammerspoon
	git clone https://github.com/agzam/spacehammer ~/.hammerspoon
.PHONY: hammerspoon
