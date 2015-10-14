require "rails_helper"

RSpec.feature "Ideas quality", type: :feature do
  before do
    visit root_path

    fill_in("title", with: "Title 1")
    fill_in("body", with: "Body 1")
    click_button("Save")
  end

  scenario "User likes an existing idea", js: true do
    click_link("Like")

    expect(page).to_not have_content("swill")
    expect(page).to_not have_content("genius")
    expect(page).to have_content("plausible")
  end

  scenario "User likes an existing idea twice", js: true do
    click_link("Like")
    click_link("Like")

    expect(page).to_not have_content("swill")
    expect(page).to_not have_content("plausible")
    expect(page).to have_content("genius")
  end
end
