class Player
	def initialize(window)
	 @image = Gosu::Image.new(window, "media/pl2.png", false)
	 @x = @y = @vel_x = @vel_y = @angle = 0.0
	 @score = 0
	 @live=3
	 @count=0
	 $gravity=1
	 @isjump=0
	end

	def warp(x,y)
	 @x, @y = x, y
	 $globx=@x
	 $globy=@y
	end

	def turn_left(image)
	 x=$globx-$speed[0]
	 if @count > image.size-1
          @count=0
         end
         @image=image[@count]
         @count +=1
	 if check(x,@y,0).to_i==1
	  @x -= $speed[0]
	  $globx -= $speed[0]
	 end	
	end

	def turn_right(image)
	 if @count > image.size-1
          @count=0
         end
         @image=image[@count]
         @count +=1
	 x=$globx+$speed[0]
	 if check(x,@y,0).to_i==1
	  @x += $speed[0]
	  $globx += $speed[0]
	 end	
	end

	def jump
	 $gravity=1
	 if $ifground==1 
		@isjump=1
		$ifground=0
		$jmp=50
	 end
	end
	
	def jump2
	 if $jmp.to_i>0
	  $jmp -=$speed[3]
	  y=@y-$speed[1]
	   if check($globx,y,1).to_i==1
	    @y -= $speed[1]
	   end
	 end
	end

	def down
	 y=@y+$speed[2]
	 if check($globx,y,1).to_i==1
	  @y += $speed[2]
	 end	
	end
	
	def gravity
	 if $jmp.to_i==0  
	   y=@y+$speed[2]
	   $ifground=0
	   if check($globx,y,1).to_i==1 and $gravity==1
	    @y += $speed[2]
	   else 
	    $ifground=1
	    @isjump=0
	   end
	 end
	end	

	def move
	 @x %= 640
	 x=$globx/640
         xx=$globx-x.to_i*640
	 @x=xx
#:	 @y %= 480
	 $globy=@y
	 puts "Jum=#{@isjump}"
	end

	def draw
	 @image.draw_rot(@x, @y, 1, @angle)
	end

	def score
	 @score
	end

	def live(a)
	 if a==1
	 @live-=1
	 end
	@live
	end

	def collect_stars(stars)
	 if stars.reject! {|star| Gosu::distance(@x, @y, star.x, star.y) < 35 } then
	 @score += 1
	 end
	end
	
	def check(x,y,action)
	 arsize = $lvl_xy[0].size
	 a=$lvl_xy
	 dr=1
	i=0
	while i<arsize
         if (x > a[0][i].to_i-15 and x < a[0][i].to_i+$envsize[0]+15) and ( y+1> a[1][i].to_i-15 and y+1< a[1][i].to_i+$envsize[0]+15)
                dr=0
		if action==1 
		 $jmp=0
		end
		if @isjump==1
	#	 a[0].delete_at(i)
	#	 a[1].delete_at(i)
		end
         end
        i += 1
	end
	
	return dr 
	end

end
