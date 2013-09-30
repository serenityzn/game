$g=4
$grpower = Array.new
$r=125
$break=0
$lock=0
$mcol=1
#[0] block size,  [1] level size
$envsize=[40, 192]
# SPeed counts. 1=move speed, jump speed tap, gravity power, jump high (to increase jump high decrease value)
$speed = [2.5, 5, 2.5, 1, 34]
$levelarray=[
"123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678123456781234567812345678",
"+                                                                                                                                                                                               ",
"+                                                                                                                                                                                       ##      ",
"+                                                                    --------   ---?                 ?                                                                                 ###      ",
"+             ?                                                                                                    ---     -??-                                                       ####      ",
"+                                                                                                                                                                                    #####      ",
"+                                                                                                                                                                                   ######      ",
"+       -   -?-?-                    It        It                 -?-              ?     --      ?   ?   ?     -            --      #  #          ##  #            --?-            #######      ",
"+                            It      /|        /|                                                                                  ##  ##        ###  ##                          ########      ",
"+                   It       /|      /|        /|                                                                                 ###  ###      ####  ###     It              It #########      ",
"+                   /|       /|      /|        /|                                                                                ####  ####    #####  ####    /|              /|##########      ",
"===========================================================  ==============   ======================================================================  =========================================="
                ]

#$levelarray=[
#                        "123456781234567812345678123456781234567812345678",
#                        "                                                ",
#                        "                                                ",
#                        "                                                ",
#                        "                                                ",
#                        "                                                ",
#                        "                                                ",
#                        "   -                                            ",
#                        "                                                ",
#                        "                                                ",
#                        "  --                                            ",
#                        "                                                "
#                ]


$lvl_xy = Array.new
$lvl_xy[0] = Array.new
$lvl_xy[1] = Array.new
$levelflag

        array=$levelarray
        i=0
        j=0
	 array.each {|a|
                while j < $envsize[1]
                 if a[j].chr=='-' or a[j].chr=='=' or a[j].chr=='?' or a[j].chr=='+' or a[j].chr=='/' or a[j].chr=='|' or a[j].chr=='I' or a[j].chr=='t' or a[j].chr=='#'
		   x =40*j
                   y =40*i
                    $lvl_xy[0].push(x)
                    $lvl_xy[1].push(y)
                 end
                 j +=1
                end
                j=0
                i+=1
	 }
#puts $levelarray
kk=0
#$lvl_xy[0].each {|kk| puts kk}


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
#puts check(55,439.5)
# SPeed counts. 1=move speed, jump speed tap, gravity power, jump high (to increase jump high decrease value)

puts $lvl_xy[0]
puts ""
#puts $lvl_xy[1]

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

#puts delblock(120,280,$levelarray)
