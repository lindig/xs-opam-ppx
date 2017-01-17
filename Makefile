#
# Docker container for developing XenServer packages in the context
# of the new ppx-based IDL
#

NAME = lindig/xs-opam-ppx

all:	Dockerfile
	docker build -t $(NAME) .


