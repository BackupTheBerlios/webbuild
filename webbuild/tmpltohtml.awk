BEGIN {
	src=ARGV[1];
	dst=ARGV[2];
}

{
	text=$0;
	if ( FILENAME==src ) {
		i=1;
		while ( text && length(text)>6) {						
		 	a=match(text,/<hive [a-z\=\"]+>/); 
		 	b=match(text,/<\/hive>/); 
		 	con=substr(text,a,b+6);
		 	text=substr(text,b+7);
		 	c=index(con,">");
		 	field[i]=substr(con,index(con,"<"),c);
		 	sub(/>/," />",field[i]);
		 	content[i]=substr(con,c+1,length(con)-c-7);
		 	i++;
		}
	}
	
	if ( FILENAME==dst ) {
		for ( i in field ) {
			a=match(text,field[i]);
			if ( a > 0 ) {
				gsub(field[i],content[i],text);
				gsub(/\\\&/,"&",text);	
			}
		}	
		print text;
	}		
}


