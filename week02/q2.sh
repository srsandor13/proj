#!/bin/sh
#q2 - loop to copy html and cgi from q1.sh

mkdir -p ~/public_html/html ~/public_cgi/cgi
cd ~/my_project
until cp -r html/* ~public_html/html; do
        echo "copy failed this entry – now retrying"
        sleep 5
done

until cp -r cgi/* ~public_cgi/cgi; do
        echo "copy failed this entry – now retrying"
        sleep 5
done

