require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

DatabaseConnection.connect('book_store_test')

sql = 'SELECT id, title, author_name FROM books;'
result = DatabaseConnection.exec_params('SELECT * FROM books;', [])

book_repository = BookRepository.new

book_repository.all.each do |book|
  p book
end  