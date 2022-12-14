require 'rails_helper'

RSpec.describe Paper, type: :model do
    context "given many paper" do
        before :each do
            @paper = [
                {paper: Paper.new(title: 'a' , venue: 'b', year: 1), isValid: true},
                {paper: Paper.new(title: 'a' , venue: 'b'), isValid: false},
                {paper: Paper.new(title: 'a' , venue: '', year: 1), isValid: false},
                {paper: Paper.new(title: 'a' , venue: ''), isValid: false},
                {paper: Paper.new(title: '' , venue: 'b', year: 1), isValid: false},
                {paper: Paper.new(title: '' , venue: 'b'), isValid: false},
                {paper: Paper.new(title: '' , venue: '', year: 1), isValid: false},
                {paper: Paper.new(title: '' , venue: ''), isValid: false},
                {paper: Paper.new(title: 'a' , venue: 'b', year: 'a'), isValid: false}
            ]
        end

        it "should not validate if the last name is missing" do
            @paper.each do |paper_obj|
                expect(paper_obj[:paper].valid?).to eq(paper_obj[:isValid])
            end
        end
    end

    context "given a paper" do
        before :each do
            @paper = Paper.new(
                title: 'Test',
                venue: 'Content',
                year: 2022
            )
            @paper.save()
        end

        it "should have an empty list as authors" do
            expect(@paper.authors).to eq([])
        end
    end
end
