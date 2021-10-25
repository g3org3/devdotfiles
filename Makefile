.PHONY: install sync check

hosts: hosts.template bin/bootstrap
	bin/bootstrap

install: hosts

sync: install
# It does not work to use -K to ask for the sudo password
# because the DBG machines will need for 2 different passwords
	@sudo pwd
	ansible-playbook site.yml

check: install
	ansible-playbook --check site.yml
