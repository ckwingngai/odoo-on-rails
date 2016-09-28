class MemberMailer < ApplicationMailer
  default from: "raymonddev1988@gmail.com"

  def sample_email
    puts "sending email..."
    mail(to: "ckwingngai@gmail.com", subject: 'Sample Email')
  end

end
