require "rails_helper"

RSpec.feature "Idea searching", type: :feature do
  before do
    visit root_path

    fill_in("title", with: "Title one")
    fill_in("body", with: "A bird in the hand is worth two in the bush.")
    click_button("Save")
    fill_in("title", with: "Title two")
    fill_in("body", with: "To be, or not to be; that is the question.")
    click_button("Save")
    fill_in("title", with: "Another one")
    fill_in("body", with: "bites the dust")
    click_button("Save")
  end

  xscenario "User enters search term that matches two titles",
           js: true do
    fill_in("search", with: "one")
    wait_for_ajax

    expect(page).to_not have_content("Title two")
    expect(page).to_not have_content("To be, or not to be; that is the question.")
    expect(page).to have_content("Title one")
    expect(page).to have_content("A bird in the hand is worth two in the bush.")
    expect(page).to have_content("Another one")
    expect(page).to have_content("bites the dust")
  end
end
