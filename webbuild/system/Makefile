# 	***************************************************************************
# 	*	Makefile for HIVE 
#	***************************************************************************
#	*	Author:	Bjoern Berg <bjoern.berg@gmx.de>
#	*	(C) Copyright 2006 by Bjoern Berg
#	*
#	*	Permission to use, copy, modify and distribute this software and its
#	* 	documentation for any purpose is hereby granted without fee, provided that
#	* 	the above copyright notice appear in all copies and that both that copyright
#	* 	notice and this permission notice appear in supporting documentation. The
#	* 	author makes no representations about the suitability of this software for
#	* 	any purpose. It is provided "as is" without express or implied warranty.
#	***************************************************************************
#	* 	S Y S T E M   R E Q U I R E M E N T S:
#	*	- ImageMagick installiert
#	*	- sed / awk installiert
#	*	- GNU make
#	*
#	*	$Id: Makefile,v 1.1 2006/05/13 16:29:13 rollinhand Exp $
#	***************************************************************************

include Makefile.rules

###############################################################################
#	If a HTML file already exists, you first have to drop it using the
#	batch command 'make drophtml' or 'make yourpage.bak'
#	Automatically convert umlauts
%.html: src/%.src
	@( echo "Creating HTML.....: $@" );
	@( "$(ROOT)/$(ADDON)/page.sh" "$(ROOT)/$(ADDON)" "`pwd`" "$*" "$<" );
	@( echo "Converting Umlauts: $@" );
	@( if [ -e $@ ]; then cat $@ | sed -n -f "$(ROOT)/$(ADDON)/umlaut.sed" > "$@.tmp"; fi; );  
	@( if [ -e $@.tmp ]; then mv "$@.tmp" "$@"; fi; );

###############################################################################	
#	Creates a backup of a HTML file and drops it then
%.bak: %.html 
	@( echo "Creating Backup...: $*_`date +%Y%m%d-%H%M`.bak" );
	@( if [ -f $< ]; then mv $< "$*_`date +%Y%m%d-%H%M`.bak"; fi; );
	@( echo "Erasing File......: $<" );
	@( if [ -f $< ]; then rm $<; fi; ); 

###############################################################################
#	This is a batch command to completely erase all HTML files in a directory
drophtml:
	@( for f in $$(ls *htm* | cut -d \. -f 1); do make $$f.bak; done; );

###############################################################################
#	Convert umlauts	and special characters to HTML encoding
#	This is a batch command on all HTML files in current directory
#umlauts:
#	@(	for i in "`ls *.htm?`"; \
#			do echo "Converting Umlauts: $$i"; \
#			cat "$$i" | sed -n -f "$(ROOT)/$(ADDON)/umlaut.sed" > "$$i.tmp"; \
#			mv "$$i.tmp" "$$i"; \
#		done; );


