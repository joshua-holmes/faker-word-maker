class LexiconsController < ApplicationController
    def index
        render json: Lexicon.all
    end

    def show
        lexicon = Lexicon.find params[:id]
        render json: lexicon, include: :favorite_words
    end

    def create
        name, words = params[:name], params[:words]
        if !words
            return render_words_invalid "'words' param was empty in body"
        elsif words.class != Array
            return render_words_invalid "'words' param must be an array of words"
        end
        lex = Lexicon.create!(name: name)
        words.each do |word|
            saved_word = Word.find_by(word: word.downcase) || Word.create!(word: word.downcase)
            LexiconWord.create!(lexicon_id: lex.id, word_id: saved_word.id)
        end
        render json: lex, status: :created
    end

    private

    def render_words_invalid(message)
        render json: { 
            error: message
        }, status: :unprocessable_entity
    end
end
