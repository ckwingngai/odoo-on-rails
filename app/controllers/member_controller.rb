class MemberController < ApplicationController
  def test_form
    @companies = Company.all
  end

  def create
    @email = params[:email]
    isExist = check(@email)
    unless isExist
      @data = new_member(@email, params[:password], params[:company_id])
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

  def new_parti(member_id, company_id)
    new_parti = Participate.create({
      member_id: member_id,
      company_id: company_id,
      status: "active"
    })
    if new_parti.save
      @data = "New member id: #{member_id} is created with company_id: #{company_id}"
    else
      @data = "New member id: #{member_id} is created with no companies"
    end
    return @data
  end

  def new_member(email, password, company_id)
    new_member = Member.create({
      email: email,
      password: password,
      status: "pending",
      verify_code: Random.rand(10000000...99999999)
    })
    if new_member.save
      @active_link = request.protocol + request.host_with_port + "/member/verify/" + new_member.verify_code.to_s
      MemberMailer.verify_signup(email, @active_link).deliver
      @data = new_parti(new_member.id, company_id)
    else
      @data = "Fail to create new member"
    end
    return @data
  end

  def verify
    @member = Member.where('verify_code' => params[:code].to_i)
    if @member.length > 0
      @member.update_all(:status => "active")
      @result = "Congraduations! Your account is now active."
    else
      @result = "Invalid verification link"
    end
    render :plain => @result
  end

end
