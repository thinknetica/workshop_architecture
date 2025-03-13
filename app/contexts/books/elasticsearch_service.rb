class Books::ElasticsearchService
  DEFAULT_PAGE = 1
  DEFAULT_PER_PAGE = 25
  MAX_PER_PAGE = 100

  def initialize(params)
    @params = params
    @client = Elasticsearch::Model.client
  end

  def call
    validate_params!
    search_response = perform_search
    format_response(search_response)
  end

  private

  def validate_params!
    if @params[:per_page].to_i > MAX_PER_PAGE
      raise ArgumentError, "per_page cannot exceed #{MAX_PER_PAGE}"
    end
  end

  def perform_search
    @client.search(
      index: 'books',
      body: search_query
    )
  end

  def search_query
    {
      query: build_query,
      sort: build_sort,
      from: offset,
      size: per_page
    }
  end

  def build_query
    return { match_all: {} } if @params[:query].blank?

    {
      multi_match: {
        query: @params[:query],
        fields: ['title^3', 'author^2', 'description'],
        fuzziness: 'AUTO'
      }
    }
  end

  def build_sort
    return [] unless @params[:sort]

    [{ @params[:sort] => { order: @params[:order] || 'asc' } }]
  end

  def page
    @params[:page].to_i.positive? ? @params[:page].to_i : DEFAULT_PAGE
  end

  def per_page
    @params[:per_page].to_i.positive? ? @params[:per_page].to_i : DEFAULT_PER_PAGE
  end

  def offset
    (page - 1) * per_page
  end

  def format_response(response)
    {
      books: format_hits(response['hits']['hits']),
      meta: {
        total: response['hits']['total']['value'],
        page: page,
        per_page: per_page
      }
    }
  end

  def format_hits(hits)
    hits.map { |hit| hit['_source'].merge(id: hit['_id']) }
  end
end
