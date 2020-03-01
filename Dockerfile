FROM archlinux/base:latest

RUN pacman -Syu --noconfirm base-devel namcap

RUN useradd -M archbuilder

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
