# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    MemberMailer.sample_email()
  end
end
