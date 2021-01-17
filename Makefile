include .common.mk

# no purpose yet, but to display $(BASE_DIR_S)
.PHONY : all
all : 
	@$(ECHO) $(BASE_DIR_S)

# create the default folder srtucture
$(BASE_DIR) $(BASE_DIR_S) $(CONFIG_DIR_S): 
	@[ -d $@ ] || $(MKDIR-PV) $@

$(PRO_CONFIG_FILE): $(BASE_DIR) .common.mk 
	$(ECHO) PROJECT_NAME := $(PROJECT_NAME) > $(BASE_DIR)$(XSLASH).common.mk
	$(ECHO) PRO_DIR      := $(PRO_DIR)     >> $(BASE_DIR)$(XSLASH).common.mk
	$(CAT) $(REPO_DIR)$(XSLASH).common.mk  >> $(BASE_DIR)$(XSLASH).common.mk

# create a folder $(PROJECT_NAME) in $(PROJECT_DIR) with folder structure 
# originating fom $(BASE_DIR_S) 
new_project : $(PRO_CONFIG_FILE) $(BASE_DIR_S) $(INSTALL_BASE)
	$(ECHO) MAKEFILE_LIST = $(MAKEFILE_LIST)

new_example_project :  new_project $(INSTALL_EXAMPLE)
	$(ECHO) MAKEFILE_LIST = $(MAKEFILE_LIST)

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

create_tgz	: $(BASE_DIR) $(CONFIG_DIR_S)
	$(TAR) -C $(BASE_DIR) -cvzf $(EXAMPLE_ARCHIVE) workspace/static-example.mk workspace/Makefile
	$(RM-RFV) $(BASE_EXAMPLE_DIR)/*
	$(TAR-XVZF) $(EXAMPLE_ARCHIVE) -C $(BASE_EXAMPLE_DIR)
	$(TAR) -C $(BASE_DIR) -cvzf $(BASE_CONFIG_ARCHIVE)    templates/static.mk static/README.md 
	$(RM-RFV) $(BASE_CONFIG_DIR)/*
	$(TAR-XVZF) $(BASE_CONFIG_ARCHIVE) -C $(BASE_CONFIG_DIR)

	

# deprives $(BUILD_DIR) noisily from all build stuff
clean: 
	$(RM-RFV) RM-RFV$(XSLASH)*
