require 'rails_helper'

RSpec.describe Author, type: :model do
    before :each do
        @authors = [
            {author: Author.new(first_name: 'Alan', last_name: 'Turing',homepage: 'http://wikipedia.org/Alan_Turing'), isValid: true},
            {author: Author.new(first_name: 'Alan', last_name: 'Turing',homepage: ''), isValid: true},
            {author: Author.new(first_name: 'Alan', last_name: '',homepage: 'http://wikipedia.org/Alan_Turing'), isValid: false},
            {author: Author.new(first_name: 'Alan', last_name: '',homepage: ''), isValid: false},
            {author: Author.new(first_name: '', last_name: 'Turing',homepage: 'http://wikipedia.org/Alan_Turing'), isValid: true},
            {author: Author.new(first_name: '', last_name: 'Turing',homepage: ''), isValid: true},
            {author: Author.new(first_name: '', last_name: '',homepage: 'http://wikipedia.org/Alan_Turing'), isValid: false},
            {author: Author.new(first_name: '', last_name: '',homepage: ''), isValid: false}
        ]
    end

    it "should not validate if the last name is missing" do
        @authors.each do |author_obj|
            expect(author_obj[:author].valid?).to eq(author_obj[:isValid])
        end
    end
end
