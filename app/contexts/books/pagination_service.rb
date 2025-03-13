class Books::PaginationService
  DEFAULT_PER_PAGE = 10
  MAX_PER_PAGE = 100

  def initialize(params, settings = Settings.app)
    @page = params[:page]&.to_i || 1
    @per_page = [params[:per_page]&.to_i || settings.items_per_page || DEFAULT_PER_PAGE, MAX_PER_PAGE].min
  end

  def call
    {
      books: Book.page(page).per(per_page),
      meta: {
        page: page,
        per_page: per_page
      }
    }
  end

  private

  attr_reader :page, :per_page
end
