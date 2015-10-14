require "rails_helper"

RSpec.feature "Ideas creation", type: :feature do
  scenario "User creates a new idea", js: true do
    visit root_path

    fill_in("title", with: "Title 1")
    fill_in("body", with: "Body 1")
    click_button("Save")

    expect(page).to have_content("Title 1")
    expect(page).to have_content("Body 1")
    expect(page).to have_content("swill")
  end
end
