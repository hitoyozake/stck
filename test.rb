# encoding: shift_JIS

require 'test/unit'

require './company.rb'
require './schedule.rb'
require './filemanager.rb'
require './stock.rb'

class CompaniesTest < Test::Unit::TestCase
	
	class << self		
		#�e�X�g�Q�̎��s�O�ɌĂ΂��
		def startup
			p :_startup
		end
		
		#�e�X�g�Q���s��ɌĂ΂��
		def shutdown
			p :_shutdown
		end
	end

	@companies

	#����e�X�g���s�O�ɌĂ΂��
	def setup
		p :_setup
		@companies = CompanyList.new("list.txt")
	end

	# �e�X�g��passed�ɂȂ��Ă���ꍇ�ɁC�e�X�g���s��ɌĂ΂��D�e�X�g��̏�Ԋm�F�Ƃ��Ɏg����
	def cleanup
		p :cleanup
		@companies.show
	end

	# ����e�X�g���s��ɌĂ΂��
	def teardown
		p :treatdown
	end
	
	#test_***�Ƃ������O�ł���K�v������
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
		#�e�X�g�Q�̎��s�O�ɌĂ΂��
		def startup
			p :_startup
		end
		
		#�e�X�g�Q���s��ɌĂ΂��
		def shutdown
			p :_shutdown
		end
	end

	@schedule

	#����e�X�g���s�O�ɌĂ΂��
	def setup
		p :_setup
	end

	# �e�X�g��passed�ɂȂ��Ă���ꍇ�ɁC�e�X�g���s��ɌĂ΂��D�e�X�g��̏�Ԋm�F�Ƃ��Ɏg����
	def cleanup
		p :cleanup
	end

	# ����e�X�g���s��ɌĂ΂��
	def teardown
		p :treatdown
	end
	
	#test_***�Ƃ������O�ł���K�v������
	def test_initialize
	 puts "initialize_test"
	 @schedule = Schedule.new("2015,4,12","2015,9,30")
	 p @schedule.is_ready
	 
	end
end



class StockIOTest < Test::Unit::TestCase
	
	class << self		
		#�e�X�g�Q�̎��s�O�ɌĂ΂��
		def startup
			p :_startup
		end
		
		#�e�X�g�Q���s��ɌĂ΂��
		def shutdown
			p :_shutdown
		end
	end

	#����e�X�g���s�O�ɌĂ΂��
	def setup
		p :_setup
	end

	# �e�X�g��passed�ɂȂ��Ă���ꍇ�ɁC�e�X�g���s��ɌĂ΂��D�e�X�g��̏�Ԋm�F�Ƃ��Ɏg����
	def cleanup
		p :cleanup
	end

	# ����e�X�g���s��ɌĂ΂��
	def teardown
		p :treatdown
	end


	@stock_io
	
	#test_***�Ƃ������O�ł���K�v������
	def test_show_all
	puts "show_all_test"

	@stock_io = StockIO.new
	@stock_io.open("����.txt")
	@stock_io.show_all
	hash = @stock_io.read_csv
	
	@stock_io.to_csv( hash )
	end
end

class StockIOTest2 < Test::Unit::TestCase
	
	class << self		
		#�e�X�g�Q�̎��s�O�ɌĂ΂��
		def startup
			p :_startup
		end
		
		#�e�X�g�Q���s��ɌĂ΂��
		def shutdown
			p :_shutdown
		end
	end

	#����e�X�g���s�O�ɌĂ΂��
	def setup
		p :_setup
	end

	# �e�X�g��passed�ɂȂ��Ă���ꍇ�ɁC�e�X�g���s��ɌĂ΂��D�e�X�g��̏�Ԋm�F�Ƃ��Ɏg����
	def cleanup
		p :cleanup
	end

	# ����e�X�g���s��ɌĂ΂��
	def teardown
		p :treatdown
	end


	@stock_io
	
	#test_***�Ƃ������O�ł���K�v������
	def test_show_all
	puts "show_all_test"

	@stock_io = StockIO.new
	@stock_io.open("����.txt")
	@stock_io.show_all
	
	data = @stock_io.read_csv
	
	@stock_io.to_csv( data )

	company = "����"
	
	puts data
	
	sqrape_stocks( data,  company, false )
	
	
	end
end



