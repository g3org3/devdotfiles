.PHONY: install sync check

hosts: hosts.template requirements.yml bin/bootstrap
	bin/bootstrap

install: hosts

sync: install
	ansible-playbook site.yml

check: install
	ansible-playbook --check site.yml
