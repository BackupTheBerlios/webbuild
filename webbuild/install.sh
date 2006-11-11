# 	***************************************************************************
# 	*	Installation Script for WebBuild 
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
#	*	$Id: install.sh,v 1.1 2006/11/11 15:33:23 rollinhand Exp $
#	***************************************************************************

# --- Load special variables --------------------------------------------------
FULLPATH=`pwd | sed 's|\/webbuild||g'`
ADDON="webbuild"

# --- Edit Makefile.rules in system directory ---------------------------------
awk -F= -v FULLPATH="\"$FULLPATH\"" '{gsub(/\(ADD YOUR PATH\)/,FULLPATH,$0); print $0}' \
	"${FULLPATH}/${ADDON}/system/Makefile.rules" \
	> "${FULLPATH}/${ADDON}/system/Makefile.tmp"
mv "${FULLPATH}/${ADDON}/system/Makefile.tmp" "${FULLPATH}/${ADDON}/system/Makefile.rules"	
	
