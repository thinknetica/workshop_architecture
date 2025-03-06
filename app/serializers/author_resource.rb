class AuthorResource
  include Alba::Resource

  attribute :name do |author|
    [ author.last_name, author.first_name, author.middle_name ].compact.join(' ')
  end
end
