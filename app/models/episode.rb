class Episode < Film
  belongs_to :season, foreign_key: :parent_id

  validates_presence_of :number
  validates_uniqueness_of :number, scope: :parent_id
end