module SpecSessionsHelper
  def current_user_id
    page.get_rack_session_key('user_id')
  end

  def is_logged_in?
    current_user_id.present?
  end
end

RSpec.configure do |config|
  config.include SpecSessionsHelper, type: :system
end
