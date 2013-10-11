class Drawsome
	def initialize(window)
		@x = @y = 0
	end
	
	def draw(window, pnga,x,y)
	if $drcount==0
	 pnga.pop
	 $drcount=10
	end
	$drcount-=1
	if pnga.size >0
	png=pnga.last
	 @image = Gosu::Image.new(window, png, false)
	 if png!="none"
		 @image.draw(x,y,1)
	 end
	end
	end
	
end
