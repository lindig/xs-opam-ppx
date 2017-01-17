# vim: set et:

FROM        ocaml/opam:centos-7_ocaml-4.02.3
MAINTAINER  Christian Lindig <christian.lindig@citrix.com>

COPY  files/installed .
COPY  files/yum-setup .
COPY  files/RPM-GPG-KEY-Citrix-6.6 .

RUN   sudo cp RPM-GPG-KEY-Citrix-6.6 /etc/pki/rpm-gpg
RUN   sudo ./yum-setup trunk-ring3
RUN   sudo yum install -y xen-dom0-libs-devel xen-libs-devel
RUN   opam repo add opam-repo-dev https://github.com/mseri/opam-repo-dev.git
RUN   opam repo add xs-opam https://github.com/lindig/xs-opam.git
RUN   opam depext -y $(cat installed)
RUN   opam install --use-internal-solver -y $(cat installed)


