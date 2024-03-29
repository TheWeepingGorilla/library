require 'rspec'
require 'pg'
require 'pry'
require 'book'
require 'patron'
require 'author'
require 'books_authors'

ATTRIBUTES = {'title' => 'weird_book', 'name' => 'Clive Barker'}

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM copies *;")
    DB.exec("DELETE FROM books_authors *;")
  end
end

