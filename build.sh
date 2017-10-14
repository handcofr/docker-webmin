#/bin/bash
WEBMIN_VERSION=1.850

docker build . --tag handco/webmin:$WEBMIN_VERSION --build-arg webmin_version=$WEBMIN_VERSION


