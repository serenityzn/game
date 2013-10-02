r=170
	t=Math.sqrt(25)

def gettime(h)
	t=Math.sqrt((h*2)/2)
	puts "Time before #{t}"
	return round(t)
end

def GrPower(t,r)
	i=1
	gp = Array.new
	final = Array.new
	final1 = Array.new
	while i<t+1
	gp.push((2*i*i)/2)
	i+=1
	end
	j=1
	final.push(0)
	final.push(0)
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
	total=0
	final1.each {|a|
	 total+=a
	}	
	delta=r-total
	if delta>0
		final1[0]=final1[0]+delta
	end
	return final1
end

def round(a)
        b=(a-a.to_i)*10
        if b>5
         b=a.to_i+1
        else
         b=a.to_i
        end
        return b
end



time=gettime(r)
arr=GrPower(time,r)
puts "TIME=#{time}"
total=0
arr.each {|a|
	puts a
	total+=a
	}
if  arr.pop==nil
	puts "coco=true"
end
puts "Totatl: #{total}"
