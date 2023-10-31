#!/bin/bash

# Check if the 'mongo' gem is installed
if gem list mongo -i > /dev/null 2>&1; then
  echo "The 'mongo' gem is already installed."
else
  gem install mongo
fi

ruby query_mongo.rb