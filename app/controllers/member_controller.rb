class MemberController < ApplicationController
  def test_form
    @companies = Company.all
  end

  def create
    new_member = Member.create({
      email: params[:email],
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
    render :plain => @data
  end
end
