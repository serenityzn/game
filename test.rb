a=Array.new
a[0]=Array.new
a[1]=Array.new
a[0]=[1,2,3,4,5,6]
a[1]=['a','b','c','d','e','f']
a[0].each {|i| a[1].each {|j| puts "#{i},#{j}"}}
