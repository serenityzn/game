def round(a)
	b=(a-a.to_i)*10
        puts "Posle zap #{b}"
	if b>5
	 b=a.to_i+1
	else
	 b=a.to_i
	end
	return b
end

puts round(4.8)
