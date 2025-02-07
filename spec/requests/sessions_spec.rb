require 'rails_helper'

RSpec.describe 'ログインページ', type: :request do
  describe 'newページ' do
    before do
      get login_path
    end

    it 'ログインページが正常に表示されること' do
      expect(response).to have_http_status(200)
    end

    it 'ログインページにフォームが表示されること' do
      forms = [
        ['email', 'session[email]'],
        ['password', 'session[password]']
      ]
      forms.each do |type, name|
        expect(response.body).to include "input class=\"form-control\" type=\"#{type}\" name=\"#{name}\""
      end
      expect(response.body).to include 'input type="checkbox" value="1" name="session[remember_me]"'
      expect(response.body).to include 'input type="submit" name="commit" value="Log in"'
    end
  end
end
