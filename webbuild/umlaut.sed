s/\&[^a-zA-Z0-9]/\&amp;/g;
s/ä/\&auml;/g;
s/Ä/\&Auml;/g;
s/ü/\&uuml;/g;
s/Ü/\&Uuml;/g;
s/ö/\&ouml;/g;
s/Ö/\&Ouml;/g;
s/ß/\&szlig;/g;
# nun noch fÃ¼r Unicode
s/Ã¤/\&auml;/g;
s/Ã„/\&Auml;/g;
s/Ã¼/\&uuml;/g;
s/Ãœ/\&Uuml;/g;
s/Ã¶/\&ouml;/g;
s/Ã–/\&Ouml;/g;
s/ÃŸ/\&szlig;/g;
p;
