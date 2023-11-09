#!/bin/bash

curl -X PUT -d collection=supermarket -d max=100.5 -d new_price=55.23 localhost:8000/products