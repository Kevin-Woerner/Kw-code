#! /usr/bin/make -f
#    Copyright (C) 2015-2020 by Kevin D. Woerner
# 2020-08-19 kdw  comment change
# 2020-07-17 kdw  simplified
# 2015-09-20 kdw  created

include ../Makefile.makedir

TARGETS:=all_kwfwips
include $(MAKEDIR)/Makefile.beg
# defined in above file: k?dir_We?rks?hc k?dir_kw
##################################################### FWIP CODE #
#******* THE ORDER OF THE FOLLOWING SUFFIXES IS IMPORTANT
FWIP_SUFOTH:=.h .pm .units .bc .vb .c .rpn .py .varylog .bas
FWIP_SUFFIXP:=.fwipp
FWIP_SUFFIXO:=.fwip

all : all_kwfwips

KW_FWIP_NAMES:=Kw Kwelements Kwplanets Kwsun
FWIP_D_FILES:=$(addprefix $(kdir_dep)/,\
      $(addsuffix $(FWIP_SUFFIXP).d,$(KW_FWIP_NAMES)))
KW_FWIP_TARGETS:=$(addprefix $(kdir_codekdw_kw_lib)/,\
   $(foreach sffy,$(FWIP_SUFOTH) $(FWIP_SUFFIXP),\
      $(addsuffix $(sffy),$(KW_FWIP_NAMES))))
.PRECIOUS: $(KW_FWIP_TARGETS)

ifeq ($(KWC_SHC),$(HOSTNAME))
   WORKSHC_FILES:=$(patsubst $(kdir_codekdw_kw_lib)/%,\
         $(kdir_workshc_lib_kw)/%,$(KW_FWIP_TARGETS))
   $(kdir_workshc_lib_kw)/% : $(kdir_bindir_include)/%
	$(CP) $< $@
	$(CHMOD) --reference=$< $@
else
   WORKSHC_FILES:=
endif

LV_TARGETS:=$(WORKSHC_FILES) $(ALL_BISON_TARGETS) \
      $(LIBKW_ALL) $(KW_FWIP_TARGETS) \
      $(addprefix $(kdir_obj)/,$(addsuffix .o,$(KW_FWIP_NAMES)))\
      $(addprefix $(kdir_dep)/,$(addsuffix .d,$(KW_FWIP_NAMES)))\
   $(patsubst $(kdir_codekdw_kw_lib)/%, \
         $(kdir_bindir_include)/%, $(KW_FWIP_TARGETS))

.PHONY : all_kwfwips

define mdfd_fwipp_translate
   $(FWIP_TRANSLATOR) $< \
            --$(patsubst .%,%,$(1)) -n$(basename $(notdir $@)) \
      | $(KWSS_VKKCP_SH) $< $@ > $@
endef

$(addprefix %,$(FWIP_SUFOTH)) : %$(FWIP_SUFFIXP)
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 640 $@

$(kdir_dep)/%$(FWIP_SUFFIXP).d : $(srcdir)/%$(FWIP_SUFFIXO) \
   $(KWSS_VKKCP_SH) $(kfil_dep)
	$(ECHO) $(patsubst $(kdir_dep)/%.d, \
            $(kdir_codekdw_kw_lib)/%,$@) \
      ": \\" > $@
	$(PERL) -ne \
      "if(s~\?INSERT_FILE\s+\"(\S+?)\"\?.* \
            ~   $(srcdir)/\$$1\\\\~x){print}" \
      $< >> $@

include $(MAKEDIR)/Makefile.end

define mdfd_inc
   $(addprefix $(srcdir)/,$(shell $(PERL) -ne \
      "if(s/\?INSERT_FILE \"(\S+?)\"\?.*/$$1/){print}" \
      $(srcdir)/$(1)$(FWIP_SUFFIXO)))
endef

define mdfd_create
   $(ECHO) -e \
"#    Copyright (C)" $(shell date +%Y) "by Kevin D. Woerner\\n#"\
$(shell date +%Y-%m-%d) "kdw  Created by" \
$(lastword $(MAKEFILE_LIST)) \
   | $(PERL) -pe "s@$(TMPDIR)@TMPDIR@"
endef

$(kdir_codekdw_kw_lib)/%$(FWIP_SUFFIXP) : \
   $(srcdir)/%$(FWIP_SUFFIXO)  $(kdir_dep)/%$(FWIP_SUFFIXP).d \
   $(FWIP_PREPROCESS) $(FWIP_TAB) $(FWIP_FORMATY) \
   $(FWIP_WRAP)
	$(FWIP_PREPROCESS) $< > $(kdir_fwip)/$(@F).pp
	$(ECHO) "MAKELISTA=" $(MAKEFILE_LIST)
	$(CAT) $(kdir_fwip)/$(@F).pp | $(FWIP_TAB) \
   > $(kdir_fwip)/$(@F).parse
	$(call mdfd_create) > $@
	$(FWIP_FORMATY) $(kdir_fwip)/$(@F).parse | $(FWIP_WRAP) >> $@
	$(CHMOD) 640 $@

$(addprefix %,$(FWIP_SUFOTH)) : %$(FWIP_SUFFIXP) \
   $(FWIP_TRANSLATOR)
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 640 $@

$(kdir_codekdw_kw_lib)/%.py      \
   : $(kdir_codekdw_kw_lib)/%$(FWIP_SUFFIXP) $(FWIP_TRANSLATOR)
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 750 $@

$(kdir_codekdw_kw_lib)/%.pm      \
$(kdir_codekdw_kw_lib)/%.h       \
$(kdir_codekdw_kw_lib)/%.bc      \
$(kdir_codekdw_kw_lib)/%.bas     \
$(kdir_codekdw_kw_lib)/%.units   \
$(kdir_codekdw_kw_lib)/%.rpn     \
$(kdir_codekdw_kw_lib)/%.vb      \
   : $(kdir_codekdw_kw_lib)/%$(FWIP_SUFFIXP) $(FWIP_TRANSLATOR) \
      $(MAKEFILE_LIST)
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 640 $@

$(kdir_codekdw_kw_lib)/%.c  \
   : $(kdir_codekdw_kw_lib)/%$(FWIP_SUFFIXP) $(FWIP_TRANSLATOR) \
      $(kdir_codekdw_kw_lib)/%.h
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 640 $@

$(kdir_codekdw_kw_lib)/%.fw  \
   : $(kdir_codekdw_kw_lib)/%$(FWIP_SUFFIXP)
	$(GREP) -vP "^ *# \d{4}-\d\d-\d\d kd(pw|w ) " $< > $@

$(kdir_codekdw_kw_lib)/%.varylog \
   : $(kdir_codekdw_kw_lib)/%$(FWIP_SUFFIXP) $(FWIP_TRANSLATOR)
	$(ECHO) "MAKELISTC=" $(MAKEFILE_LIST)
	$(call mdfd_create) > $@
	$(CAT) $< \
            | $(GREP) -E "^# ([0-9]{4}(-[0-3][0-9]){2} kdw  )" \
            | $(PERL) -pe "s/\$(FWIP_SUFFIXO)\\b//;\
      s/(.*:)(.*\\skdw\\s\\s)/$$2$$1/;"\
            | $(SORT) -r \
            | $(KWSS_VKKCP_SH) $< $@ >> $@
	$(CHMOD) 640 $@
	$(CP) $@ $(kdir_bindir_include)/$(notdir $@)

.PHONY: kwfwips_fwipp kwfwips_h kwfwips_kw kwfwips_all

all_kwfwips :
	$(MAKE) -j kwfwips_h
	$(MAKE) -j kwfwips_all

kwfwips_fwipp: $(foreach kwn,$(KW_FWIP_NAMES),\
      $(kdir_codekdw_kw_lib)/$(kwn)$(FWIP_SUFFIXP))
kwfwips_h: $(foreach kwn,$(KW_FWIP_NAMES),\
      $(kdir_codekdw_kw_lib)/$(kwn).h) kwfwips_fwipp
kwfwips_kw : $(foreach kwn,$(KW_FWIP_NAMES),\
      $(foreach suf,$(filter-out .h,$(FWIP_SUFOTH)),\
               $(kdir_codekdw_kw_lib)/$(kwn)$(suf))) kwfwips_h
kwfwips_all : $(filter-out $(kdir_codekdw_kw_lib)/%, \
            $(LV_TARGETS)) kwfwips_kw

$(kdir_dep)/%.d : $(kdir_codekdw_kw_lib)/%.c \
   $(kdir_codekdw_kw_lib)/%.h

.PHONY : lv_realclean
realclean : lv_realclean
lv_realclean :
	$(RM) $(LV_TARGETS)

ifeq ($(origin MAKECMDGOALS),undefined)
   -include $(FWIP_D_FILES)
else   # ifeq ($(origin MAKECMDGOALS),undefined)
   ifneq ($(MAKECMDGOALS:%clean=clean),clean)
      -include $(FWIP_D_FILES)
   endif   # ifneq ($(MAKECMDGOALS:%clean=clean),clean)
endif   # ifeq ($(origin MAKECMDGOALS),undefined)
