class UserMailer < ActionMailer::Base
  default from: "notifications@coverage_reportr.com"

  def welcome_email(user)
    @user = user
    @url = "http://coverage-reportr.herokuapp.com/"
    mail(to: @user.email, subject: "Welcome to Coverage Reportr")
  end

end
