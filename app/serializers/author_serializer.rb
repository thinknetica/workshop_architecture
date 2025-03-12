class AuthorSerializer
  include Alba::Resource

  attributes :id, :full_name

  private

  def full_name(author)
    author.slice(:first_name, :middle_name, :last_name).values.join(' ')
  end
end
