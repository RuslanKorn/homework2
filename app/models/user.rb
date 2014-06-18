class User < ActiveRecord::Base
  has_many :movies
  
  include Clearance::User

  def confirm_email!
    Notifier.deliver_welcome(self)
    super
  end
end
