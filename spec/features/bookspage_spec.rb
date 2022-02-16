require 'rails_helper'

RSpec.feature "See books", type: :feature do
  context 'features test for books page' do
    let(:book) { build(:book) }
    it 'visit books page and find add book link' do
      visit(seeBooks_path)
      expect(page).to have_link('Add new Book')
      click_link('Add new Book')
      expect(current_path).to eq(addBook_path)
    end

    it 'Go to add book page' do
      visit(seeBooks_path)
      click_link('Add new Book')
      expect(current_path).to eq(addBook_path)
    end

    it 'Go to add book page and add a book' do
      visit(addBook_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      expect(page).to have_content('Successfully Added book to database')
    end

    it 'Error on adding a book' do
      visit(addBook_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume

      click_button("Add Book")
      expect(page).to have_content('Something went worng')
    end

    it 'After adding a book Try to issue that book' do
      visit(addBook_path)
      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Volume", with: book.volume
      fill_in "Published in", with: book.published_in

      click_button("Add Book")
      click_link("Issue Book")
      expect(page).to have_content(book.title)
    end

    it 'After adding a book Try to show details of that book' do
      visit(addBook_path)
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