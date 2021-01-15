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
INSTALL_EXAMPLE := $(LOCK_DIR)/example-installed
PUBLIC_DIST_DIR := $(BASE_DIR)$(XSLASH)public
BUILD_DIR := $(BASE_DIR)$(XSLASH)build
EXAMPLE_ARCHIVE=.example.tgz
TEMPLATE_ARCHIVE=.base-templates.tgz


BASE_DIR_S := $(MAKE_BASE_DIR) $(LOCK_DIR) $(STATIC_CONTENT_DIR) $(PUBLIC_DIST_DIR)  $(BUILD_DIR)

# no purpose yet, but to display $(BASE_DIR_S)
.PHONY : all
all : 
	@$(ECHO) $(BASE_DIR_S)

# create the default folder srtucture
$(BASE_DIR_S) : 
	@[ -d $@ ] || $(MKDIR-PV) $@


# create a folder $(PROJECT_NAME) in $(PROJECT_DIR) with folder structure 
# originating fom $(BASE_DIR_S) 
new_project : $(BASE_DIR_S)

new_example_project :  new_project $(INSTALL_EXAMPLE)


$(INSTALL_EXAMPLE) :  
	@$(ECHO) unpacking \'$(EXAMPLE_ARCHIVE)\' into \'$(BASE_DIR)\'
	@$(TAR--SKIP-OLD-FILES-XVZF)$(EXAMPLE_ARCHIVE) -C $(BASE_DIR)
	$(TOUCH) $@

# extract $(TEMPLATE_ARCHIVE) into the $(BASE_DIR_S) starting in $(BASE_DIR)
# to avoid a dependency to the $(PROJECT_NAME) an therefore the $(BASE_DIR)
$(INSTALL_TEMPLATE) :
	@$(ECHO) unpacking \'$(TEMPLATE_ARCHIVE)\' into \'$(BASE_DIR)\'
	@$(TAR--SKIP-OLD-FILES-XVZF)$(TEMPLATE_ARCHIVE) -C $(BASE_DIR)

# deprives $(BUILD_DIR) noisily from all build stuff
clean: 
	$(RM-RFV) RM-RFV$(XSLASH)*
