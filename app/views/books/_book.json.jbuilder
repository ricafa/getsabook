json.extract! book, :id, :name, :author, :description, :available, :active, :created_at, :updated_at
json.url book_url(book, format: :json)