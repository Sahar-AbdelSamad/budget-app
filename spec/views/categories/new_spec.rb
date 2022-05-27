require 'rails_helper'

RSpec.describe 'categories/new.html.erb', type: :feature do
  describe 'new' do
    before(:each) do
      User.destroy_all
      Category.destroy_all
      Payment.destroy_all
      CategoryPayment.destroy_all
      @user = User.new(fullname: 'test', password: '123123', email: 'test@test')
      @user.save

      @category = Category.new(id: 2, name: 'Utilities',
                               icon: Rack::Test::UploadedFile.new('spec/support/image.jpg', 'image/jpg'),
                               total: 100, author_id: @user.id)
      @category.save

      visit new_user_session_path
      fill_in 'Email', with: 'test@test'
      fill_in 'Password', with: '123123'
      click_button 'Log In'
      click_link 'Add a new Category'
    end

    it 'shoud show the add a new category page' do
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'shoud have a save button' do
      expect(page).to have_button('SAVE')
    end
  end
end
