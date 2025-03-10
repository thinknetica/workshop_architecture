module ResponseHelpers
  def json
    Oj.load(response.body, symbol_keys: true, mode: :compat)
  end
end
