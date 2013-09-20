require 'rubygems'
require 'gosu' 
require './star.rb'
require './player.rb'
require './level.rb'
require './global.rb'
require './monsters.rb'

module ZOrder
  Background, Stars, Player, UI = *0..3
end


class GameWindow < Gosu::Window 
	def initialize 
		super 640,480,false 
		self.caption = "TEST GAME"
		@monsters = Array.new
		@monsters[0] = Array.new
		@monsters[1] = Array.new
		@monsters[2] = Array.new
		@background_image = Gosu::Image.new(self, "media/1.png", true)
		@level = Level.new(self)
		@level.warp(0,0)
		@player = Player.new(self)
		@player.warp(120,350)
#	Monsters
		@monsters[0].push(Turtle.new(self))
		@monsters[1].push(120)
		@monsters[2].push(250)
		@monsters[0].push(Turtle.new(self))
		@monsters[1].push(400)
		@monsters[2].push(100)
#		@monsters[0].push(Turtle.new(self))
#		@monsters[1].push(1400)
#		@monsters[2].push(10)
		i=0
		while i<@monsters[0].size
		@monsters[0][i].warp(@monsters[1][i].to_i,@monsters[2][i].to_i)
		i+=1
		end

		@star_anim = Gosu::Image::load_tiles(self, "media/star.png", 16, 16, false)
		@stars = Array.new
		@pl1anim_r = Array.new
		@pl1anim_l = Array.new
		@font = Gosu::Font.new(self, Gosu::default_font_name, 20)
#	Player right animation
#		@pl1anim_r.push(Gosu::Image.new(self, "media/pl_img4_r.png", false))
#                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img4_r.png", false))
#                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img4_r.png", false))
#                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img4_r.png", false))
#                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img4_r.png", false))
                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img5_r.png", false))
		@pl1anim_r.push(Gosu::Image.new(self, "media/pl_img5_r.png", false))
                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img5_r.png", false))
                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img5_r.png", false))
                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img5_r.png", false))
                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img2_r.png", false))
		@pl1anim_r.push(Gosu::Image.new(self, "media/pl_img2_r.png", false))
                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img2_r.png", false))
                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img2_r.png", false))
                @pl1anim_r.push(Gosu::Image.new(self, "media/pl_img2_r.png", false))
#	Player left animation
#		@pl1anim_l.push(Gosu::Image.new(self, "media/pl_img4.png", false))
#                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img4.png", false))
#                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img4.png", false))
#                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img4.png", false))
#                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img4.png", false))
                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img5.png", false))
		@pl1anim_l.push(Gosu::Image.new(self, "media/pl_img5.png", false))
                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img5.png", false))
                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img5.png", false))
                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img5.png", false))
                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img2.png", false))
		@pl1anim_l.push(Gosu::Image.new(self, "media/pl_img2.png", false))
                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img2.png", false))
                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img2.png", false))
                @pl1anim_l.push(Gosu::Image.new(self, "media/pl_img2.png", false))

	end 

	def update 
		if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
		 @player.turn_left(@pl1anim_l)
		 @sl=0
		end
		if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
		 @player.turn_right(@pl1anim_r)
		 @sl=0
		end
		if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
		 @player.jump
		 @sl=0
		end
		if button_down? Gosu::KbDown or button_down? Gosu::GpButton1 then
		 @player.down
		 @sl=0
		end
		@level.move
		@player.move
	        @player.gravity
		@player.jump2
		@player.collect_stars(@stars)
		i=0

		@monsters[0].each {|i|  
			i.move
			i.gravity
			}

#		@monsters[0].each {|i| 
#			if i.kill==1
#			 @player.live(1)
#			 @player.warp(120,350)
#			end
#			}

		if rand(100) < 4 and @stars.size < 25 then
		   @stars.push(Star.new(@star_anim))
		end

	end 

	def draw
		@level.draw($globx)

		if @player.live(0) > 0 
			@player.draw

		else
			@font.draw("GAME OVER", 200,200, ZOrder::UI, 3.0, 3.0, 0xcccc0000)
		end

		@background_image.draw(0, 0, 0)
		@stars.each { |star| star.draw }
		i=0

		@monsters[0].each { |i|
			if i.cross==1
			 i.draw
			end
			}

		@font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
		@font.draw("Live: #{@player.live(0)}", 580, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
	end 

	def button_down(id)
	 if id == Gosu::KbEscape
		close
	 end
	end
end 

window = GameWindow.new 
window.show 
