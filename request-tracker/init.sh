podman compose run --rm rt bash -c 'cd /opt/rt && perl ./sbin/rt-setup-database --dba rtuser --dba-password rtpass --action init --skip-create'
podman compose up -d