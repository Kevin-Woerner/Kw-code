#! /usr/bin/make -f
#    Copyright (C) 2015-2020 by Kevin D. Woerner
# 2020-06-18 kdw  *.fwipp files depend of fwip-wrap
# 2020-05-29 kdw  transitioned to fwip.y
# 2020-05-27 kdw  rework
# 2020-04-08 kdw  preprocessor sigil change
# 2020-04-02 kdw  fw[i]p-call script
# 2020-03-20 kdw  fwe.* scripts
# 2020-03-18 kdw  md[f]d_fwipp_translate redefd
# 2020-03-12 kdw  format2
# 2020-01-21 kdw  md[f]d_fwipp_translate redefd
# 2019-12-26 kdw  f[w]d script
# 2019-09-26 kdw  renamd var
# 2019-09-05 kdw  file permission on fwipp files
# 2019-09-01 kdw  organized better
# 2019-08-07 kdw  comment change
# 2019-08-05 kdw  simplified
# 2019-08-04 kdw  *.vb target work
# 2019-07-28 kdw  .con[s]tans*.pl mved
# 2019-07-20 kdw  K[W]_D[I]R_.* env vars II
# 2019-07-17 kdw  env var w/ computer names renamd
# 2019-07-16 kdw  files mved from kvn to 0lib, et al.
# 2019-07-15 kdw  var renam
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-07-11 kdw  include directory
# 2019-05-22 kdw  k[w]-const.* work
# 2019-02-28 kdw  define troubles
# 2019-02-01 kdw  libk[w].* names mved to makefile.beg
# 2019-01-16 kdw  v[b]62.* perl script moved
# 2019-01-15 kdw  fw[i]p2 improved
# 2019-01-14 kdw  fw[i]p2_ improved
# 2019-01-11 kdw  al[l]_fw[i]p reorg
# 2019-01-06 kdw  make fwip2* executable
# 2019-01-02 kdw  fwip2_
# 2018-12-28 kdw  ref to shc-dir rmed
# 2018-12-25 kdw  reorg al[l]_fwip making
# 2018-12-20 kdw  dependency work
# 2018-12-19 kdw  fwip2.* shell scripts
# 2018-12-18 kdw  kwelements separated
# 2018-12-17 kdw  local targets
# 2018-12-07 kdw  explicit imported funcitons
# 2018-11-03 kdw  kw_lib stuff
# 2018-10-08 kdw  vbdotnet stuff
# 2018-10-03 kdw  ?
# 2018-09-30 kdw  work stuff
# 2018-09-27 kdw  v[b]net* -> do[t]net
# 2018-09-25 kdw  dot net work
# 2018-09-23 kdw  v[b]62vb[n]et work
# 2018-09-22 kdw  linux work
# 2018-09-04 kdw  rmed date line from K[w]-con[s]tants.*
# 2018-06-27 kdw  const work
# 2018-06-19 kdw  bison files
# 2018-06-16 kdw  bison files
# 2018-05-16 kdw  AR?RAY work
# 2018-04-23 kdw  md?fd_i?nc
# 2018-04-01 kdw  fwipp
# 2018-03-12 kdw  made PP statements not need semicolon
# 2018-03-02 kdw  rmed unused var
# 2018-02-17 kdw  preprocessor
# 2018-02-16 kdw  fwi?pma?ke now an alias
# 2018-01-26 kdw  fwip func desc
# 2018-01-23 kdw  parsed fwip stuff
# 2017-12-13 kdw  typo in shc_dir usage
# 2017-11-30 kdw  work dir changed
# 2017-10-20 kdw  no more ?[?]? things
# 2017-10-13 kdw  a[l]l vs al[l]_fwip
# 2017-10-05 kdw  *.units
# 2017-08-29 kdw  FW?IPM?AKE
# 2017-08-22 kdw  INS[E]RT_F[I]LE syntax changed
# 2017-07-18 kdw  al?l_fw?ip
# 2017-07-10 kdw  parallelization attempt II
# 2017-07-08 kdw  parallelization attempt
# 2017-07-03 kdw  fwi?pp -> fw?ip-tra?nslator
# 2017-06-29 kdw  k[w]?inc?luded* debugged
# 2017-06-27 kdw  debugging
# 2017-06-20 kdw  simplified
# 2017-06-08 kdw  kwincluded shell script made smarter
# 2017-06-01 kdw  kwincluded shell script made smarter
# 2017-05-06 kdw  failed experiment
# 2017-04-20 kdw  OBJ*
# 2017-04-06 kdw  rm overzealous dependencies
# 2017-04-02 kdw  make K[W].c and K[W].h before K[W].d
# 2017-03-22 kdw  rmed comments
# 2017-03-17 kdw  debugging
# 2017-03-16 kdw  debugging
# 2017-03-14 kdw  debugging
# 2017-03-13 kdw  debugging
# 2017-03-12 kdw  debugging
# 2017-03-11 kdw  failed experiment
# 2017-03-10 kdw  tweaking
# 2017-03-07 kdw  IN?SE?RT stuff
# 2017-02-27 kdw  ,,,th?is-dir-ex?ists
# 2017-02-19 kdw  th?is-dir-ex?ists
# 2017-02-02 kdw  dependency work
# 2017-01-28 kdw  kvn_dir
# 2017-01-11 kdw  varhylog stuff
# 2017-01-08 kdw  INSERT parsing
# 2016-12-13 kdw  K[W]?SS_ added
# 2016-12-02 kdw  var renam
# 2016-11-28 kdw  file suffix change
# 2016-11-21 kdw  fwipdir
# 2016-11-20 kdw  fwip language change
# 2016-11-05 kdw  moved stuff to .././Makefile.beg
# 2016-10-31 kdw  vk?kcp tweak
# 2016-10-30 kdw  more tweak
# 2016-10-29 kdw  tweak
# 2016-09-30 kdw  FWIPP
# 2016-09-28 kdw  We?rks?hc
# 2016-09-19 kdw  _[_]IN?SERT[_]_
# 2016-09-14 kdw  FWIPPPL may not be executable
# 2016-09-09 kdw  tweak
# 2016-09-08 kdw  rmed makee.sh
# 2016-09-06 kdw  makee.sh changes
# 2016-09-03 kdw  use makee.sh
# 2016-09-02 kdw  touch & vk?kcp
# 2016-08-27 kdw  K?wsun filestamp problems
# 2016-08-24 kdw  uni?x2dos to vb6 output
# 2016-08-17 kdw  *.cha?ngelog
# 2016-08-07 kdw  cod?ek?dw
# 2016-08-01 kdw  v?kk?cp changed
# 2016-07-31 kdw  B?LIB_TA?RGETS rmed
# 2016-07-29 kdw  cod?ek?dw stuff
# 2016-07-02 kdw  tweak
# 2016-06-20 kdw  vk?kcp debugging
# 2016-06-15 kdw  fwip-compile touching refactor
# 2016-06-10 kdw  bl?ib/* files depend of vk?kcp
# 2016-06-08 kdw  fwipprocess refactor
# 2016-06-06 kdw  rmed kd?ir_bl?ib variable
# 2016-06-02 kdw  *_k?dir -> k?dir_*
# 2016-05-27 kdw  refactor
# 2016-05-26 kdw  all bl?ib files depend on li?pc
# 2016-05-25 kdw  minor refactor
# 2016-05-25 kdw  long lines
# 2016-05-24 kdw  vk?kcp call change
# 2016-05-20 kdw  changed _k?w_.*_f?dir to $1_kd?ir
# 2016-05-19 kdw  added _k?w_ to variables
# 2016-05-18 kdw  comment cleanup
# 2016-05-17 kdw  library directory changed
# 2016-05-16 kdw  added _k?w_ to variables
# 2016-05-13 kdw  added _fd?ir to several variables
# 2016-05-12 kdw  VB6: changed command line arg to fwipp
# 2016-05-06 kdw  {obj,asm,dep}dir -> \1_f?dir
# 2016-04-29 kdw  moved defs to Make?file.b?eg
# 2016-04-26 kdw  li?b directory stuff
# 2016-04-15 kdw  modification of fwipprocess ; KV?NDIR used
# 2016-04-13 kdw  tweak
# 2016-04-06 kdw  directory rename
# 2016-04-04 kdw  *.o files aren't in li?bd?ir
# 2016-04-01 kdw  failed experiment
# 2016-03-10 kdw  variables renamed more logically
# 2016-03-03 kdw  wo?rks?hc stuff on EES?OFT-P?C
# 2016-02-24 kdw  wo?rksh?c_fd?ir defined in Ma?kefile.b?eg
# 2016-01-07 kdw  commented code rmed
# 2016-01-04 kdw  OSX stuff: make FreeBSD touch work
# 2015-12-16 kdw  try not touching files; bad idea
# 2015-11-18 kdw  shortened long lines
# 2015-10-18 kdw  K[w]-sun* to K[w]sun* rename
# 2015-10-17 kdw  libK[w]-sun.a
# 2015-10-16 kdw  BL?IB_TARGETS
# 2015-10-14 kdw  experiment
# 2015-10-13 kdw  K[w].fwip "includes" all necessary files
# 2015-10-05 kdw  K[w].rpn
# 2015-10-01 kdw  K[w].a
# 2015-09-29 kdw  K[w].h
# 2015-09-21 kdw  debgging
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
      "if(s~.*INSERT_FILE\s+\"(\S+?)\"\?\?.* \
            ~   $(srcdir)/\$$1\\\\~x){print}" \
      $< >> $@

include $(MAKEDIR)/Makefile.end

define mdfd_inc
   $(addprefix $(srcdir)/,$(shell $(PERL) -ne \
      "if(s/.*INSERT_FILE \"(\S+?)\"\?\?.*/$$1/){print}" \
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
   $(FWIP_PREPROCESS) $(FWIP_Y) $(FWIP_FORMATY) \
   $(FWIP_WRAP)
	$(FWIP_PREPROCESS) $< > $(kdir_fwip)/$(@F).pp
	$(ECHO) "MAKELISTA=" $(MAKEFILE_LIST)
	$(CAT) $(kdir_fwip)/$(@F).pp | $(FWIP_Y) \
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
