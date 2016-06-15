#!/bin/sh
# Modify loop to copy html and cgi when there are updates ('newer than' the origina) or copy all; update from q3.sh 
mkdir -p ~/public_cgi/cgi ~/public_html/html 
cd ~/my_project
if COPY_ALL=1; then 
	cp -r cgi/* ~public_cgi/cgi
	
        cp -r html/* ~public_html/html
        
else
        test html/* -nt ~public_html/html; do
                cp -r html/* ~public_html/html
        done

        test cgi/* -nt ~public_cgi/cgi: do
                cp -r cgi/* ~public_gi/cgi
        done
fi
