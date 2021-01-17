include ../.common.mk

MK_STEP := 0
CONTENT := static-example

all : 
	$(ECHO) $(CONTENT)

$(CONTENT) :
	$(MAKE) --makefile=$@.mk

.DEFAULT_GOAL := $(CONTENT)