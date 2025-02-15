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
        user.email = "#{'a' * 243}@example.com"
        expect(user.valid?).to eq true
        user.email = "#{'a' * 244}@example.com"
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
      it '一意であること' do
        dup_user = user.dup
        expect(dup_user.valid?).to eq false
        dup_user.email = 'dup_user@example.com'
        expect(dup_user.valid?).to eq true
      end
      it '保存時に小文字に変換されること' do
        user.email = user.email.upcase
        user.save
        expect(user.reload.email).to eq user.email.downcase
      end
    end
    context 'passwordカラム' do
      it '空欄でないこと' do
        user.password = user.password_confirmation = ''
        expect(user.valid?).to eq false
      end
      it '6文字以上であること' do
        user.password = user.password_confirmation = 'a' * 6
        expect(user.valid?).to eq true
        user.password = user.password_confirmation = 'a' * 5
        expect(user.valid?).to eq false
      end
    end
  end

  describe 'authenticated?メソッド' do
    let(:user) { create(:user) }

    it 'remember_digestがnilの場合はfalseを返すこと' do
      expect(user.authenticated?('')).to eq false
    end
    it 'remember_digestがnilでない場合はtrueを返すこと' do
      user.remember
      expect(user.authenticated?(user.remember_token)).to eq true
    end
  end
end
