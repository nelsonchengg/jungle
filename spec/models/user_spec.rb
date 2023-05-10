require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should create a user with same password and password confirmation fields" do
    @user = User.new(first_name: "Bobby", last_name: "Lee", email: "test@test.com", password: "password", password_confirmation: "password")
    expect(@user.valid?).to be true
    end
  
    it 'should not be created if password and password_confirmation fields do not match' do
      @user = User.new(first_name: "Bobby", last_name: "Lee", email: "test@test.com", password: "password", password_confirmation: "password123")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not be created with empty password or password confirmation fields' do
      @user = User.new(first_name: "Bobby", last_name: "Lee", email: "test@test.com", password: nil, password_confirmation: nil)
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should check if email is already in the system via case sensitivity' do
      @user = User.create(first_name: "Bobby", last_name: "Lee", email: "test@test.com", password: "password", password_confirmation: "password")
      @anotheruser = User.new(first_name: "Bobby", last_name: "Lee", email: "TEST@TEST.COM", password: "password", password_confirmation: "password")
      expect(@anotheruser.valid?).to be false
      expect(@anotheruser.errors.full_messages).to include("Email has already been taken")
    end

    it 'should require first name, last name, and email fields' do
      @user = User.new(password: "password", password_confirmation: "password")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank", "Email can't be blank")
    end

    it 'should have a passwords with minimum of 6 characters' do
      @user = User.new(first_name: "Bobby", last_name: "Lee", email: "test@test.com", password: "pass", password_confirmation: "pass")
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
