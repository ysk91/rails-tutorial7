require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user, name: "Example User", email: "user@example.com") }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        expect(user.valid?).to eq false
      end
      it '50文字以下であること' do
        user.name = 'a' * 50
        expect(user.valid?).to eq true
        user.name = 'a' * 51
        expect(user.valid?).to eq false
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        user.email = ''
        expect(user.valid?).to eq false
      end
      it '255文字以下であること' do
        user.email = 'a' * 243 + '@example.com'
        expect(user.valid?).to eq true
        user.email = 'a' * 244 + '@example.com'
        expect(user.valid?).to eq false
      end
      it 'フォーマットが正しいこと' do
        test_cases = [
          ['sample@example.com', true],
          ['sample@example', false],
          ['sample＠example.com', false]
        ]
        test_cases.each do |email, expected|
          user.email = email
          expect(user.valid?).to eq expected
        end
      end
    end
  end
end
