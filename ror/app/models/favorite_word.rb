class FavoriteWord < ApplicationRecord
  belongs_to :lexicon
  validates :word, presence: true, uniqueness: true
end
