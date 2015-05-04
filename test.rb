# encoding: shift_JIS

require 'test/unit'

require './company.rb'
require './schedule.rb'
require './filemanager.rb'
require './stock.rb'

class CompaniesTest < Test::Unit::TestCase
	
	class << self		
		#テスト群の実行前に呼ばれる
		def startup
			p :_startup
		end
		
		#テスト群実行後に呼ばれる
		def shutdown
			p :_shutdown
		end
	end

	@companies

	#毎回テスト実行前に呼ばれる
	def setup
		p :_setup
		@companies = CompanyList.new("list.txt")
	end

	# テストがpassedになっている場合に，テスト実行後に呼ばれる．テスト後の状態確認とかに使える
	def cleanup
		p :cleanup
		@companies.show
	end

	# 毎回テスト実行後に呼ばれる
	def teardown
		p :treatdown
	end
	
	#test_***という名前である必要がある
	def test_foo
	 puts "test"
	 assert_equal( 1,1 )
	end
	
	def test_show
	 puts "test2"
	 @companies.show
	end
end





class ScheduleTest < Test::Unit::TestCase
	
	class << self		
		#テスト群の実行前に呼ばれる
		def startup
			p :_startup
		end
		
		#テスト群実行後に呼ばれる
		def shutdown
			p :_shutdown
		end
	end

	@schedule

	#毎回テスト実行前に呼ばれる
	def setup
		p :_setup
	end

	# テストがpassedになっている場合に，テスト実行後に呼ばれる．テスト後の状態確認とかに使える
	def cleanup
		p :cleanup
	end

	# 毎回テスト実行後に呼ばれる
	def teardown
		p :treatdown
	end
	
	#test_***という名前である必要がある
	def test_initialize
	 puts "initialize_test"
	 @schedule = Schedule.new("2015,4,12","2015,9,30")
	 p @schedule.is_ready
	 
	end
end



class StockIOTest < Test::Unit::TestCase
	
	class << self		
		#テスト群の実行前に呼ばれる
		def startup
			p :_startup
		end
		
		#テスト群実行後に呼ばれる
		def shutdown
			p :_shutdown
		end
	end

	#毎回テスト実行前に呼ばれる
	def setup
		p :_setup
	end

	# テストがpassedになっている場合に，テスト実行後に呼ばれる．テスト後の状態確認とかに使える
	def cleanup
		p :cleanup
	end

	# 毎回テスト実行後に呼ばれる
	def teardown
		p :treatdown
	end


	@stock_io
	
	#test_***という名前である必要がある
	def test_show_all
	puts "show_all_test"

	@stock_io = StockIO.new
	@stock_io.open("東芝.txt")
	@stock_io.show_all
	hash = @stock_io.read_csv
	
	@stock_io.to_csv( hash )
	end
end

class StockIOTest2 < Test::Unit::TestCase
	
	class << self		
		#テスト群の実行前に呼ばれる
		def startup
			p :_startup
		end
		
		#テスト群実行後に呼ばれる
		def shutdown
			p :_shutdown
		end
	end

	#毎回テスト実行前に呼ばれる
	def setup
		p :_setup
	end

	# テストがpassedになっている場合に，テスト実行後に呼ばれる．テスト後の状態確認とかに使える
	def cleanup
		p :cleanup
	end

	# 毎回テスト実行後に呼ばれる
	def teardown
		p :treatdown
	end


	@stock_io
	
	#test_***という名前である必要がある
	def test_show_all
	puts "show_all_test"

	@stock_io = StockIO.new
	@stock_io.open("東芝.txt")
	@stock_io.show_all
	
	data = @stock_io.read_csv
	
	@stock_io.to_csv( data )

	company = "東芝"
	
	puts data
	
	sqrape_stocks( data,  company, false )
	
	
	end
end



