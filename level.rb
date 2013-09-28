class Level
	def initialize(window)
	 #@image = Gosu::Image.new(window, "media/block.png", false)
	 @x = @y = @angle = 0.0
	 @score = 0
	end
	
	def warp(x,y)
	 @x, @y = x, y
	end

	def move
	 @x %= 640
	 @y %= 480
	end

	def draw(camx,mas)
	j=0
	array=$levelarray
	if camx.to_i > 639
	 j=16*(camx.to_i/640)
	 jcur=j
	else     
	 if j.to_i > 15
	  j-=16
	 else
	  j=0
	 end
	 jcur=j
	end
	i=0
	max=j+16
	while i<12
	        a=array[i]
	        while j<max
	         if a[j].chr=='-' or a[j].chr=='='
		  if j<16
		   @x =$envsize[0]*j
		   @y =$envsize[0]*i
                  else
		   @x =$envsize[0]*(j-j/16*16)
		   @y =$envsize[0]*i
		  end
		  	if a[j].chr=='='
			 @image = mas[0]
			else
			 @image = mas[1]
			end
		  
		  @image.draw(@x, @y, 1)
	         end
	         j +=1
	        end
	        j=jcur
		i+=1
	end
	 @x=0
	 @y=0
	end

  def init
        array=$levelarray
        i=0
        j=0
	array.each {|a| 
	 a.each {|b|
			if b=='-'
			 x=$envsize[0]*j
			 y=$envsize[0]*i
			 $lvl_xy[0].push(x)
			 $lvl_xy[1].push(y)
			end
		 j+=1
		}
	j=0
	i+=1
	}
#        while i<6
#                a=array[i]
#                while j<16
#                 if a[j].chr=='-'
#                  x =$envsize[0]*j
#                  y =$envsize[0]*i
#                    $lvl_xy[0].push(x)
#                    $lvl_xy[1].push(y)
#                 end
#                 j +=1
#                end
#                j=0
#                i+=1
#        end
       end


end
