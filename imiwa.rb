#!/usr/bin/env ruby
# Copyright: 2013 Paul Traylor
# These sources are released under the terms of the MIT license: see LICENSE
$TAGS   = "tags: Import Kotoba #{Time::now().strftime('%Y-%m-%d')}"
$SOURCE = File.expand_path '~/Downloads/Favorites.txt'
$DEST   = File.dirname(__FILE__) + '/kotoba.output.txt'

$input = File.new($SOURCE, "r:UTF-8")
$output = File.new($DEST,'w')

# Kotoba lines are of the form
# <DICT> <ID> <Word> <Reading> <Definition> <List>
# So we want to take <Word> <Reading> <Definition>
def format line
	words = line.strip().split("\t")
	expression = words[2]
	meaning    = words[4]
	reading    = words[3]
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