require 'jwt'

class MemberController < ApplicationController
  def jwt_demo
    payload = {:data => 'test'}
    # IMPORTANT: set nil as password parameter
    token = JWT.encode payload, nil, 'none'
    # eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJkYXRhIjoidGVzdCJ9.
    puts "token: #{token}"
    # Set password to nil and validation to false otherwise this won't work
    decoded_token = JWT.decode token, nil, false
    # Array
    # [
    #   {"data"=>"test"}, # payload
    #   {"typ"=>"JWT", "alg"=>"none"} # header
    # ]
    puts "decoded_token: #{decoded_token}"
    puts "data: #{@data}"
    render :plain => decoded_token.to_json
  end

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

  def add_company
    @member_id = params[:member_id].to_i
    @company_id = params[:company_id].to_i
    exist = Participate.where('member_id' => @member_id, 'company_id' => @company_id)
    if (exist.length > 0)
      @result = "(Fail to add) Member id: #{@member_id} is already in company id: #{@company_id}"
    else
      @result = new_parti(@member_id, @company_id)
    end
    render :plain => @result
  end

  def invite_company
    @member = Member.find(params[:member_id].to_i)
    @company = Company.find(params[:company_id].to_i)
    exist = Participate.where('member_id' => @member.id, 'company_id' => @company.id)
    if exist.length > 0
      @result = "(Fail to send) The member id: #{@member.id} is already in the company id: #{@company.id}"
    else
      @invite_link = request.protocol + request.host_with_port + "/member/accept_company/#{@member.id}/#{@company.id}/" + @member.verify_code.to_s
      MemberMailer.invite_join(@member.email, @company.name, @invite_link).deliver
      @result = "Invitation sent"
    end
    render :plain => @result
  end

  def accept_company
    @member_id = params[:member_id].to_i
    @company_id = params[:company_id].to_i
    @member = Member.where('verify_code' => params[:code].to_i, 'id' => @member_id)
    if @member.length > 0
      @result = new_parti(@member_id, @company_id)
    else
      @result = "Invalid invitation link"
    end
    render :plain => @result
  end

end
