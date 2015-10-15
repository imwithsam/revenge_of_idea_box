require "rails_helper"

RSpec.feature "Idea editing", type: :feature do
  scenario "User edits an existing idea", js: true do
    visit root_path

    fill_in("title", with: "Title 1")
    fill_in("body", with: "Body 1")
    click_button("Save")
    click_link("Edit")

    fill_in("title", with: "New Title")
    fill_in("body", with: "New Body")
    click_button("Update")

    exepct(page).to_not have_content("Title 1")
    expect(page).to_not have_content("Body 1")
    exepct(page).to have_content("New Title")
    expect(page).to have_content("New Body")
  end
end
