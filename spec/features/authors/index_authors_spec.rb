require 'rails_helper'

describe "author index page", type: :feature do
    it "should exist at 'authors_path' and render withour errors" do
        visit authors_path
    end

    it "should have a table with the headers 'Name' and 'Homepage'" do
        visit authors_path
        expect(page).to have_xpath('//table//th[text()="Name"]')
        expect(page).to have_xpath('//table//th[text()="Homepage"]')
    end

    it "should have a button to create a new author" do
        visit authors_path
        expect(page).to have_link 'New', href: new_author_path
    end

    context "given an author" do

        before :each do
            @author = Author.new(
                first_name: 'Alan',
                last_name: 'Turing',
                homepage: 'http://wikipedia.org/Alan_Turing'
            )
            @author.save()
        end

        it "should show authors" do
            visit authors_path
            expect(page).to have_xpath("//table//td//a[contains(@href, '#{author_path(@author)}') and text()='#{@author.first_name + " " + @author.last_name}']")
            expect(page).to have_xpath("//table//td//a[contains(@href, '#{@author.homepage}') and text()='#{@author.homepage}']")
        end

        it "should show a link to edit the authors" do
            visit authors_path
            expect(page).to have_xpath("//table//td//a[contains(@href, '#{edit_author_path(@author)}') and text()='Edit']")
        end

        it "should show a link to delete the authors" do
            visit authors_path
            expect{
                find(:xpath, "//table//td//a[contains(@href, '#{author_path(@author)}') and text()='Delete']").click
            }.to change(Author, :count).by(-1)
        end
    end
end
