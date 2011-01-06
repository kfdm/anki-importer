#!/usr/bin/env ruby

raise 'Missing Input File' if not ARGV[0]

def format( words)
	if words[0] == words[1] then
		puts "#{words[0]}\t#{words[2]}\t#{words[1]}"
	else
		puts "#{words[0]}\t#{words[2]}\t#{words[0]}"
	end
end

input = File.new(ARGV[0], "r")
while(line = input.gets)
	# Kotoba lines are of the form
	# <DICT> <ID> <Word> <Reading> <Definition> <List>
	# So we want to take <Word> <Reading> <Definition>
	words = line.strip().split("\t").slice(2,3)
	# Then we want to put it as <Word> <Meaning> <Reading> for Anki
	format words
end

input.close