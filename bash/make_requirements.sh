#!/bin/bash

echo "# local package" >> ../requirements.txt
echo "-e ." >> ../requirements.txt

echo "# external requirements" >> ../requirements.txt
pip freeze >> ../requirements.txt