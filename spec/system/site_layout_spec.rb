require 'rails_helper'

RSpec.describe 'サイトレイアウト', type: :system do
  it 'レイアウトリンクが正しいことを確認する' do
    get root_url

    expect(page).to have_current_path(root_path)

    expect(page).to have_link(nil, href: root_path, count: 2)
    expect(page).to have_link(nil, href: help_path)
    expect(page).to have_link(nil, href: about_path)
    expect(page).to have_link(nil, href: contact_path)
  end
end
