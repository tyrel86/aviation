class MailerController < ApplicationController
  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to "/"
  end

  def activate
    contact = Contact.find(params[:id])
    contact.active = true if contact.key == params[:key]
    contact.save
    redirect_to "/"
  end

  def create
    unless Contact.where(email: params[:email]).empty?
      redirect_to root_url, notice: "This email has already been registered to activate it click the activate link in the email we sent you from bigaviationcom@gmail.com"
    return
    end
    if params[:email] =~ /^([\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+\.)*[\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)$/i
      c = Contact.create( email: params[:email], key: SecureRandom.hex(8), active: false )
      Blast.activate(c).deliver
      redirect_to root_url, notice: "Thank you for signing up to our news letter. A confirmation email has been sent please verfy at your convenience"
    else
      redirect_to root_url, notice: "Please input a valid email address if you wish to sign up to our newsletter"
    end
  end

end
