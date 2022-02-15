require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'vaidating book data' do
    let(:book) {build(:book)}

    it 'validates book title' do
      book.title = nil
      expect(book.save).to eq(false)
    end

    it 'validates book author is present' do
      book.author = nil
      expect(book.save).to eq(false)
    end

    it 'validates books published year is present' do
      book.published_in = nil
      expect(book.save).to eq(false)
    end

    it 'validates book volume number is present' do
      book.volume = nil
      expect(book.save).to eq(false)
    end
  end
end
