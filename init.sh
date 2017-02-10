#!/usr/bin/env bash

# NGINX settings
sudo rm -rf /etc/nginx/sites-enabled/*
sudo chmod 777 nginx.conf
sudo cp -v nginx.conf /etc/nginx/sites-enabled/nginx.conf
sudo nginx -t
sudo /etc/init.d/nginx restart

# Supervisor settings
sudo unlink /var/run/supervisor.sock
sudo cp -v gunicorn.conf /etc/supervisor/conf.d/
sudo alias supervisorctl="supervisorctl -c /etc/supervisor/supervisord.conf"

# Create a systemd Unit File
sudo cp -v ViberBot.service /etc/systemd/system/
sudo systemctl enable ViberBot.service
sudo systemctl start ViberBot.service
sudo systemctl daemon-reload


