require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user, name: "Example User", email: "user@example.com") }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        expect(user.valid?).to eq false
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        user.email = ''
        expect(user.valid?).to eq false
      end
    end
  end
end
