require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have inputs for an authors first_name, last_name and homepage" do
    visit new_author_path
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should save an Author in the Database wehen the Form ist submitted" do
    visit new_author_path
    fill_in 'author[first_name]',	with: "Alan"
    fill_in 'author[last_name]',	with: "Turing"
    fill_in 'author[homepage]',	with: "http://wikipedia.org/Alan_Turing"
    expect{
      find('input[type="submit"]').click
    }.to change(Author, :count).by(1)
  end

  it "should have a link to the author index" do
    visit new_author_path
    expect(page).to have_link 'Back', href: "/author"
  end
end
