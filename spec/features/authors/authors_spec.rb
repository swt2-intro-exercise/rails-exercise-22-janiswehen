require 'rails_helper'

describe "author index page", type: :feature do
    it "should exist at 'author_path' and render withour errors" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
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

    it "should show authors" do
        first_name = "Alan"
        last_name = "Turing"
        homepage = "http://wikipedia.org/Alan_Turing"
        expect{
            @alan = Author.create(
                first_name: first_name,
                last_name: last_name,
                homepage: homepage
            )
        }.to change(Author, :count).by(1)
        visit authors_path
        expect(page).to have_xpath("//table//td//a[contains(@href, '#{author_path(@alan)}') and text()='#{first_name + " " + last_name}']")
        expect(page).to have_xpath("//table//td//a[contains(@href, '#{homepage}') and text()='#{homepage}']")
    end
end
