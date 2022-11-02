require 'rails_helper'

describe "index papers page", type: :feature do
    it "should exist at 'papers_path' and render withour error" do
        visit papers_path
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

        it "should have a link to the edit paper page" do
            visit papers_path
            expect(page).to have_xpath("//a[@href='#{edit_paper_path(@paper)}']")
        end
    end
end
