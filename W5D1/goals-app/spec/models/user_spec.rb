require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }

    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6)}
    it { should allow_value(nil).for(:password) }
  end


  describe 'class methods' do
    describe '::find_by_credentials' do
      it 'returns the user if credentials match' do
        expect(user.find_by_credentials('nameofuser','userpassword')).to eq(user)
      end

      it 'returns nil if credentials fail' do
        expect(user.find_by_credentials('noname', 'nopassword')).to eq(nil)
      end
    end
  end

end
