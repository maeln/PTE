dico = File.new("listephoneme", "r");
nv = File.new("out","w");
phoneme = "";
fr = "";

dico.readlines.each do |lines|
	if ( /((?<=( \/)).)/.match(lines) != nil) then
		phoneme = /((?<=( \/)).)/.match(lines)[0];
	end
	
	if ( /((?<=(\* )).+(?=( :)))/.match(lines) != nil ) then
		nv.write("phoneme(\'#{phoneme}\',\'#{/((?<=(\* )).+(?=( :)))/.match(lines)[0]}\').\n")
	end
end
