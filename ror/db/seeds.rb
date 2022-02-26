require "json"
parsed_words = JSON.parse File.read("./python/words.json")

puts "🌱 Destroying seeds..."

FavoriteWord.destroy_all
LexiconWord.destroy_all
Lexicon.destroy_all
Word.destroy_all


puts "Creating new seeds..."
def create_lexicon name, words
    lex = Lexicon.create(name: name)
    words.each do |word|
        if Word.find_by(word: word)
            saved_word = Word.find_by(word: word)
        else
            saved_word = Word.create(word: word)
        end
        LexiconWord.create(lexicon_id: lex.id, word_id: saved_word.id)
    end
end
def favorite_word fake_word, lexiconName
    lexicon = Lexicon.find_by(name: lexiconName)
    FavoriteWord.create(word: fake_word, lexicon_id: lexicon.id)
end

create_lexicon "example", parsed_words

puts "✅ Done seeding!"
