$mcol=1
$envsize=[40, 48]
$speed = [2.5, 2.5, 2.5, 1.5]
$levelarray=[
                        "123456781234567812345678123456781234567812345678",
                        "-                                              -",
                        "- -            -----    ------------------     -",
                        "-  -    -------                                -",
                        "-    -                              ------     -",
                        "-      -----                                   -",
                        "-                          -----------         -",
                        "------           --------                      -",
                        "-                                         ---  -",
                        "-   -------------      ----------------        -",
                        "-  -                                           -",
                        "------------------------------------------------"
                ]

$lvl_xy = Array.new
$lvl_xy[0] = Array.new
$lvl_xy[1] = Array.new
$levelflag

        array=$levelarray
        i=0
        j=0
        while i<12
                a=array[i]
                while j < $envsize[1]
                 if a[j].chr=='-'
		   x =40*j
                   y =40*i
                    $lvl_xy[0].push(x)
                    $lvl_xy[1].push(y)
                 end
                 j +=1
                end
                j=0
                i+=1
        end
#puts $levelarray
kk=0
while kk< $lvl_xy[0].size
	puts "Coord:[#{$lvl_xy[0][kk]},#{$lvl_xy[1][kk]}]"
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
puts check(55,439.5)

# SPeed counts. 1=move speed, jump speed tap, gravity power, jump high (to increase jump high decrease value)
