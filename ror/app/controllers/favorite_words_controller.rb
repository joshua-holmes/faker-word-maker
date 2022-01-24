class FavoriteWordsController < ApplicationController
    def create
        if !params[:word]
            return render json: { error: "A 'word' param must be included in body" }, status: :unprocessable_entity
        end
        lexicon, word = Lexicon.find(params[:lexicon_id]), params[:word].downcase
        fave_word = FavoriteWord.create!(lexicon_id: lexicon.id, word: word)
        render json: fave_word, status: :created
    end

    def destroy
        favorite_word = FavoriteWord.find(params[:id])
        favorite_word.destroy
        render head: :no_content
    end
end
