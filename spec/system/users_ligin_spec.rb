require 'rails_helper'

RSpec.xdescribe 'サインアップ', type: :system do
  it 'サインアップページにアクセスできること' do
    get root_url
    expect(page).to have_current_path(root_path)

    click_link 'Sign up now!'
    expect(page).to have_current_path(signup_path)
    exxpect(page).to have_content('<h1>Sign up</h1>')
  end
end
