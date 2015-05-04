require 'date'

class Schedule
	@from_date
	@to_date

	@ready = false

	def show
		puts "from:" + @from_date.to_s
		puts "to:" + @to_date.to_s
	end

	def initialize()
		
	end
	
	def is_ready
		return @ready
	end
	
	def get_from
		return @from_date
	end
	
	def get_to
		return @to_date
	end
	
	def initialize( from_date, to_date )
		#gsub‚Í“–‚Ä‚Í‚Ü‚é³‹K•\Œ»‘S‚Ä‚ğ’uŠ· 
		# yyyy,mm,dd => yyyy-mm-dd
		from_date = from_date.gsub( /,/,'-')
		to_date = to_date.gsub( /,/,'-')
		
		begin
			@from_date = Date.new( from_date )
		rescue
			begin
				@from_date = Date.parse(from_date)
			rescue
				puts "fail"
			end
		end
		
		begin
			@to_date = Date.new( to_date )
		rescue
			begin
				@to_date = Date.parse(to_date)
			rescue
				puts "fail"
			end
		end
		
		if @from_date != nil and @to_date != nil
			@ready = true
		end
		
	end
end

