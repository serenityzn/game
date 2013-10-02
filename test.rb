require './global.rb'

r=170
	t=Math.sqrt(25)

def gettime(h)
	t=Math.sqrt((h*2)/0.5)
	puts "Time before #{t}"
	return round(t)
end

def GrPower(t,r)
	i=1
	gp = Array.new
	final = Array.new
	final1 = Array.new
	while i<t+1
	gp.push((0.5*i*i)/2)
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

def calch(x,y)
harr = Array.new
prom=0
high=99999999
bx=0
by=0
i=0
	while i<$lvl_xy[0].size
		puts "x,y=#{x},#{y} bx,by=#{$lvl_xy[0][i]},#{$lvl_xy[1][1]}"
		if x>=$lvl_xy[0][i] and x<$lvl_xy[0][i]+40
			prom=$lvl_xy[1][i]-y
			if prom<high
			 puts "Enter"
				high=prom
				bx=$lvl_xy[0][i]
				by=$lvl_xy[1][i]
			end			
		end 
	 i+=1
	end
harr.push(high)
harr.push(bx)
harr.push(by)

	return harr
end

#puts calch(240,65)

