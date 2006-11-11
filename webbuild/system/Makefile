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
#	*	$Id: Makefile,v 1.3 2006/11/11 15:27:13 rollinhand Exp $
#	***************************************************************************

include Makefile.rules

###############################################################################
#	If a HTML file already exists, you first have to drop it using the
#	batch command 'make drophtml' or 'make yourpage.bak'
#	Automatically convert umlauts
%.html: /webbuild/src/%.src
	@( echo "Creating HTML.....: $@" );
	@( "$(ROOT)/$(ADDON)/page.sh" "$(ROOT)/$(ADDON)" "`pwd`" "$*" "$<" );
	@( echo "Converting Umlauts: $@" );
	@( if [ -e $@ ]; then cat $@ | sed -n -f "$(ROOT)/$(ADDON)/umlaut.sed" > "$@.tmp"; fi; );  
	@( if [ -e $@.tmp ]; then mv "$@.tmp" "$@"; fi; );

###############################################################################	
#	Creates a backup of a HTML file and drops it then
%.bak: %.html 
	@( echo "Creating Backup...: $*_`date +%Y%m%d-%H%M`.bak" );
	@( if [ -f $< ]; then mv $< "webbuild/bak/$*_`date +%Y%m%d-%H%M`.bak"; fi; );
	@( echo "Erasing File......: $<" );
	@( if [ -f $< ]; then rm $<; fi; ); 

###############################################################################
#	This is a batch command to completely erase all HTML files in a directory
drophtml:
	@( for f in $$(ls *htm* | cut -d \. -f 1); do make $$f.bak; done; );

###############################################################################
#	This is a batch command to rebuild all HTML files
rebuild:
	@( if [ -d src ]; then \
	   for f in $$(ls src | cut -d \. -f 1); do make $$f.bak; make $$f.html; \
	   done; fi;); 
	   
###############################################################################
#	Executes a list of available commands
help:
	@(	echo -e "WebBuild - Commands:\n"\
				"make <site>.html\tCreates a single HTML file from source.\n"\
				"make <site>.bak\tCreates a backup of a HTML file.\n"\
				"make drophtml\t\tDeletes all HTML files in a tree.\n"\
				"make rebuild\t\tCreates a backup and rebuilds a HTML file.\n" );	   
	


