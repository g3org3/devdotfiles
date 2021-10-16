.PHONY: install sync check

hosts: hosts.template bin/bootstrap
	bin/bootstrap
	sed -i s.pcazrlu01000.$$(hostname).g site.yml

install: hosts

sync: install
	ansible-playbook site.yml

check: install
	ansible-playbook --check site.yml
