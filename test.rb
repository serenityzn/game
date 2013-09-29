r=125
	t=Math.sqrt(25)

def gettime(h)
	t=Math.sqrt((h*2)/9.8)
	return t.to_i
end

def GrPower(t)
	i=1
	gp = Array.new
	final = Array.new
	final1 = Array.new
	while i<t+1
	gp.push((9.8*i*i)/2)
	i+=1
	end
	j=1
	final.push(gp[0])
	while j<gp.size
		final.push(gp[j]-gp[j-1])
		j+=1
	end	
	i=final.size-1
	while i>-1
	 final1.push(final[i])
	 i-=1
	end

	return final1
end
time=gettime(r)
arr=GrPower(time)
puts time
puts "\r"
puts arr.pop
puts arr.pop
puts arr.pop
puts arr.pop
puts arr.pop
if  arr.pop==nil
	puts "coco=true"
end
total=0
puts "Totatl: #{total}"
