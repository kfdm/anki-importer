#!/usr/bin/env ruby
# Copyright: 2013 Paul Traylor
# These sources are released under the terms of the MIT license: see LICENSE
$TAGS   = "tags: Import Rikaichan #{Time::now().strftime('%Y-%m-%d')}"
$SOURCE = File.expand_path '~/Dropbox/Documents/rikaichan.txt'
$DEST   = File.dirname(__FILE__) + '/rikaichan.output.txt'

$input = File.new($SOURCE, "r:UTF-8")
$output = File.new($DEST,'w')

# Rikaichan lines are of the form
# <Expression> <Reading> <Meaning>
def format line
	words = line.strip().split("\t")
	if words.length == 2
		expression = words[0]
		meaning    = words[1]
		reading    = words[0]
	else
		expression = words[0]
		meaning    = words[2]
		reading    = words[1]
	end
	#puts "Original: #{line}"
	#puts "Expression: #{expression}"
	#puts "Meaning:    #{meaning}"
	#puts "Reading:    #{reading}"
	return "#{expression}\t#{meaning}\t#{reading}\ty\ty"
end

def fputs line
	puts line
	$output << "#{line}\n"
end

fputs $TAGS

while(line = $input.gets)
	words = format line
	fputs words
end

$input.close
$output.close
