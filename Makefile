.PHONY: clean data requirements sync_data_to_s3 sync_data_from_s3

#################################################################################
# GLOBALS                                                                       #
#################################################################################

# PROJECT_NAME = {{ project name }}
PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
# BUCKET = {{ bucket name }}
PROFILE = default
PYTHON_INTERPRETER = python3

#################################################################################
# COMMANDS                                                                      #
#################################################################################

jupyter:
	jupyter lab --port=8888 --no-browser --ip=0.0.0.0 --allow-root

## Install Python Dependencies
requirements:
	$(PYTHON_INTERPRETER) -m pip install -U pip setuptools wheel
	$(PYTHON_INTERPRETER) -m pip install -r requirements.txt

build_requirements:
	bash/make_requirements.sh

terminal_flair:
	bash/set_dotfiles.sh

## Delete all compiled Python files
clean: black
	find . -name "*.py" -exec sed -i '/^#/! /ipdb/d' {} + 
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete
	find . -type d -name ".ipynb_checkpoints" | xargs rm -rf

black:
	black src/.

## Upload Data to S3
sync_data_to_s3:
ifeq (default,$(PROFILE))
	aws s3 sync data/ s3://$(BUCKET)/data/
else
	aws s3 sync data/ s3://$(BUCKET)/data/ --profile $(PROFILE)
endif

## Download Data from S3
sync_data_from_s3:
ifeq (default,$(PROFILE))
	aws s3 sync s3://$(BUCKET)/data/ data/
else
	aws s3 sync s3://$(BUCKET)/data/ data/ --profile $(PROFILE)
endif