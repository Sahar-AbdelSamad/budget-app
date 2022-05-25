require 'rails_helper'

RSpec.describe 'payments/index.html.erb', type: :feature do
  describe 'Index' do
    before(:each) do
      User.destroy_all
      Category.destroy_all
      Payment.destroy_all
      CategoryPayment.destroy_all
      @user = User.new(fullname: 'test', password: '123123', email: 'test@test')
      @user.save

      @category = Category.new(id: 2,
                               name: 'Utilities',
                               icon: Rack::Test::UploadedFile.new('spec/support/image.jpg', 'image/jpg'),
                               total: 100, author_id: @user.id)
      @category.save

      @payment = Payment.new(id: 3, name: 'Rent', amount: 100, author_id: @user.id)
      @payment.save

      @category_payment = CategoryPayment.new(id: 4, category_id: @category.id, payment_id: @payment.id)
      @category_payment.save

      visit new_user_session_path
      fill_in 'Email', with: 'test@test'
      fill_in 'Password', with: '123123'
      click_button 'Log In'
      click_on 'Utilities'
    end

    it 'shoud show the transactions page' do
      expect(page).to have_content('Transactions')
    end

    it 'should show Rent transaction name' do
      expect(page).to have_content('Rent')
    end

    it 'should show the total amount of each transaction' do
      expect(page).to have_content('100.0$')
    end

    it 'should have a button to add a new transaction' do
      expect(page).to have_button('Add a new Transaction')
    end

    it 'should redirect us to the payments#new page when we press Add a new Transaction' do
      click_link 'Add a new Transaction'
      expect(page.current_path).to eq('/categories/2/payments/new')
    end

    it 'shoud have the total of all transactions for the category' do
      expect(page).to have_content('Total: 200.0$')
    end
  end
end
