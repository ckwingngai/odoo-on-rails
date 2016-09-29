class MemberMailer < ApplicationMailer
  default from: "raymonddev1988@gmail.com"

  def verify_signup(email, verify_link)
    @greeting = "Welcome for using our services."
    @body = "Please click the following link to activate your account: #{verify_link}"
    mail(to: email, subject: "Please verify your email address for signup")
  end

  def invite_join(email, company, invite_link)
    @greeting = "Welcome for using our services."
    @body = "Please click the following link to join the company (#{company}): #{invite_link}"
    mail(to: email, subject: "Please accept the invitation to join #{company}")
  end

end
