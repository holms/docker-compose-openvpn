all:
	eval $(docker-machine env yourserver)
	docker-compose run --rm openvpn-server ovpn_genconfig -u udp://vpn.mydomain.lt
	docker-compose run --rm openvpn-server ovpn_initpki
	docker-compose run --rm openvpn-server easyrsa build-client-full mydomain.lt nopass
	docker-compose run --rm openvpn-server ovpn_getclient mydomain.lt > mydomain.lt.ovpn
