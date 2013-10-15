require 'spec_helper'

describe Player do

  before(:each) do
    @attr = {
      :username => "user",
      :email => "user@example.com",
      :password => "changeme",
      :password_confirmation => "changeme"
    }
  end

  it "should create a new instance given a valid attribute" do
    Player.create!(@attr)
  end

  it "should require an email address" do
    no_email_user = Player.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = Player.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = Player.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    Player.create!(@attr)
    user_with_duplicate_email = Player.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    Player.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = Player.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject duplicate usernames" do
    Player.create!(@attr)
    user_with_duplicate_username = Player.new(@attr.merge(:username => "test2"))
    user_with_duplicate_username.should_not be_valid
  end

  it "should reject duplicate usernames up to case" do
    upcased_username = @attr[:username].upcase
    Player.create!(@attr)
    user_with_duplicate_username = Player.new(@attr.merge(:username => upcased_username))
    user_with_duplicate_username.should_not be_valid
  end


  describe "passwords" do

    before(:each) do
      @player = Player.new(@attr)
    end

    it "should have a password attribute" do
      @player.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @player.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      Player.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      Player.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      Player.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @player = Player.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @player.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @player.encrypted_password.should_not be_blank
    end
  end
end
