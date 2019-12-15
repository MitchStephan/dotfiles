.PHONY: backup link verify

backup: verify
	@printf "backing up $(FILE): "
	@mkdir -p ~/backup_dotfiles
	mv ~/$(FILE) ~/backup_dotfiles/$(shell date +'%s')_$(FILE) || true

link: verify backup
	@printf "\ncreating symlink: "
	ln -sv $(abspath $(FILE)) ~/$(FILE)

verify:
	@test -n "$(FILE)" || (echo "must specify a FILE variable -- example: make backup FILE=filename" ; exit 1)
