class Movie < Film
  has_many :contents, foreign_key: :film_id , dependent: :destroy
end