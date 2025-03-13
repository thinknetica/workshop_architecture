namespace :migrate do
  desc "Migrate books from PostgreSQL to MongoDB"
  task books_to_mongo: :environment do
    # Подключение к PostgreSQL
    pg_connection = ActiveRecord::Base.connection

    # Получаем все книги из PostgreSQL
    books = pg_connection.execute("SELECT * FROM books")

    books.in_batches do |book|
      # Создаем книгу в MongoDB
      mongo_book = Documents::Book.new(
        id: book['id'],
        created_at: book['created_at'],
        updated_at: book['updated_at'],
        title: book['title'],
        series: book['series'],
        serno: book['serno'],
        libid: book['libid'],
        size: book['size'],
        filename: book['filename'],
        del: book['del'],
        ext: book['ext'],
        published_at: book['published_at'],
        insno: book['insno'],
        folder_id: book['folder_id'],
        language_id: book['language_id']
      )

      # Сохраняем книгу в MongoDB
      unless mongo_book.save
        puts "Failed to migrate book '#{book['title']}' (ID: #{book['id']}): #{mongo_book.errors.full_messages.join(', ')}"
      end
    end

    puts "Migration completed!"
  end
end
