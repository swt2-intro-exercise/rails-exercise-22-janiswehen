require 'rails_helper'

describe "edit author page", type: :feature do
    before :each do
        @author = Author.new(
            first_name: 'Alan',
            last_name: 'Turing',
            homepage: 'http://wikipedia.org/Alan_Turing'
        )
        @author.save()
    end

    it "should exist at 'edit_author_path' for @author and render withour error" do
        visit edit_author_path(@author)
    end

    it "should have inputs for an authors first_name, last_name and homepage" do
        visit edit_author_path(@author)
        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

    it "should edit an Author in the Database wehen the Form ist submitted" do
        visit edit_author_path(@author)
        fill_in 'author[first_name]',	with: "new_Alan"
        fill_in 'author[last_name]',	with: "new_Turing"
        fill_in 'author[homepage]',	with: "new_http://wikipedia.org/Alan_Turing"
        expect{
            find('input[type="submit"]').click
        }.to change(Author, :count).by(0)
        @author.reload
        expect(@author.first_name).to eq("new_Alan")
        expect(@author.last_name).to eq("new_Turing")
        expect(@author.homepage).to eq("new_http://wikipedia.org/Alan_Turing")
    end

    it "should have a link back to its author page" do
        visit edit_author_path(@author)
        expect(page).to have_link 'Back', href: authors_path
    end

    it "should render an error message when submitting an invalid author" do
        visit edit_author_path(@author)
        fill_in 'author[last_name]',	with: "Alan"
        fill_in 'author[last_name]',	with: ""
        fill_in 'author[homepage]',	with: "http://wikipedia.org/Alan_Turing"
        find('input[type="submit"]').click
        expect(page).to have_xpath("//div[@id='error_explanation']//li[contains(text(), 'Last name can') and contains(text(), 't be blank')]")
        expect(page).to have_xpath("//div[@id='error_explanation']//li[contains(text(), 'Last name is too short (minimum is 1 character)')]")
    end
end
