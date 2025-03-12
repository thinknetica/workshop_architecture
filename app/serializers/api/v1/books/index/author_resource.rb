module Api
  module V1
    module Books
      module Index
        class AuthorResource
          include Alba::Resource

          attributes :id, :first_name, :middle_name, :last_name
        end
      end
    end
  end
end
