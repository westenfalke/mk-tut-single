include ../.common.mk

MK_STEP := 0
CONTENT := dynamic-example.mk static-example.mk

all : 
	$(ECHO) $(CONTENT)
	$(ECHO-N) $(CONTENT) | $(XARGS) -d ' ' -n1 -I{} $(MAKE) --makefile={}

.DEFAULT_GOAL := all