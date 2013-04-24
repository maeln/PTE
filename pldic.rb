# coding: UTF-8
dico = File.new("dictionaire-phonetiq-fr-130408", "r+");
nv = File.new("dico-pron","w");
phoneme = "";
skip = false;

#dico.readlines.each do |lines|
#	if (/((?<=\x7C)(?=\x7C))/.match(lines) == nil) then
#		nv.write(lines);
#	end
#end
		

dico.readlines.each do |lines|
	if !skip then
		if ( /(?<=\x7c)\S+(?=(\x7cfr\}\}))/.match(lines) != nil) then
			phoneme = /(?<=\x7c)\S+(?=(\x7cfr\}\}))/.match(lines)[0];
		end
	
		if ( /((?<=\x27{3})(\w+)(?=\x27{3}){1})/.match(lines) != nil ) then
			lines.to_enum(:scan, /((?<=\x27{3})(\w+)(?=\x27{3}){1})/).map do
				nv.write("pron(\'#{Regexp.last_match[0]}\',\'#{phoneme}\').\n")
			end
		end
	end
end
