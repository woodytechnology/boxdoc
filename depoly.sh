#!/bin/sh
gitbook build
scp -r _book kaive@wuyun.pro:/home/kaive/boxdoc && ssh kaive@wuyun.pro 'sudo rm -rf /usr/share/nginx/html/boxdoc;sudo mv /home/kaive/boxdoc /usr/share/nginx/html/boxdoc'