class FilmSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true
  attributes :title
end
