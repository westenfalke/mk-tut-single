# 
include .platform-file-vars.mk 
XSLASH := $(FILE_SEP_CHAR)
include .common.mk

PROJECT_DIR  != $(PWD)
PROJECT_NAME := example
BASE_DIR  := $(PROJECT_DIR)$(XSLASH)$(PROJECT_NAME)
MAKE_BASE_DIR := $(BASE_DIR)$(XSLASH)workspace
LOCK_DIR = $(MAKE_BASE_DIR)$(XSLASH)loc
INSTALL_TEMPLATE := $(BASE_DIR)$(XSLASH)templates
STATIC_CONTENT_DIR := $(BASE_DIR)$(XSLASH)static
INSTALL_EXAMPLE := $(LOCK_DIR)/example-installed# $(INSTALL_TEMPLATE)$(XSLASH)static-example.mk $(STATIC_CONTENT_DIR)$(XSLASH)EXAMPLE-MIT-LICENSE 
PUBLIC_DIST_DIR := $(BASE_DIR)$(XSLASH)public
EXAMPLE_ARCHIVE=.example.tgz
TEMPLATE_ARCHIVE=.base-templates.tgz


CREATE_BASE_DIRS := $(MAKE_BASE_DIR) $(LOCK_DIR) $(STATIC_CONTENT_DIR) $(PUBLIC_DIST_DIR) $(INSTALL_TEMPLATE)

.PHONE : all
all : 
	@$(ECHO) $(CREATE_BASE_DIRS)

$(CREATE_BASE_DIRS) : 
	@[ -d $@ ] || $(MKDIR-PV) $@

new_project : $(CREATE_BASE_DIRS)

new_example_project :  new_project $(INSTALL_EXAMPLE) 

$(INSTALL_EXAMPLE) :  
	@$(ECHO) $@ :
	@$(ECHO) unpacking \'$(EXAMPLE_ARCHIVE)\' into \'$(BASE_DIR)\'
	@$(TAR--EXTRACT--VERBOSE-GZIP-FILE_)$(EXAMPLE_ARCHIVE) -C $(BASE_DIR)
	$(TOUCH) $@

$(INSTALL_TEMPLATE) :
	@$(ECHO) $@ :
	@$(ECHO) unpacking \'$(TEMPLATE_ARCHIVE)\' into \'$(BASE_DIR)\'
	@$(TAR--EXTRACT--VERBOSE-GZIP-FILE_)$(TEMPLATE_ARCHIVE) -C $(BASE_DIR)

clean: 
	@$(ECHO) 'DON´T DO THIS'
	exit 38
