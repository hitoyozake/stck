require 'csv'


hashtable01 = Hash.new

hashtable01["20140101"] = ["120","a"]
hashtable01["20140102"] = ["150","b"]

CSV.open("./report.csv", "wb"){ |writer|
	hashtable01.to_a.each{ |row|
	id = row[0]
	puts "test"
	puts [id, hashtable01[id],"abc"]
    writer <<  [id, hashtable01[id],"abc" ]
	}
}

