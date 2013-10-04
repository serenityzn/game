LINUX INSTALL
=

 CentOS 6 (rpm based)
=

<pre><code>wget https://github.com/serenityzn/game/blob/master/rpms/mariogame-1-8.el6.x86_64.rpm
sudo rpm -vhi mariogame-1-10.el6.x86_64.rpm
</code></pre>

 CentOS 6 (from src)
=

Gosu's dependencies for both C++ and Ruby
         
<pre><code>sudo yum groupinstall --assumeyes "Development Tools"
sudo yum install --assumeyes freeglut-devel freeimage-devel mesa-libGL-devel openal-devel pango-devel \ 
SDL_ttf-devel libsndfile-devel libXinerama-devel libvorbis-devel</code></pre>
        
To install Ruby 1.9

<pre><code>sudo yum install --assumeyes ruby-devel rubygems</code></pre>

To install gosu

<pre><code>sudo gem install gosu</code></pre>

To start the game

<pre><code>cd game
ruby game.rb</code></pre>

Ubuntu (from src)
=
 
 Gosu's dependencies for both C++ and Ruby
        <pre><code>sudo apt-get install build-essential freeglut3-dev libfreeimage-dev libgl1-mesa-dev \
                             libopenal-dev libpango1.0-dev libsdl-ttf2.0-dev libsndfile-dev \
                             libxinerama-dev</code></pre>

To install Ruby 1.9 - if you are using rvm or rb-env, skip this step
<pre><code>sudo apt-get install ruby1.9.1-dev rubygems</code></pre>

If you are using rvm or rb-env, do not use 'sudo'
<pre><code>sudo gem install gosu</code></pre>

To start the game
<pre><code>cd game
ruby game.rb</code></pre>

WINDOWS INSTALL
==

Download and setup ruby installer 1.9.3. http://rubyinstaller.org/

Install gosu:

        gem install gosu

Run game:

        ruby.exe game.rb
 

