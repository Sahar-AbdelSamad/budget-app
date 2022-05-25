require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.new(fullname: 'sahar', email: 'sah@ar', password: '123123')
    @user.save
  end
  subject do
    Category.new(author_id: @user.id, name: 'Rent',
                 icon: Rack::Test::UploadedFile.new('spec/support/image.jpg', 'image/jpg'))
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an amount' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
