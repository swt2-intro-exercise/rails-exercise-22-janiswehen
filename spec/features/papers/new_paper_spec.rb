require 'rails_helper'

describe "New paper page", type: :feature do
  it "should exist at 'new_paper_path' and render withour error" do
    visit new_paper_path
  end
end
