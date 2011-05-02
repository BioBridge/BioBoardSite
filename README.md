Introduction
============

This is the web app for the BioBoard. Below is an install guide to help you get started with the software for your BioBoard.

Installing the Web App
======================

Create a directory for the software:

  mkdir ~/bioboard

  cd ~/bioboard

Install ruby:

  sudo apt-get install ruby-full

Go to http://rubygems.org/ and download the rubygems tgz.

extract the files:

<blockquote>
  tar xvzf rubygems-1.7.2.tgz
</blockquote>

Install rubygems:

<blockquote>
  cd rubygems-1.7.2/

  sudo ruby setup.rb

  cd /usr/bin/

  sudo ln -s gem1.8 gem
</blockquote>

Install Ruby on Rails:

<blockquote>
  sudo gem install rails --no-rdoc --no-ri
</blockquote>

Make sure you have git installed:

<blockquote>
  sudo apt-get install git-core
</blockquote>

Get the code for the web app:

<blockquote>
  cd ~/bioboard/

  git clone https://github.com/BioBridge/BioBoardSite.git
</blockquote>

Install web app dependencies:

<blockquote>
  sudo apt-get install libsqlite3-dev

  bundle install
</blockquote>

Initialize the database:

<blockquote>
  cd ~/bioboard/BioBoardSite/config/

  tar xvf config_examples.tar

  cd ..

  rake db:migrate
</blockquote>

Start the web app to see if it works:

<blockquote>
  rails s
</blockquote>

You should get something like the following:

<blockquote>
=> Booting WEBrick
=> Rails 3.0.5 application starting in development on http://0.0.0.0:3000
=> Call with -d to detach
=> Ctrl-C to shutdown server
[2011-05-01 21:57:44] INFO  WEBrick 1.3.1
[2011-05-01 21:57:44] INFO  ruby 1.8.7 (2010-06-23) [i686-linux]
</blockquote>

Open your web-browser and go to:

<blockquote>
  http://localhost:3000/
</blockquote>

You should see the welcome page.
If you did: Congratulations! You're almost there :-) Let the webserver run, open up a new terminal and continue to the next section.

If it's not working: Go to our support forum at TODO ref

Installing the log & comet server
=================================

This assumes that you have installed the web app on the same computer. You can have the log & comet server on a different computer, but for that you're on your own.

Get the code:

<blockquote>
  cd ~/bioboard/

  git clone https://github.com/BioBridge/BioBoardLogServer.git
</blockquote>

Install the dependencies:

<blockquote>
  sudo aptitude install build-essential

  sudo gem install eventmachine --no-ri --no-rdoc

  sudo gem install json
</blockquote>

Start the log server:

<blockquote>
  cd BioBoardLogServer/

  ./server
</blockquote>

Note that the server assumes your sqlite database is at "../BioBoardSite/db/dev.sqlite". This will be true if you followed this guide. If you want to keep your sqlite database elsewhere, you need to modify the line "dbpath = '../BioBoardSite/db/dev.sqlite'" in the file "BioBoardLogServer/server.rb", and the line "database: db/dev.sqlite" in the file "BioBoardSite/config/database.yml". 

Testing the setup
=================

Now you are ready to test if everything works.

Open up a new terminal and go to the log server directory:

<blockquote>
  cd ~/BioBoardLogServer/
</blockquote>

To test the setup, you can start a small program that simulates an attached BioBioard:

<blockquote>
  ./board_simulator.rb
</blockquote>

This will begin sending fake data to the server you started previously. You can now go back to your web browser to verify that the data is there.

Go to:

<blockquote>
  http://localhost:3000/
</blockquote>

In the project list at the bottom, click the "BATCH1" project.

If everything is working, you should see a graph with two lines. You can hit refresh in the browser to update the graphs with the new data.

Connecting the BioBoard
=======================

There are two ways of connecting BioBoards to the log server. One is to connect the Arduino to the computer running the logserver using USB. The other is to use an Arduino Ethernet Shield to send over a local network or the Internet. 

Using USB
---------

TODO writeme

Using the Ethernet Shield
-------------------------

TODO writeme
