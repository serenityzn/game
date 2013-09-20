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

array = [
	"...",
	".-.",
	"-.-"
]
$lvl_xy= Array.new
$lvl_xy[0]= Array.new
$lvl_xy[1]= Array.new

i=0
j=0
         array.each {|a|
                while j < 3
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
         }
puts "OLD"
puts array
array1=delblock(80,80,array)
puts "new"
puts array1
#puts array
#$lvl_xy[0].each {|index| puts "X=[#{index}]"}
#$lvl_xy[1].each {|index| puts "Y=[#{index}]"}

#str="abvgd3aaa"

