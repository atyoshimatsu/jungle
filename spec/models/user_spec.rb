require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be invalid with differrent password and password_confirmation' do
      @user = User.new(first_name: 'test', last_name: 'test', email: 'test@example.com', password: 'test1', password_confirmation: 'test2')
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should be invalid with existing email in the DB' do
      @user1 = User.new(first_name: 'test1', last_name: 'test1', email: 'test@example.com', password: 'test1', password_confirmation: 'test1')
      @user1.save
      @user2 = User.new(first_name: 'test2', last_name: 'test2', email: 'TEST@example.com', password: 'test2', password_confirmation: 'test2')
      @user2.save
      expect(@user2).to be_invalid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should be invalid without email' do
      @user = User.new(first_name: 'test', last_name: 'test', email: nil, password: 'test', password_confirmation: 'test')
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should be invalid without first name' do
      @user = User.new(first_name: nil, last_name: 'test', email: 'test@example.com', password: 'test', password_confirmation: 'test')
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should be invalid without last name' do
      @user = User.new(first_name: 'test', last_name: nil, email: 'test@example.com', password: 'test', password_confirmation: 'test')
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
  end
end
