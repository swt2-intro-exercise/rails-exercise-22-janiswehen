require 'rails_helper'

describe "New author page", type: :feature do
  it "should render an error message when submitting an invalid author" do
    visit new_author_path
    fill_in 'author[first_name]',	with: "Alan"
    fill_in 'author[homepage]',	with: "http://wikipedia.org/Alan_Turing"
    find('input[type="submit"]').click
    expect(page).to have_xpath("//div[@id='error_explanation']//li[contains(text(), 'Last name can') and contains(text(), 't be blank')]")
    expect(page).to have_xpath("//div[@id='error_explanation']//li[contains(text(), 'Last name is too short (minimum is 1 character)')]")
  end
end
