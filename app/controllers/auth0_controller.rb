class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']
    puts "Auth0: #{session[:userinfo]}"

    # Redirect to the URL you want after successfull auth
    redirect_to 'google.com'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
