class Season < Film
  has_many :episodes, foreign_key: :parent_id, dependent: :destroy
  has_many :contents, foreign_key: :film_id , dependent: :destroy
end