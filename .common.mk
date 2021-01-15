# PLATFORM DEPENDET FILE VAR
# CMD MACROS    
BASENAME                         := /usr/bin/basename
BASH                             := /usr/bin/bash
CAT                              := /usr/bin/cat
CP                               := /usr/bin/cp
CP--VERBOSE                      := $(CP) --verbose
CP--VERBOSE--RECURSIVE           := $(CP) --verbose --recursive
DATE--ISO-8601_NANOSEC           := /usr/bin/date --iso-8601=ns
DATE--ISO-8601_SEC               := /usr/bin/date --iso-8601=second
ECHO                             := /usr/bin/echo
ECHO-N                           := $(ECHO) -n
FIND                             := /usr/bin/find
GREP                             := /usr/bin/grep
HEAD                             := /usr/bin/head
HASH-BANG                        := #!/usr/bin/bash
LS                               := /usr/bin/ls
MKDIR                            := /usr/bin/mkdir
MKDIR-P                          := $(MKDIR) -p
MKDIR-PV                         := $(MKDIR) -pv
MOVE                             := /usr/bin/mv
MOVE--VERBOSE                    := $(MOVE) --verbose
MOVE--VERBOSE--BACKUP_N          := $(MOVE) --verbose --backup=numbered
PWD                              := /usr/bin/pwd
READLINK-F                       := /usr/bin/readlink -f
RM                               := /usr/bin/rm
RM-R                             := $(RM) -r
RM-RI                            := $(RM) -ri
RM-RF                            := $(RM) -rf
RM-RFV                           := $(RM) -rfv
TAR                              := /usr/bin/tar
TAR-XVZF                         := $(TAR) -xvzf
TAR--EXTRACT--VERBOSE-GZIP-FILE_ := $(TAR) --extract --verbose --gzip --file=
TEE                              := /usr/bin/tee
TEE-A                            := $(TEE) -a
TEE-A-TARGET                     := $(TEE) -a $@ 
TREE                             := /usr/bin/tree
TOUCH                            := /usr/bin/touch
TOP                              := /usr/bin/top
TR                               := /usr/bin/tr
TOUPPER                          := $(TR) '[:lower:]' '[:upper:]'
TOLOWER                          := $(TR)  '[:upper:]' '[:lower:]'
TRUNCATE                         := /usr/bin/truncate
TRUNCATE--SIZE_ZERO              := $(TRUNCATE) --size=0
TRUNCATE--NO-CREATE              := $(TRUNCATE) --no-create
TRUNCATE--SIZE_ZERO--NO-CREATE   := $(TRUNCATE--SIZE_ZERO) --no-create
# SHELL FORMAT MACROS to optimize output for markdown
BASH-END                         := @$(ECHO) '```'
VIM-END                          := @$(ECHO) '```'
SHELL-END                        := @$(ECHO) '```'
SHELL-REM                        := @$(ECHO) '\#'
BASH-FAKE-OUT                    := @$(ECHO-N) 'pastNcopy@ducktap \# '; $(CAT)
IMPORT-MD                        := @$(CAT)
BASH-PROMPT                      := @$(ECHO-N) '\# '
BASH-PROMPT-EMPTY                := @$(ECHO) '\# _'
SHELL-START                      := @$(ECHO) '```shell'
VIM-START                        := @$(ECHO) '```vim'
BASH-START                       := @$(ECHO) '```bash'
