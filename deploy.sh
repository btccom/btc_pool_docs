# !/bin/bash
git pull origin master >> /tmp/log || { echo "pull error" && exit 0 }