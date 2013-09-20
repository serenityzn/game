class Turtle
	def initialize(window)
	 @image = Gosu::Image.new(window, "media/turtle.png", false)
	 @x = @y = @vel_x  = @angle = 0.0
	 @route=1
	 @timgs = Array.new
	 @timgs.push(Gosu::Image.new(window, "media/turtle_r.png", false))
	 @timgs.push(Gosu::Image.new(window, "media/turtle.png", false))
	 $runflag=0
	 @monsterid=$mcol
	 $mcol+=1
	end

	def warp(x,y)
	 @x, @y = x, y
	end

	def turn_left
	 @image=@timgs[1]
	 x=@x-0.5
	
	 if check(x,@y)==1
	  @x-=0.5
	 else
	  @route=1
	 end
	end

	def turn_right
	 @image=@timgs[0]
	 x=@x+0.5
	 if check(x,@y)==1
	  @x+=0.5
	 else
	  @route=0
#	  puts "TURTLE X=#{@x} Y=#{@y}"
	 end
	end

	def gravity
	 y=@y+2.5
	 if check(@x,y)==1
	  @y+=2.5
	 end
	end	

	def move
	 if @y==$globy and @x-$globx<0
	  @route=1
	 end
	 if @y==$globy and @x-$globx>0
	  @route=0
	 end
#	     puts "rflag=#{$runflag} mid=#{@monsterid}"
	 if @route==0
		dta=@y-$globy
	  if $globx>@x-25 and $globx<@x+25 and dta<21 and dta>16 and ($runflag==0 or $runflag==@monsterid)
	     $gravity=0
	     $runflag=@monsterid
	     tx=$globx-0.5
	     if check(tx,$globy)==1
	      $globx -= 0.5
	     end
	  else
	     if $runflag==@monsterid
	      $gravity=1
	      $runflag=0
             end
	  end
	  turn_left
	 end
	 if @route==1
		dta=@y-$globy
	  if $globx>@x-25 and $globx<@x+25 and dta<21 and dta>16 and ($runflag==0 or $runflag==@monsterid)
	     $gravity=0
	     $runflag=@monsterid
	    tx=$globx+0.5
	    if check(tx,$globy)==1
	     $globx += 0.5 
	    end
	  else
	    if $runflag==@monsterid
	     $gravity=1
	     $runflag=0
	    end
	  end
	  turn_right
	 end
	end

	def draw
	 x=@x/640
	 xx=@x-x.to_i*640
	 @image.draw_rot(xx, @y, 1, @angle)
	end

	def kill
	 kill=0

	 x=@x-$globx
	 if x<0
	  x*=-1
	 end

	 y=@y-$globy
	 if y<0
	  y*=-1
	 end
	 	 
	 if x<30 and y<20
	  kill=1
	 end
	 return kill
	end
	
	def check(x,y)
	 arsize = $lvl_xy[0].size
	 a=$lvl_xy
	 dr=1
	i=0
	while i<arsize
         if (x > a[0][i].to_i-15 and x < a[0][i].to_i+55) and ( y+1> a[1][i].to_i-15 and y+1< a[1][i].to_i+55)
                dr=0
         end
        i += 1
	end
	
	return dr 
	end

	def cross
	  a=@x/640
	  b=$globx/640
	   if a.to_i == b.to_i
		result=1
	   else
		result=0
	   end
	 return result
	end

end


