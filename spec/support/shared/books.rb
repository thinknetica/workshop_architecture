# TODO: разнести по разным shared_context, чтобы не было дублирования ?
RSpec.shared_context 'сериализация книг на первой странице' do
  before { subject }

  it 'возвращает статус 200' do
    expect(response).to have_http_status(200)
  end

  it 'соответствует схеме ответа книг' do
    expect(response).to match_response_schema('books/index')
  end

  it 'возвращает 20 книг' do
    expect(json.size).to eq(Settings.app.items_per_page)
  end

  it 'возвращает первую книгу' do
    expect(json.first[:id]).to eq(books.first.id)
  end
end

RSpec.shared_context 'сериализация книг на второй странице' do
  before { subject }

  it 'возвращает статус 200' do
    expect(response).to have_http_status(200)
  end

  it 'соответствует схеме ответа книг' do
    expect(response).to match_response_schema('books/index')
  end

  it 'возвращает 20 книг' do
    expect(json.size).to eq(Settings.app.items_per_page)
  end

  it 'возвращает 21 книгу' do
    expect(json.first[:id]).to eq(books[20].id)
  end
end
