# encoding: shift_JIS


require 'date'
require 'csv'

class StockIO
	
	@file = nil

def open( filename )
	if @file != nil
		close()
	end
	
	@file = File.open( filename )
end

def to_csv( hash )
	writer = File.open("hogehoge.txt", "wb" )
  
	hash.to_a.each{ |row|
		id = row[0]
		puts [id, hash[id]]	    
		writer.puts  (id + "," + hash[id].to_s.encode( "UTF-8","Shift_JIS" ))
	}
end


def read_csv()
	hash = Hash.new
	puts "read_csv"
	
	while row = @file.gets
		array = row.split(",")
		if array.length >= 2 
			hash[ array[0].to_s.encode( "UTF-8","Shift_JIS" ) ] = array[1].to_s.encode( "UTF-8","Shift_JIS" )
		end
	end

	return hash

end


def show_all()
	if @file != nil
		@file.rewind #move seeking point to head 
		while line = @file.gets
			puts line.encode( "UTF-8","Shift_JIS" )
		end
		@file.rewind #move seeking point to head 
	end
end

def close()
	@file.close()
	@file = nil
end

end

