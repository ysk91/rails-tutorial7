# spec/support/session_helper.rb
module SessionHelper
  def current_user_id
    page.get_rack_session_key('user_id')
  end
end

RSpec.configure do |config|
  config.include SessionHelper, type: :system
end
