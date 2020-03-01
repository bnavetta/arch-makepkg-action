FROM archlinux/base:latest

RUN pacman -S base-devel namcap

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
