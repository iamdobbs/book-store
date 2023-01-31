require 'book_repository'

RSpec.describe BookRepository do

  def reset_books_table
    seed_sql = File.read('spec/book_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

  describe BookRepository do
    before(:each) do 
      reset_books_table
    end

    it 'will return a list of entries' do

      repo = BookRepository.new
      books = repo.all

      expect(books.first.id).to eq('1')
      expect(books.first.title).to eq('Romeo and Juliet')
      expect(books.first.author_name).to eq('William Shakespeare')
    end  
  end  
end