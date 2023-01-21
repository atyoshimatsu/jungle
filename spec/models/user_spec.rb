require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be invalid with differrent password and password_confirmation' do
      @user = User.new(first_name: 'test', last_name: 'test', email: 'test@example.com', password: 'testtest1', password_confirmation: 'testtset2')
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should be invalid with existing email in the DB' do
      @user1 = User.new(first_name: 'test1', last_name: 'test1', email: 'test@example.com', password: 'testtest1', password_confirmation: 'testtest1')
      @user1.save
      @user2 = User.new(first_name: 'test2', last_name: 'test2', email: 'test@example.com', password: 'testtest2', password_confirmation: 'testtest2')
      @user2.save
      expect(@user1).to be_valid
      expect(@user2).to be_invalid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should be invalid without email' do
      @user = User.new(first_name: 'test', last_name: 'test', email: nil, password: 'testtest', password_confirmation: 'testtest')
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should be invalid without first name' do
      @user = User.new(first_name: nil, last_name: 'test', email: 'test@example.com', password: 'testtset', password_confirmation: 'testtest')
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should be invalid without last name' do
      @user = User.new(first_name: 'test', last_name: nil, email: 'test@example.com', password: 'testtset', password_confirmation: 'testtest')
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should be invalid less than 8 lentgth password' do
      @user = User.new(first_name: 'test', last_name: nil, email: 'test@example.com', password: 'test', password_confirmation: 'test')
      @user.save
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      expect(@user.errors.full_messages).to include("Password confirmation is too short (minimum is 8 characters)")
    end
  end
end
