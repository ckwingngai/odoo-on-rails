class MemberController < ApplicationController
  def test_form
  end

  def create
    new_member = Member.create({
      email: params[:email],
      password: params[:password]
    })
    if new_member.save
      @data = "New member is created"
    else
      @data = "Fail to create new member"
    end
    render :plain => @data
  end
end
