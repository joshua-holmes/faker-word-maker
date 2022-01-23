class FavoriteWordsController < ApplicationController
    def create
        lexicon, word = Lexicon.find(params[:lexicon_id]), params[:word].downcase
        if !word
            return render json: { message: "A 'word' param must be included in body" }
        elsif lexicon.favorite_words.find_by(word: word)
            return render json: { message: "'#{word}' is already a favorite in lexicon '#{lexicon.name}'" }
        end
        fave_word = FavoriteWord.create!(lexicon_id: lexicon.id, word: word)
        render json: fave_word, status: :created
    end

    def destroy
        lexicon = Lexicon.find(params[:lexicon_id])
        favorite_word = lexicon.favorite_words.find(params[:favorite_word_id])
        favorite_word.destroy
        render json: favorite_word
    end
end
