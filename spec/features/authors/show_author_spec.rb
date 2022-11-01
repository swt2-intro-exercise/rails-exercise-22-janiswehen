require 'rails_helper'

describe "author show page", type: :feature do
  it "should display a Author Page for Alan Turing" do
    expect{
      @alan = Author.create(
        first_name: "Alan",
        last_name: "Turing",
        homepage: "http://wikipedia.org/Alan_Turing"
      )
    }.to change(Author, :count).by(1)
    visit author_path(@alan)
    expect(page).to have_text("First Name:")
    expect(page).to have_text("Alan")
    expect(page).to have_text("Last Name:")
    expect(page).to have_text("Turing")
    expect(page).to have_text("Homepage:")
    expect(page).to have_text("http://wikipedia.org/Alan_Turing")
  end
end
