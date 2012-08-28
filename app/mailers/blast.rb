class Blast < ActionMailer::Base
  default from: "bigaviationcom@gmail.com"
  def top_stories(contact)
    @contact = contact
    mail(:to => contact.email, :subject => "Todays top stories" )
  end
  def activate(contact)
    @contact = contact
    mail(:to => contact.email, :subject => "BigAviation email blast confirmation")
  end
end
