class ApplicationSerializer
  include Alba::Serializer

  def self.one(name, **options)
    options[:resource] ||= proc { "#{_1.class.name}Serializer".constantize }
  end
end
