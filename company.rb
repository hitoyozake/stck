
#ファイルから企業リストを読み込む
class CompanyList
	@company_list
	def initialize( filename )
		@company_list = Array.new
		
		File.open( filename ) do |file|
			file.each do |s|
				str = s.chomp
				@company_list.push s if str != ""
			end			
		end
	end
	
	def to_array
		return @company_list
	end
	
	def show()
		puts @company_list
	end
end