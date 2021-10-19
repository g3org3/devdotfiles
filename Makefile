.PHONY: install sync check

hosts: hosts.template bin/bootstrap
	bin/bootstrap
	
install: hosts

sync: install
	sudo pwd
	ansible-playbook site.yml

check: install
	ansible-playbook --check site.yml
