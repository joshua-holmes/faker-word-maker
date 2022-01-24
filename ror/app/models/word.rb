class Word < ApplicationRecord
    has_many :lexicon_words
    has_many :lexicons, through: :lexicon_words
    validates :word, presence: true, uniqueness: true
end
