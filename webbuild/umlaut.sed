s/\&[^a-zA-Z0-9]/\&amp;/g;
s/�/\&auml;/g;
s/�/\&Auml;/g;
s/�/\&uuml;/g;
s/�/\&Uuml;/g;
s/�/\&ouml;/g;
s/�/\&Ouml;/g;
s/�/\&szlig;/g;
# nun noch für Unicode
s/ä/\&auml;/g;
s/Ä/\&Auml;/g;
s/ü/\&uuml;/g;
s/Ü/\&Uuml;/g;
s/ö/\&ouml;/g;
s/Ö/\&Ouml;/g;
s/ß/\&szlig;/g;
p;
