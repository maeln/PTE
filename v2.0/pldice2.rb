# coding: UTF-8
dico = File.new("dico-pron2", "r+");
nv = File.new("dico-pron.pl","w");
phoneme = "";
skip = false;

#dico.readlines.each do |lines|
#	if (/((?<=\x7C)(?=\x7C))/.match(lines) == nil) then
#		nv.write(lines);
#	end
#end
		

dico.readlines.each do |lines|
	if !skip then
		if ( /\n/.match(lines) != nil ) then
			nv.write(lines.chomp+".\n")
		end
	end
end
