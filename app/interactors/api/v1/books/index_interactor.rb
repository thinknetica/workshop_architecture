module Api
  module V1
    module Books
      class IndexInteractor < ApplicationInteractor
        def initialize(page:)
          @page = Integer(page, exception: false) || 1
        end

        def call
          Book.includes(:authors).order(created_at: :asc).offset(offset).limit(per_page)
        end

        private

        def offset
          per_page * (@page - 1)
        end

        def per_page
          Settings.app.items_per_page
        end
      end
    end
  end
end
