require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :feature do
  describe 'Index' do
    before(:each) do
      User.destroy_all
      Category.destroy_all
      @user = User.new(fullname: 'test', password: '123123', email: 'test@test')
      @user.save

      @category = Category.new(id: 2,
                               name: 'Utilities',
                               icon: Rack::Test::UploadedFile.new('spec/support/image.jpg', 'image/jpg'),
                               total: 100, author_id: @user.id)
      @category.save

      visit new_user_session_path
      fill_in 'Email', with: 'test@test'
      fill_in 'Password', with: '123123'
      click_button 'Log In'
    end

    it 'shoud show the categories page' do
      expect(page).to have_content('Categories')
    end

    it 'should show all the category name Utilities' do
      expect(page).to have_content('Utilities')
    end

    it 'should show the total of 100.0$' do
      expect(page).to have_content('100.0$')
    end

    it 'should have a button to add categories' do
      expect(page).to have_button('Add a new Category')
    end

    it 'shoud redirect us to transactions page when we press the Utilities category' do
      click_on 'Utilities'
      expect(page.current_path).to eq('/categories/2/payments')
    end
  end
end
