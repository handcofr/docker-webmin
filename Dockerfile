FROM alpine

ARG	webmin_version=1.890

RUN 	apk update && \
	apk add --no-cache ca-certificates openssl perl perl-net-ssleay expect && \
	mkdir /opt && \
	cd /opt && \
	wget -q -O - "https://prdownloads.sourceforge.net/webadmin/webmin-$webmin_version.tar.gz" | tar xz && \
	ln -sf /opt/webmin-$webmin_version /opt/webmin	

WORKDIR	/opt/webmin

COPY	conf/setup.exp setup.exp

RUN 	/usr/bin/expect ./setup.exp && \
	rm setup.exp && \
	apk del expect
RUN 	apk add procps python3 && \
	wget https://raw.githubusercontent.com/christgau/wsdd/master/src/wsdd.py

VOLUME	["/etc/webmin" , "/var/webmin"]

CMD ["/etc/webmin/start", "--nofork"]
	
