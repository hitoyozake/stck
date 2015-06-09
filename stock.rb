# encoding: shift_JIS

require 'net/http'
require 'uri'
require 'csv'
require 'date'

require './schedule.rb'
require './company.rb'

def urlopen( host, path )
	http = Net::HTTP.new ( host )
	response = http.get( path )
	return response.body
end


def get_stock_csv( year, month, day )
	uri = URI("http://k-db.com/stocks/")

	date = Date.new( year, month, day )
	
	if date.wday == 0 || date.wday == 6 then
		puts "holiday"
		return nil
	end
	
	puts date
	
	data_from_url = urlopen( uri.host, uri.path + date.to_s + "?download=csv" )

	res = CSV.parse( data_from_url )

	csv_data = res[0][0].to_s.encode("Shift_JIS","Shift_JIS")
	
	if mr = csv_data.match( /(\d+)�N(\d+)��(\d+)��/ ) then
			d = Date.new( mr[ 1 ].to_i, mr[ 2 ].to_i, mr[ 3 ].to_i )
			#ruby ��wday�ŗj������\ �y����e����
			if d === date then
				#�j���E�x���ł͂Ȃ��������̏���
				return res
			else
				return nil
				#�j���E�x���ȂǂŊ����s�ꂪ���x��
			end

	end
	
	return nil
end


#��x�̃X�N���C�s���O�ŕ����̉�Ђ̃f�[�^����荞��
def sqrape_stocks_with_list( data, companyList, update_flag )
	
	schedule = Schedule.new("2014/2/1", "2014/2/10")

	if schedule.is_ready == false
		puts "schedule is not ready"
		return
	end

	to_date = schedule.get_to
	from_date = schedule.get_from

	current_date = from_date

	file_c1 = File.open( company + ".txt", "w" ) do | io1 |
		until( current_date === to_date )
			if csv = get_stock_csv( current_date.year, current_date.month, current_date.day ) then
				
				if csv != nil then
					for row in csv
						#�Ж������o��
						for company in companyList
							
							
							company = company.chomp
							
							if row[ 2 ].to_s.encode( "UTF-8", "Shift_JIS" ) == \
							company.encode( "UTF-8" ) then
								
								#when hashtable already have data
								if data.key?(current_date.to_s) == true and update_flag == false
									puts "data is already exist, go to next"
									next
								end
								
								data[ current_date.to_s ] = row[ 7 ].to_s.encode( "UTF-8", "Shift_JIS" )
								io1.puts ( current_date.to_s + "," +  row[ 7 ].to_s.encode( "UTF-8", "Shift_JIS" 	
								#7 �I�l
							end
						end
					end
				end
				
			sleep( 5 )
			end
			current_date += 1
		end
	end
	
end

