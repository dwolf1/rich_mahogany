 require 'sinatra'

 get '/' do 
 	@menu = [
	    {page: 'Home', href: '/'},
	    {page: 'About', href: '/about'},
	    {page: 'Gallery', href: '/gallery'},
	    {page: 'Schedule', href: '/schedule'},
	    {page: 'News', href: '/news'},
	    {page: 'Contact', href: '/contact'}
  	]

 	erb :home
 end