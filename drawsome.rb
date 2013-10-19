class Drawsome
	def initialize(window)
		@x = @y = 0
	end
	
	def draw(window, pnga,x,y)
	if x>0
		if x>640
		 x=x-640*(x/640)
		end

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
		else
		 $levelarray=$blsave
		 $bllock=0
		 $drx=-10
		end
	end
	end
	
	
end
