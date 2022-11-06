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

        it "should have a link to delete a paper" do
            visit papers_path
            expect(page).to have_xpath("//a[@data-turbo-method='delete' and @href='#{paper_path(@paper)}']")
        end
    end

    context "given a paper from 1959 and a Paper from 1968" do
        before :each do
            @paper1 = Paper.new(
                title: 'Paper1',
                venue: 'Content',
                year: 1950
            )
            @paper1.save
            @paper2 = Paper.new(
                title: 'Paper2',
                venue: 'Content',
                year: 1968
            )
            @paper2.save
        end

        it "schould only show the paper1 when given a filter year=1950 via the url" do
            visit papers_path + "?year=1950"
            expect(page).to have_xpath("//a[@href='#{paper_path(@paper1)}']")
            expect(page).not_to have_xpath("//a[@href='#{paper_path(@paper2)}']")
        end
    end
end
