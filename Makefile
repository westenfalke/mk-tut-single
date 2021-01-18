include .platform.mk
include .cmd.mk
include .common.mk
include .project.mk

# no purpose yet, but to display $(BASE_DIR_S)
.PHONY : all
all : 
	@$(ECHO) $(BASE_DIR_S)

# create the default folder srtucture
$(BASE_DIR) $(BASE_DIR_S) $(CONFIG_DIR_S): 
	@[ -d $@ ] || $(MKDIR-PV) $@

$(PROJECT_CONFIG_FILE): $(BASE_DIR)
	$(ECHO) '# PRO VARS'                     > $(BASE_DIR)$(XSLASH).common.mk
	$(ECHO) PROJECT_NAME := $(PROJECT_NAME) >> $(BASE_DIR)$(XSLASH).common.mk
	$(ECHO) PROJECT_DIR  := $(PROJECT_DIR)  >> $(BASE_DIR)$(XSLASH).common.mk
	$(CAT) $(REPO_DIR)$(XSLASH).platform.mk >> $(BASE_DIR)$(XSLASH).common.mk
	$(CAT) $(REPO_DIR)$(XSLASH).project.mk  >> $(BASE_DIR)$(XSLASH).common.mk
	$(CAT) $(REPO_DIR)$(XSLASH).cmd.mk      >> $(BASE_DIR)$(XSLASH).common.mk

# create a folder $(PROJECT_NAME) in $(PROJECT_DIR) with folder structure 
# originating fom $(BASE_DIR_S) 
new_project : $(BASE_DIR_S) $(PROJECT_CONFIG_FILE) $(INSTALL_BASE)

new_example_project :  new_project $(INSTALL_EXAMPLE)

install_poc :
	$(MAKE) PROJECT_DIR=$(DEFAULT_POC_DIR) PROJECT_NAME=$(DEFAULT_POC_NAME) new_example_project

trash_project :
	$(RM-RI) $(BASE_DIR)$(XSLASH)*
	$(RM-RI) $(PROJECT_CONFIG_FILE)

uninstall_poc :
	$(MAKE) PROJECT_DIR=$(DEFAULT_POC_DIR) PROJECT_NAME=$(DEFAULT_POC_NAME) trash_project


$(INSTALL_EXAMPLE) : 
	@$(ECHO) unpacking \'$(EXAMPLE_ARCHIVE)\' into \'$(BASE_DIR)\'
	@$(TAR--SKIP-OLD-FILES-XVZF)$(EXAMPLE_ARCHIVE) -C $(BASE_DIR)
	$(TOUCH) $@

# extract $(BASE_CONFIG_ARCHIVE) into the $(BASE_DIR_S) starting in $(BASE_DIR)
# to avoid a dependency to the $(PROJECT_NAME) an therefore the $(BASE_DIR)
$(INSTALL_BASE) :
	@$(ECHO) unpacking \'$(BASE_CONFIG_ARCHIVE)\' into \'$(BASE_DIR)\'
	@$(TAR--SKIP-OLD-FILES-XVZF)$(BASE_CONFIG_ARCHIVE) -C $(BASE_DIR)
	$(TOUCH) $@

import_tgz	: $(BASE_DIR) $(CONFIG_DIR_S)
	$(TAR) -C $(BASE_DIR) -cvzf $(EXAMPLE_ARCHIVE) workspace/static-example.mk workspace/Makefile
	$(RM-RFV) $(BASE_EXAMPLE_DIR)/*
	$(TAR-XVZF) $(EXAMPLE_ARCHIVE) -C $(BASE_EXAMPLE_DIR)
	$(TAR) -C $(BASE_DIR) -cvzf $(BASE_CONFIG_ARCHIVE)    templates/static.mk static/README.md 
	$(RM-RFV) $(BASE_CONFIG_DIR)/*
	$(TAR-XVZF) $(BASE_CONFIG_ARCHIVE) -C $(BASE_CONFIG_DIR)

import_tgz_from_poc :
	$(MAKE) PROJECT_DIR=$(DEFAULT_POC_DIR) PROJECT_NAME=$(DEFAULT_POC_NAME) import_tgz


# deprives $(BUILD_DIR) noisily from all build stuff
clean: 
	$(RM-RFV) RM-RFV$(XSLASH)*
