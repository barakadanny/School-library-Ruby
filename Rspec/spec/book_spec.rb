require_relative '../../book'
require 'rspec/autorun' 
describe Book do
  context 'When testing Book class' do
    it 'Should create a book' do
        book = Book.new('Java', 'danny')
        expect(book.title).to eq('Java')
        expect(book.author).to eq('danny')
    end
  end
end
