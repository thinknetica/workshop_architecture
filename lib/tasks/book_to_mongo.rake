namespace :book_to_mongo do
  desc 'Копируем из постгреса в монко Books'
  task run: :environment do
    ::Book.all.find_each do |book|
      ::Mongo::Book.create(BookSerializer.new(book).to_h)
    end
  end
end
