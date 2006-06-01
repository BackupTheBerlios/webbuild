#!/bin/sh
#	***************************************************************************
#	*	page.sh
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
#	*	D E S C R I P T I O N
# 	*	params given by Makefile
# 	*	$1	WEBBUILD Directory
# 	*	$2	Currently used path
# 	*	$3	filename without ending
# 	*	$4	sourcename and directory
#	*
#	*	$Id: page.sh,v 1.2 2006/06/01 16:03:35 rollinhand Exp $
#	***************************************************************************

# 	Init variables
_HIVETMPCONTENT=$3_`date +%Y%m%d`;
_HIVETMPFILE=$3.html;
_HIVETEMPLATE=template.tmpl;

if [ -e "$2/$_HIVETMPFILE" ]; then
	rm "$2/$_HIVETMPFILE";
fi	

# 	read content from source file to buffer for regexp
echo "From Source-File..: $4";
SRC=`cat "$2/$4"`
echo $SRC | sed -e 's|\&|\\\&|g;s|\r\n||g;s|\n||g;s|>[ ]*<|><|g' > "$2/$_HIVETMPCONTENT";

# 	look for <hive>-tags in buffer and split it
awk -f "$1/tmpltohtml.awk" "$2/$_HIVETMPCONTENT" "$2/$_HIVETEMPLATE" >> "$2/$_HIVETMPFILE";

# 	test if file exists
if [ -e "$2/$_HIVETMPFILE" ]; then
	echo "Created file......: Successful";
else
	echo "Created file......: No Success";
fi

# 	clean environment
rm "$2/$_HIVETMPCONTENT";						 
	

	


