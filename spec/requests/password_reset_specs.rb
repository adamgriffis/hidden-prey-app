require 'spec_helper'

describe "PasswordResets" do
  it "emails user when requesting password reset" do
    player = Factory(:player)
    visit new_player_session_path
    click_link "forgot-password"
    fill_in "Email", :with => user.eSend me reset password instructionsmail
    click_button "Send me reset password instructions"
    current_path.should eq(new_player_session_path)
    page.should have_content("You will receive an email with instructions about how to reset your password in a few minutes.")
    last_email.to.should include(player.email)
  end

=begin
  it "does not email invalid user when requesting password reset" do
    visit login_path
    click_link "password"
    fill_in "Email", :with => "nobody@example.com"
    click_button "Reset Password"
    current_path.should eq(root_path)
    page.should have_content("Email sent")
    last_email.should be_nil
  end

  # I added the following specs after recording the episode. It literally
  # took about 10 minutes to add the tests and the implementation because
  # it was easy to follow the testing pattern already established.
  it "updates the user password when confirmation matches" do
    user = Factory(:user, :password_reset_token => "something", :password_reset_sent_at => 1.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)
    fill_in "Password", :with => "foobar"
    click_button "Update Password"
    page.should have_content("Password doesn't match confirmation")
    fill_in "Password", :with => "foobar"
    fill_in "Password confirmation", :with => "foobar"
    click_button "Update Password"
    page.should have_content("Password has been reset")
  end

  it "reports when password token has expired" do
    user = Factory(:user, :password_reset_token => "something", :password_reset_sent_at => 5.hour.ago)
    visit edit_password_reset_path(user.password_reset_token)
    fill_in "Password", :with => "foobar"
    fill_in "Password confirmation", :with => "foobar"
    click_button "Update Password"
    page.should have_content("Password reset has expired")
  end

  it "raises record not found when password token is invalid" do
    lambda {
      visit edit_password_reset_path("invalid")
    }.should raise_exception(ActiveRecord::RecordNotFound)
  end
=end
end