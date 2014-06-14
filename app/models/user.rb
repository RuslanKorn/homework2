class User < ActiveRecord::Base
  include Clearance::User

  def confirm_email!
    Notifier.deliver_welcome(self)
    super
  end
end
