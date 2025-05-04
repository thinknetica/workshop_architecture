module Api
  module V1
    module Books
      module Index
        class BookResource
          include Alba::Resource

          attributes :id, :title, :series, :serno

          many :authors, resource: AuthorResource
        end
      end
    end
  end
end
