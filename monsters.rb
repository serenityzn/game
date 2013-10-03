class Turtle
	def initialize(window)
	 @image = Gosu::Image.new(window, "media/turtle.png", false)
	 @x = @y = @vel_x  = @angle = 0.0
	 @route=0
	 @timgs = Array.new
	 @timgs.push(Gosu::Image.new(window, "media/turtle_r.png", false))
	 @timgs.push(Gosu::Image.new(window, "media/turtle.png", false))
	 $runflag=0
	 @monsterid=$mcol
	 $mcol+=1
	 @mkilled=0
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
	 end
	end
	
	def jump
	 @y-=3
	end

	def gravity
	 y=@y+2.5
	 if check(@x,y)==1
	  @y+=2.5
	 end
	 if @y>480
		@mkilled=1
	 end
	end	

	def move
if @mkilled==0	
	 if @y==$globy and @x-$globx<0
	  @route=1
	 end
	 if @y==$globy and @x-$globx>0
	  @route=0
	 end
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
	end

	def draw
if @mkilled==0
	 x=@x/640
	 xx=@x-x.to_i*640
	 @image.draw_rot(xx, @y, 1, @angle)
end
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

	def jmpcheck(x,y)
	 arsize = $lvl_xy[0].size
	 a=$lvl_xy
	 dr=0
	i=0
	while i<arsize
         if (x > a[0][i].to_i-55 and x < a[0][i].to_i+95) and ( y-a[1][i].to_i<80 )
                dr=1
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


class Mushroom
	def initialize(window)
	 @image = Gosu::Image.new(window, "media/mushroom.png", false)
	 @mimgs = Array.new
	 @mimgs.push(Gosu::Image.new(window, "media/mushroom.png", false))
	 @mimgs.push(Gosu::Image.new(window, "media/mushroom1.png", false))
	 @x = @y = @vel_x  = @angle = 0.0
	 @route=0
	 @anim=0
	 @monsterid=$mcol
	 $mcoord[0][@monsterid]=@x
	 $mcoord[1][@monsterid]=@y
	 $mcol+=1
	 @mkilled=0
	end

	def warp(x,y)
	 @x, @y = x, y
	 @route=0
	end

	def turn_left
	 x=@x-0.5
	 if check(x,@y)==1
		if mcross(x,@y,1)==1
		  @x-=0.5
		else
		 @route=1
		end
	 else
	  @route=1
	 end
	 $mcoord[0][@monsterid]=@x
	end

	def turn_right
	 x=@x+0.5
	 if check(x,@y)==1
		if mcross(x,@y,0)==1
		  @x+=0.5
		else
		  @route=0
		end
	 else
	  @route=0
	 end
	 $mcoord[0][@monsterid]=@x
	end
	
	def gravity
if @mkilled==0
	 y=@y+2.5
	 if check(@x,y)==1
	  @y+=2.5
	 end
	 $mcoord[1][@monsterid]=@y
	 if @y>480
	 puts "Killed"
	  destruct
	 end
end
	end	

	def move
if @mkilled==0
		if @anim>-1 and @anim<11
		 @image=@mimgs[0]
		else
		 @image=@mimgs[1]
		end
		@anim+=1

		if @anim==20
		 @anim=0
		end
		if @route==1
		 turn_right
		else
		 turn_left
		end
end		
	end

	def draw
if @mkilled==0
	 x=@x/640
	 xx=@x-x.to_i*640
	 @image.draw_rot(xx, @y, 1, @angle)
end
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

	def mcross(x,y,route)
		result=1
		i=0
		while i<$mcoord[0].size
		 if i!=@monsterid
		  if $mcoord[1][i]==y
			if route==1
			 if $mcoord[0][i]+40-x>0 and $mcoord[0][i]+40-x<5
				result=0
			 end
			else
			 if x-$mcoord[0][i]+40>0 and x-$mcoord[0][i]+40<5
				result=0
			 end
			end
		  end
		 end
	
		 i+=1
		end
	return result
	end
	
	def destruct
		@mkilled=1
	end
end


