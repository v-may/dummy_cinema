class Season < Film
  has_many :episodes, foreign_key: :parent_id, dependent: :destroy
end