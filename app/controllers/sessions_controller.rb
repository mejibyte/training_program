class SessionsController < ApplicationController
  def new
  end
  
  def create
    salt = "24f4008ed0d24b0cab290405015cf8c40a234c3a8290c2004afa3ecb8b691a293b1a33d9ccdd944d"
    if Digest::SHA1.hexdigest(params[:session][:password] + salt) == "049846cafbd0e4b0f4b048592fc96131d77ea390"
      session[:admin] = true
      redirect_to session.delete(:return_to) || root_url, :notice => "Welcome in, beautiful person!"
    else
      flash.now[:alert] = "Nope, keep tryin'."
      render "new"
    end
  end
  
  def destroy
    authorize! :destroy, :session
    session[:admin] = nil
    redirect_to root_url, :notice => "Bye bye, beautiful person! See you soon."
  end
end
