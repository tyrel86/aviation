class Contact
  include Mongoid::Document
  field :email, type: String
  field :active, type: Boolean
  field :key, type: String

  email_reg = /^([\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+\.)*[\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)$/i
  validates_uniqueness_of :email
  validates_format_of :email, with: email_reg
  validates :email, presence: true

  def self.blast
    self.all.each do |e|
      
    end
  end
end
