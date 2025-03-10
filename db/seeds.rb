if (File.exist? Settings.app.sql_dump_path)
  Seeds::SqlDumpLoad.call(filename: Settings.app.sql_dump_path)
  Authors::CounterCache.call
  Genres::CounterCache.call
  Keywords::CounterCache.call
else
  Book.destroy_all
  Seeds::GenreLoad.call(filename: 'db/seeds/genres.yml')
  Seeds::LanguageLoad.call(filename: 'db/seeds/languages.yml')
end

AdminUser.create_with(password: ENV['SEED_PASSWORD']).find_or_create_by(email: ENV['SEED_EMAIL'])
