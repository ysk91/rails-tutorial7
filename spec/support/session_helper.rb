module SessionHelper
  def current_user_id
    page.get_rack_session_key('user_id')
  end

  def is_logged_in?
    current_user_id.present?
  end

  def log_in_as(user)
    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end

RSpec.configure do |config|
  config.include SessionHelper, type: :system
end
