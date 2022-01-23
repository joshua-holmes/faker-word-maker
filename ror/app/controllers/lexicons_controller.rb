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
        if !(name && words)
            return render json: { 
                message: "Either 'name' or 'words' param was empty in body" 
            }, status: :unprocessable_entity
        elsif Lexicon.find_by(name: name)
            return render json: { 
                message: "The name '#{name}' is already in use and is invalid." 
            }, status: :unprocessable_entity
        end
        lex = Lexicon.create!(name: name)
        words.each do |word|
            saved_word = Word.find_by(word: word.downcase) || Word.create!(word: word.downcase)
            LexiconWord.create!(lexicon_id: lex.id, word_id: saved_word.id)
        end
        render json: lex, status: :created
    end 
end
