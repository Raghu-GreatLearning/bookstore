require 'rails_helper'

RSpec.feature "See books", type: :feature do
  context 'features test for books page' do
    let(:book) { build(:book) }
    let(:admin) { build(:user) }
    let(:student) {build(:student)}


    before(:each) do
      visit(sign_up_path)
      expect(current_path).to eq(sign_up_path)
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      fill_in "Confirm password", with: admin.confirm_password
      click_button("Sign Up")
    end

    it 'Go to add book page and add a book then issue it' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      expect(page).to have_content('Successfully Added book to database')
      click_link("Issue Book")
      expect(page).to have_content(book.title)
      fill_in "Name", with: student.name
      fill_in "Email", with: student.email
      fill_in "Issueddate", with: student.issuedDate
      fill_in "Returndate", with: student.returnDate
      click_button("Issue Book")
      expect(page).to have_content('issued')
    end

    it 'Go to add book page and add a book then issue it and check upadted issue status' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      expect(page).to have_content('Successfully Added book to database')
      click_link("Issue Book")
      expect(page).to have_content(book.title)
      fill_in "Name", with: student.name
      fill_in "Email", with: student.email
      fill_in "Issueddate", with: student.issuedDate
      fill_in "Returndate", with: student.returnDate
      click_button("Issue Book")
      expect(page).to have_content('issued')
      click_link("Show Details")
      expect(page).to have_content(student.name)
    end

    it 'Error on issueing a book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      expect(page).to have_content('Successfully Added book to database')
      click_link("Issue Book")
      expect(page).to have_content(book.title)
      fill_in "Name", with: student.name
      fill_in "Email", with: student.email
      click_button("Issue Book")
      expect(page).to have_content('Not issued')
    end

    it 'Return a book' do
      visit(add_book_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      expect(page).to have_content('Successfully Added book to database')
      click_link("Issue Book")
      expect(page).to have_content(book.title)
      fill_in "Name", with: student.name
      fill_in "Email", with: student.email
      fill_in "Issueddate", with: student.issuedDate
      fill_in "Returndate", with: student.returnDate
      click_button("Issue Book")
      expect(page).to have_content('issued')
      click_link("Show Details")
      expect(page).to have_content("Recieve Book")
      click_link("Recieve Book")
      expect(page).to have_content('Book Returned')

    end
  end
end