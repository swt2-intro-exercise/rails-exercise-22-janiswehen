require 'rails_helper'

describe "show paper page", type: :feature do
    context "given a paper with one auther" do
        before :each do
            @auther = Author.new(
                first_name: 'Alan',
                last_name: 'Turing'
            )
            @auther.save()
            @paper = Paper.new(
                title: 'Important stuff abount Turing Mashines',
                venue: 'Content',
                year: 2022,
                authors: [@auther]
            )
            @paper.save
        end

        it "should exist a paper_path and render withour error" do
            visit paper_path(@paper)
        end

        it "should show the authors of the paper" do
            visit paper_path(@paper)
            expect(page).to have_text(@auther.name)
        end
    end
end
