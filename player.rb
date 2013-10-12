class Player
	def initialize(window)
	 @image = Gosu::Image.new(window, "media/mario_0.png", false)
	 @image_arr = Array.new
	 @image_arr[0] = Gosu::Image.new(window, "media/mario_0.png", false) 
	 @x = @y = @vel_x = @vel_y = @angle = 0.0
	 $score = 0
	 @live=3
	 @count=0
	 $gravity=1
	 @isjump=0
	 @route=0
	 @gpower=1
	end
	
	
	def warp(x,y)
	 @x, @y = x, y
	 $globx=@x
	 $globy=@y

	end

	def turn_left(image)

	 @route=0
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
	 @route=1
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
	 @beep=$plsounds[0]
	 @beep.play
	 @beep.play
#	 playsnd(self)	 
		@isjump=1
		$ifground=0
		$jmp=$speed[4]
		@high=170
		
	 end
	end
	
	def jump2
	 if $jmp.to_i>0
	  $jmp-=$speed[3]
		y=@y-$jmparr[$jmp]
	   if check($globx,y,1).to_i==1
	    @y-=$jmparr[$jmp]
	   end
	 end
	end

	def down
	 y=@y+$speed[2]
	 if check($globx,y,1).to_i==1
	  @y += $speed[2]
	 end	
	puts "Monsters count=#{$mcol}"
	i=0
		while i<$mcoord[0].size
		 puts "MonstersXY[#{$mcoord[0][i]},#{$mcoord[1][i]}"
		 i+=1
		end
	
	end
	
	def gravity
	tot=0
	 if $jmp.to_i==0 
		if @gpower==1
		 @high=calch($globx,$globy)
		 if @high>25
			 time=gettime(@high)
			 $grpower=GrPower(time,@high)
		 end
		 @gpower=0
		end
	   prom=$grpower.pop
		if prom==nil
		  prom=2.5
		end
	   y=@y+prom
	   $ifground=0
	   if check($globx,y,1).to_i==1 and $gravity==1
	    @y +=prom
	 @image = @image_arr[0]
	   else
	    $ifground=1
	    @gpower=1
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
#	 mushkill
	end

	def draw
	 @image.draw_rot(@x, @y, 1, @angle)
	end

	def score
	 $score
	end

	def live(a)
	 if a==1
	 @live-=1
	 end
	@live
	end

	def collect_stars(stars)
	 if stars.reject! {|star| Gosu::distance(@x, @y, star.x, star.y) < 35 } then
	 $score += 1
	 end
	end


	def delblock(x,y,array)
         ax=x/40
         ay=y/40
         str=array[ay]
         mas=str.scan(/./)
         mas[ax]=' '
         str=mas.to_s
         array[ay]=str
	return array
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
		if $break==1 and @isjump==1 and $globy>a[1][i] and ((a[0][i]-$globx<0 and @route==1) or (a[0][i]-$globx>-50 and @route==0))
		 if a[2][i]==0
		  $levelarray=delblock(a[0][i],a[1][i],$levelarray)		 
		  a[0].delete_at(i)
		  a[1].delete_at(i)
		  a[2].delete_at(i)
      	          @beep = $plsounds[1]
		  @beep.play
		 else
      	          @beep = $plsounds[2]
		  @beep.play
		  $blsave = $levelarray
		  $levelarray=delblock(a[0][i],a[1][i],$levelarray)		 
		  $drsome.push("media/block2.png")
		  $drx=a[0][i]
		  $dry=a[1][i]-20
#		  a[1][i]-=10
		 end
		
		 $lock=0
		end
         end
        i += 1
	end
	
	return dr 
	end
	def grav(r)
        l=39062.5
        gr=l/(r*r)
	$r-=gr
	if $r<25
	 $r=125
	end
        return gr
	end


	def gettime(h)
	        t=Math.sqrt((h*2)/$g)
	        return round(t)
	end

	def GrPower(t,r)
	        i=1
	        gp = Array.new
	        final = Array.new
		final1 = Array.new
	        while i<t+1
	        gp.push(($g*i*i)/2)
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
		total=0
	        final1.each {|a|
	         total+=a
	        }
	        delta=r-total
	                final1[0]=final1[0]+delta
	
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

	def calch(x,y)
	high=420-y
	        return high
	end

	def mushkill
		 i=0
		 while i<$mcoord[0].size
			if $mcoord[1][i]-40>@y and @y>373
			 puts "3"
			 if $mcoord[0][i]-20<@x and $mcoord[0][i]+20>@x
				puts "MUSHROOM KILLED"
			 end
			end
		  i+=1
		 end
	end
	
	def drawsome(x,y)
	 $somedraw.draw(x, y, 1)
	end
end
