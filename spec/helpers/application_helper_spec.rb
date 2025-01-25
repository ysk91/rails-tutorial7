require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'full_title' do
    it '引数なしの表示' do
      expect(full_title).to eq('Ruby on Rails Tutorial Sample App')
    end
    it '引数ありの表示' do
      expect(full_title('Test')).to eq('Test | Ruby on Rails Tutorial Sample App')
    end
  end
end
