#! /usr/bin/make -f
#    Copyright (C) 2015-2021 by Kevin D. Woerner
# 2021-05-11 kdw  *.d file work
# 2021-04-30 kdw  indent work; vkkcp deps
# 2021-03-07 kdw  var renam
# 2021-03-05 kdw  max allowed line lenght uppped to 77
# 2021-02-13 kdw  various
# 2021-02-04 kdw  add spaces to test lines
# 2020-12-02 kdw  macro syntax made more flexible
# 2020-11-28 kdw  macro syntax overhaul
# 2020-11-27 kdw  rmed temp files
# 2020-11-16 kdw  vars renamd
# 2020-11-12 kdw  simplfied
# 2020-09-03 kdw  HOS[T]NAME changed to K[W]C[N]
# 2020-08-19 kdw  comment change
# 2020-07-17 kdw  simplified
# 2015-09-20 kdw  created

include ../Makefile.makedir

TARGETS:=all_kwfwips
include $(MAKEDIR)/Makefile.beg
# defined in above file: k?dir_We?rks?hc k?dir_kw
#### #### #### #### #### #### #### #### #### #### ### FWIP CODE #
#******* THE ORDER OF THE FOLLOWING SUFFIXES IS IMPORTANT
lv_other_suf:=.h .pm .units .bc .vb .c .rpn .py .varylog .bas
lv_fwipp_suf:=.fwipp
lv_fwip_suf:=.fwip

all : all_kwfwips

lv_kwfwip_nam:=Kw Kwelements Kwplanets Kwsun Tm_Const
lv_files_kwfwip_targets:=$(addprefix $(kdir_codekdw_kw_lib)/,\
         $(foreach sffy,$(lv_other_suf) $(lv_fwipp_suf),\
         $(addsuffix $(sffy),$(lv_kwfwip_nam))))
.PRECIOUS: $(lv_files_kwfwip_targets)

ifeq ($(KWC_SHC),$(KWCN))
   lv_files_workshc:=$(patsubst $(kdir_codekdw_kw_lib)/%,\
            $(kdir_workshc_lib_kw)/%,$(lv_files_kwfwip_targets))
   $(kdir_workshc_lib_kw)/% : $(kdir_bindir_include)/%
	$(CP) $< $@
	$(CHMOD) --reference=$< $@
else
   lv_files_workshc:=
endif

lv_files_targets:=$(lv_files_workshc) $(ALL_BISON_TARGETS) \
         $(LIBKW_ALL) $(lv_files_kwfwip_targets) \
         $(addprefix $(kdir_obj)/,$(addsuffix .o,$(lv_kwfwip_nam)))\
         $(addprefix $(kdir_dep)/,$(addsuffix .d,$(lv_kwfwip_nam)))\
         $(patsubst $(kdir_codekdw_kw_lib)/%, $(kdir_bindir_include)/%,\
         $(lv_files_kwfwip_targets))

.PHONY : all_kwfwips

define mdfd_fwipp_translate
   $(FWIP_TRANSLATOR) $< --$(patsubst .%,%,$(1)) -n$(basename $(notdir $@)) \
            | $(KWSS_VKKCP_SH) $< $@ > $@
endef

$(addprefix %,$(lv_other_suf)) : %$(lv_fwipp_suf) \
         $(FWIP_TRANSLATOR) $(KWSS_VKKCP_SH)
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 640 $@

$(kdir_dep)/%$(lv_fwipp_suf).d : $(srcdir)/%$(lv_fwip_suf) $(kfil_dep) \
         $(KWSS_VKKCP_SH)
	$(ECHO) $(patsubst %$(lv_fwip_suf), \
         $(kdir_codekdw_kw_lib)/%$(lv_fwipp_suf),$<) ": \\" > $@
	$(PERL) -ne "if (s~\{INSERT_FILE\s+\"(\S+?)\"\s*\}.*\
         ~$(srcdir)/\$$1\\\\~x) {print}" $< >> $@

#$(ECHO) "$<: \\" > $@

include $(MAKEDIR)/Makefile.end

define mdfd_inc
   $(addprefix $(srcdir)/,$(shell $(PERL) -ne \
            "if (s~\{INSERT_FILE\s+\"(\S+?)\"\}.*~$$1~) {print}" \
            $(srcdir)/$(1)$(lv_fwip_suf)))
endef

define mdfd_create
   $(ECHO) -e \
            "#    Copyright (C)" $(shell date +%Y) "by Kevin D. Woerner\\n#"\
$(shell date +%Y-%m-%d) "kdw  Created by" $(lastword $(MAKEFILE_LIST)) \
         | $(PERL) -pe "s@$(TMPDIR)@TMPDIR@"
endef

$(kdir_codekdw_kw_lib)/%$(lv_fwipp_suf) : $(srcdir)/%$(lv_fwip_suf) \
         $(kdir_dep)/%$(lv_fwipp_suf).d $(FWIP_PREPROCESS) $(FWIP_TAB) \
         $(FWIP_FORMATY) $(FWIP_WRAP)
	$(call mdfd_create) > $@
	$(FWIP_PREPROCESS) $< | $(FWIP_TAB) | $(FWIP_FORMATY) \
         | $(FWIP_WRAP) >> $@
	$(CHMOD) 640 $@

$(addprefix %,$(lv_other_suf)) : %$(lv_fwipp_suf) \
         $(FWIP_TRANSLATOR) $(KWSS_VKKCP_SH)
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 640 $@

$(kdir_codekdw_kw_lib)/%.py : $(kdir_codekdw_kw_lib)/%$(lv_fwipp_suf) \
         $(FWIP_TRANSLATOR) $(KWSS_VKKCP_SH)
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 750 $@

$(kdir_codekdw_kw_lib)/%.pm      \
$(kdir_codekdw_kw_lib)/%.h       \
$(kdir_codekdw_kw_lib)/%.bc      \
$(kdir_codekdw_kw_lib)/%.bas     \
$(kdir_codekdw_kw_lib)/%.units   \
$(kdir_codekdw_kw_lib)/%.rpn     \
$(kdir_codekdw_kw_lib)/%.vb      : $(kdir_codekdw_kw_lib)/%$(lv_fwipp_suf) \
         $(MAKEFILE_LIST) $(FWIP_TRANSLATOR) $(KWSS_VKKCP_SH)
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 640 $@

$(kdir_codekdw_kw_lib)/%.c : $(kdir_codekdw_kw_lib)/%$(lv_fwipp_suf) \
         $(kdir_codekdw_kw_lib)/%.h $(FWIP_TRANSLATOR) $(KWSS_VKKCP_SH)
	$(call mdfd_fwipp_translate,$(suffix $@))
	$(CHMOD) 640 $@

$(kdir_codekdw_kw_lib)/%.fw : $(kdir_codekdw_kw_lib)/%$(lv_fwipp_suf)
	$(GREP) -vP "^ *# \d{4}-\d\d-\d\d kd(pw|w ) " $< > $@

$(kdir_codekdw_kw_lib)/%.varylog : $(kdir_codekdw_kw_lib)/%$(lv_fwipp_suf) \
         $(FWIP_TRANSLATOR) $(KWSS_VKKCP_SH)
	$(ECHO) "MAKELISTC=" $(MAKEFILE_LIST)
	$(call mdfd_create) > $@
	$(CAT) $< | $(GREP) -E "^# ([0-9]{4}(-[0-3][0-9]){2} kdw  )" \
            | $(PERL) -pe "s/\$(lv_fwip_suf)\\b//;\
            s/(.*:)(.*\\skdw\\s\\s)/$$2$$1/;"\
            | $(SORT) -r \
            | $(KWSS_VKKCP_SH) $< $@ >> $@
	$(CHMOD) 640 $@
	$(CP) $@ $(kdir_bindir_include)/$(notdir $@)

.PHONY: kwfwips_fwipp kwfwips_h kwfwips_kw kwfwips_all

all_kwfwips :
	$(MAKE) -j kwfwips_h
	$(MAKE) -j kwfwips_all

kwfwips_fwipp: $(foreach kwn,$(lv_kwfwip_nam),\
         $(kdir_codekdw_kw_lib)/$(kwn)$(lv_fwipp_suf))
kwfwips_h: $(foreach kwn,$(lv_kwfwip_nam),\
         $(kdir_codekdw_kw_lib)/$(kwn).h) kwfwips_fwipp
kwfwips_kw : $(foreach kwn,$(lv_kwfwip_nam),\
         $(foreach suf,$(filter-out .h,$(lv_other_suf)),\
               $(kdir_codekdw_kw_lib)/$(kwn)$(suf))) kwfwips_h
kwfwips_all : $(filter-out $(kdir_codekdw_kw_lib)/%, \
         $(lv_files_targets)) kwfwips_kw

$(kdir_dep)/%.d : $(kdir_codekdw_kw_lib)/%.c $(kdir_codekdw_kw_lib)/%.h

.PHONY : lv_realclean
realclean : lv_realclean
lv_realclean :
	$(RM) $(lv_files_targets)

lv_files_fwipp_d:=$(addprefix $(kdir_dep)/,\
      $(addsuffix $(lv_fwipp_suf).d,$(lv_kwfwip_nam)))

ifeq ($(origin MAKECMDGOALS),undefined)
   -include $(lv_files_fwipp_d)
else ifneq ($(MAKECMDGOALS:%clean=clean),clean)
   -include $(lv_files_fwipp_d)
endif   # ifeq ($(origin MAKECMDGOALS),undefined)
