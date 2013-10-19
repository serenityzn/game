$drcount=20
$drsome = Array.new
$drsome.push("media/block2.png")
$drx=-10
$dry=-10
$mcoord = Array.new
$mcoord[0] = Array.new
$mcoord[1] = Array.new
$jmparr=[1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 26]
$g=0.5
$grpower = Array.new
$r=170
$break=0
$lock=0
$mcol=0
#[0] block size,  [1] level size
$envsize=[40, 208]
#$envsize=[40, 16]
# SPeed counts. 1=move speed, jump speed tap, gravity power, jump high (to increase jump high decrease value)
$speed = [4, 7, 2.5, 1, 13] #24
$blsave = Array.new
$bllock=0
$levelarray = Array.new
 $levelarray=[
"1234567812345678123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678",
"+                                                                                                                                                                                                               ",
"+                                                                                                                                                                                       ##                      ",
"+                                                                    --------   ---?                 ?                                                                                 ###                      ",
"+             ?                                                                                                    ---     -??-                                                       ####                      ",
"+                                                                                                                                                                                    #####                      ",
"+                                                                                                                                                                                   ######                      ",
"+       -   -?-?-                    It        It                 -?-              ?     --      ?   ?   ?     -            --      #  #          ##  #            --?-            #######                      ",
"+                            It      /|        /|                                                                                  ##  ##        ###  ##                          ########                      ",
"+                   It       /|      /|        /|                                                                                 ###  ###      ####  ###     It              It #########                      ",
"+                   /|       /|      /|        /|                                                                                ####  ####    #####  ####    /|              /|##########                      ",
"===========================================================  ==============   ======================================================================  =========================================================="
                ]
=begin
 $levelarray=[
                         "1234567812345678",
                        "                ",
                        "    ??-?-?      ",
                        "                ",
                        "                ",
                        "    --?---      ",
                        "                ",
                        "                ",
                        "    ??????      ",
                        "                ",
                        "                ",
                        "================"
                ]
=end

#$blsave=$levelarray
$lvl_xy = Array.new
$lvl_xy[0] = Array.new
$lvl_xy[1] = Array.new
$lvl_xy[2] = Array.new
$levelflag

        array=$levelarray
        i=0
        j=0
	step=0
	 array.each {|a|
                while j < $envsize[1]
                 if a[j].chr=='-' or a[j].chr=='=' or a[j].chr=='?' or a[j].chr=='+' or a[j].chr=='/' or a[j].chr=='|' or a[j].chr=='I' or a[j].chr=='t' or a[j].chr=='#'
		   x =40*j
                   y =40*i
                    $lvl_xy[0].push(x)
                    $lvl_xy[1].push(y)
			if a[j].chr=='-'
			 $lvl_xy[2].push(0)
			else
			 $lvl_xy[2].push(1)
			end
                 end
                 j +=1
                end
                j=0
                i+=1
	 }
puts $levelarray
kk=0
#$lvl_xy[2].each {|kk| puts kk}
while kk<$lvl_xy[1].size
	puts "X=#{$lvl_xy[0][kk]}, Y=#{$lvl_xy[1][kk]}, TYPE=#{$lvl_xy[2][kk]} "
	kk+=1
end


 def check(x,y)
         arsize = $lvl_xy[0].size
         a=$lvl_xy
         dr=1
        i=0
        while i<arsize
         if (x > a[0][i].to_i and x < a[0][i].to_i+40) and ( y+1> a[1][i].to_i and y+1< a[1][i].to_i+40)
                dr=0
         end
        i += 1
        end

        return dr
        end

  def delblock(x,y,array)
         ax=x/40
         ay=y/40
         puts "delx=#{ax}, delt=#{ay}"
         str=array[ay]
         mas=str.scan(/./)
         mas[ax]=' '
         str=mas.to_s
         array[ay]=str
        return array
        end

