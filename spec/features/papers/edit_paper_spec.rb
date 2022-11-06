require 'rails_helper'

describe "edit paper page", type: :feature do
    

    context "given a paper and an author" do
        before :each do
            @paper = Paper.new(
                title: 'Test',
                venue: 'Content',
                year: 2022
            )
            @paper.save 
            @author = Author.new(
                first_name: "Janis",
                last_name: "Wehen",
                homepage: "google.com"
            )
            @author.save
        end

        it "should exist at edit_paper_path and render withour error" do
            visit edit_paper_path(@paper)
        end

        it "should have multiple select box for the authors" do
            visit edit_paper_path(@paper)
            expect(page).to have_xpath("//select//option[text()='#{@author.name}' and @value=#{@author.id}]")
        end
    end
end
