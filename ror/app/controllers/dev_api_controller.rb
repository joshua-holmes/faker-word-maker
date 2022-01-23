class DevApiController < ApplicationController
    def instructions
        render text: "Welcome!!
        /random_word/example will generate a random word between 3 and 9 (inclusive) characters long
        /random_word/example/7 will generate a random word 7 characters long
        /random_word/example/5 will generate a random word 5 characters long
        /random_word/example/0 will generate a random word that ends when letter combinations can no longer be found in the dictionary (not recommended)
        20 characters is the maximum acceptable word length"
    end

    def make_word
        lexicon = Lexicon.find_by(name: params[:name])
        word = lexicon.get_word
        render json: [word]
    end

    def make_word_with_length
        lexicon = Lexicon.find_by(name: params[:name])
        custom_length = params[:length].to_i
        if custom_length > 20
            return render text: "Length cannot be greater than 20 characters"
        end
        word = lexicon.get_word custom_length
        render json: [word]
    end
end
