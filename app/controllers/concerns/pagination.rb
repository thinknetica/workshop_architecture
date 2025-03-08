module Pagination
  extend ActiveSupport::Concern
  include Pagy::Backend

  def paginate_json(scope:, key:, serializer:)
    pagy, records = pagy(scope)

    {
      key => serializer.new(records),
      pagination: {
        page: pagy.page,
        per_page: pagy.limit,
        page_count: pagy.pages,
        total: pagy.count
      }
    }
  end
end
