class MemberController < ApplicationController
  def test_form
    @companies = Company.all
    MemberMailer.sample_email.deliver
  end

  def create
    @email = params[:email]
    isExist = check(@email)
    unless isExist
      new_member = Member.create({
        email: @email,
        password: params[:password]
      })
      if new_member.save
        new_parti = Participate.create({
          member_id: new_member.id,
          company_id: params[:company_id]
        })
        if new_parti.save
          @data = "New member id: #{new_member.id} is created with company_id: #{params[:company_id]}"
        else
          @data = "New member id: #{new_member.id} is created with no companies"
        end
      else
        @data = "Fail to create new member"
      end
    else
      @data = "Email already exists"
    end
    render :plain => @data
  end

  def check(email)
    exist = Member.where('email' => email)
    if exist.length > 0
      return true
    else
      return false
    end
  end

  def send_simple_message
    RestClient.post "https://api:YOUR_API_KEY"\
    "@api.mailgun.net/v3/YOUR_DOMAIN_NAME/messages",
    :from => "Excited User <mailgun@YOUR_DOMAIN_NAME>",
    :to => "bar@example.com, YOU@YOUR_DOMAIN_NAME",
    :subject => "Hello",
    :text => "Testing some Mailgun awesomness!"
  end

end
