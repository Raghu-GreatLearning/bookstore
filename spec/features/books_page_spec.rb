require 'rails_helper'

RSpec.feature "See books", type: :feature do
  context 'features test for books page' do
    let(:book) { build(:book) }
    let(:admin) { build(:user) }


    before(:each) do
      visit(sign_up_path)
      expect(current_path).to eq(sign_up_path)
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      fill_in "Confirm password", with: admin.confirm_password
      click_button("Sign Up")
    end

    it 'check sign Up' do
      visit(sign_up_path)
      expect(current_path).to eq(sign_up_path)
    end

    it 'visit books page and find add book link' do
      visit(see_books_path)
      expect(page).to have_link('Add new Book')
      click_link('Add new Book')
      expect(current_path).to eq(add_book_path)
    end

    it 'Go to add book page' do
      visit(see_books_path)
      click_link('Add new Book')
      expect(current_path).to eq(add_book_path)
    end

    it 'Go to add book page and add a book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      expect(page).to have_content('Successfully Added book to database')
    end

    it 'Error on adding a book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume

      click_button("Add Book")
      expect(page).to have_content('Fill out Book details')
    end

    it 'After adding a book Try to issue that book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      click_link("Issue Book")
      expect(page).to have_content(book.title)
    end

    it 'After adding a book Try to show details of that book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      click_link("Show Details")
      expect(page).to have_content(book.title)
    end

  end
end