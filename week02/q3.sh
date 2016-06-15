#! /bin/sh
#question3 – modify loop for copying html and cgi from q2.sh and update file if newer than original

mkdir -p ~/public_html/html ~/public_cgi/cgi
cd ~/my_project
test html/* -nt ~public_html/html; do
        cp -r html/* ~public_html/html
done

test cgi/* -nt ~public_cgi/cgi: do
        cp -r cgi/* ~public_cgi/cgi
done

