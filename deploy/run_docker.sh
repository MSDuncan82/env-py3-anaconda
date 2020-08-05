#! bin/bash

docker build -t test_app . && docker run -d --name test_container -p 80:80 test_app