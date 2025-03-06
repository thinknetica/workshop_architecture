class BookResource
  include Alba::Resource

  attributes :id, :title

  many :authors, resource: AuthorResource
  one :language, resource: LanguageResource
end
