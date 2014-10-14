class UserMailer < ActionMailer::Base
  default from: "bovavob@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://rails-bookmarking.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
