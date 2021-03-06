# default PRO VARS (sould to be overwritten vi cli parameter)

DEFAULT_PROJECT_DIR ?= /tmp
DEFAULT_PROJECT_NAME ?= POC

ifdef PROJECT_DIR
$(info  PROJECT_DIR="$(PROJECT_DIR)")
else
$(info Missing parameter: PROJECT_DIR="$(PROJECT_DIR)")
PROJECT_DIR  := $(DEFAULT_PROJECT_DIR)
$(info  Defaul value is PROJECT_DIR="$(PROJECT_DIR)")
endif

ifdef PROJECT_NAME
$(info  PROJECT_NAME="$(PROJECT_NAME)")
else
$(info Missing parameter: PROJECT_NAME="$(PROJECT_NAME)")
PROJECT_NAME := $(DEFAULT_PROJECT_NAME)
$(info  Defaul value is PROJECT_NAME="$(PROJECT_NAME)")
endif

ifdef PROJECT_DISPLAY_NAME
$(info  PROJECT_NAME="$(PROJECT_DISPLAY_NAME)")
else
$(info Missing parameter: PROJECT_DISPLAY_NAME="$(PROJECT_DISPLAY_NAME)")
PROJECT_DISPLAY_NAME := $(PROJECT_NAME)
$(info  Defaul value is PROJECT_DISPLAY_NAME="$(PROJECT_DISPLAY_NAME)")
endif



# REPO VARS
REPO_DIR  ?= .
BASE_CONFIG_NAME := .base
BASE_EXAMPLE_NAME := .example
BASE_CONFIG_DIR := $(REPO_DIR)$(XSLASH)$(BASE_CONFIG_NAME)
BASE_EXAMPLE_DIR := $(REPO_DIR)$(XSLASH)$(BASE_EXAMPLE_NAME)
BASE_CONFIG_ARCHIVE := $(REPO_DIR)$(XSLASH)$(BASE_CONFIG_NAME).tgz
EXAMPLE_ARCHIVE := $(REPO_DIR)$(XSLASH)$(BASE_EXAMPLE_NAME).tgz

# TARGETS FOR FOLDER CREATION INSIDE OF THE REPO 
# TO REFRESH THE ACHIVES FROM A PROJECT
CONFIG_DIR_S := $(BASE_CONFIG_DIR) $(BASE_EXAMPLE_DIR)
