 require 'sinatra'
$menu = [
	    {page: 'Home', href: '/'},
	    {page: 'About', href: '/about'},
	    {page: 'Gallery', href: '/gallery'},
	    {page: 'Schedule', href: '/schedule'},
	    {page: 'News', href: '/news'},
	    {page: 'Contact', href: '/contact'}
  	]
 get '/' do 
 	erb :home
 end

 get '/schedule' do
 	erb :schedule
 end

 get '/gallery' do
 	erb :gallery
 end

 get '/about' do
 	erb :about
 end