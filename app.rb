require 'sinatra'
require 'sendgrid-ruby'
include SendGrid


$menu = [
	{page: 'Home', href: '/'},
	{page: 'About', href: '/about'},
	{page: 'Gallery', href: '/gallery'},
	{page: 'Schedule', href: '/schedule'},
	{page: 'News', href: '/news'},
	{page: 'Contact', href: '/contact'}
]

 get '/' do
 	@title = "Rich Mahogany :: Home" 
 	erb :home
 end

get '/about' do
	@title = "Rich Mahogany :: About" 
	erb :about
end

get '/gallery' do
	@title = "Rich Mahogany :: Gallery" 
	erb :gallery
end

 get '/schedule' do
 	@title = "Rich Mahogany :: Schedule" 
 	erb :schedule
 end

 get '/news' do
 	@title = "Rich Mahogany :: News" 
 	@fb_link = '<script type="text/javascript" src="https://developers.facebook.com/docs/></script>'
 	@news_fb = '<script type="text/javascript" src="js/facebook.js"></script>'

 	erb :news
 end

 get '/contact' do
 	@title = "Rich Mahogany :: Contact" 
 	puts "SG API KEY is #{ENV['SENDGRID_API_KEY']}"
 	erb :contact
 end

 post '/contact' do
 	# From Address & TO Address -> SendGrid::Email
 	# Subject -> String
 	# Content -> SendGrid::Content
 	# Actual Email -> SendGrid::Mail
 	# Mail(from, subject, to, content)

 	email_client = Email.new(email: "dannawolf1@gmail.com") 
 	email_user = Email.new(email: params[:email])
 	subject_to_user = 'Thanks for contacting Rich Mahogany'
 	subject_to_client = params[:subject]
 	content_to_client = Content.new(type: 'text/plain', value: %{
 		#{params[:fname]} #{params[:lname]} has sent a message:

 		--------------------------------------------------------

 		#{params[:message]} } )

 	content_to_user = Content.new(type: 'text/plain', value: %{
 		Thank you #{params[:fname]} for letting us know how you feel.
 		Our team will be in contact with you shortly.
 		Here's a copy of the feedback we received

 		--------------------------------------------------------

 		#{params[:message]} })

 	# email to user
 	mail = Mail.new(email_client, subject_to_user, email_user, content_to_user)

 	# email to client
 	mail2 = Mail.new(email_user, subject_to_client, email_client, content_to_client)

 	# sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
 	# the above doesn't work bc 
 	puts "SG API KEY is #{ENV['SENDGRID_API_KEY']}"

 	sg = SendGrid::API.new(api_key: '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')

 	response = sg.client.mail._('send').post(request_body: mail.to_json)
 	response2 = sg.client.mail._('send').post(request_body: mail2.to_json)

 	puts response.status_code
 	puts response.body
 	puts response.headers

 	puts response2.status_code
 	puts response2.body
 	puts response2.headers

 	@title = "Rich Mahogany :: Contact" 
 	puts params.inspect
 	@msg = "Thank you for your submission"
 	erb :contact
 end