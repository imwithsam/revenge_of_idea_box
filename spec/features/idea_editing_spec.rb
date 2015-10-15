require "rails_helper"

RSpec.feature "Idea editing", type: :feature do
  before do
    visit root_path

    fill_in("title", with: "Title 1")
    fill_in("body", with: "Body 1")
    click_button("Save")
    click_link("Edit")
  end

  scenario "User edits an existing idea", js: true do
    fill_in("Title", with: "New Title")
    fill_in("Body", with: "New Body")
    click_button("Update")

    expect(page).to_not have_content("Title 1")
    expect(page).to_not have_content("Body 1")
    expect(page).to have_content("New Title")
    expect(page).to have_content("New Body")
  end

  scenario "User cancels an edit", js: true do
    fill_in("Title", with: "New Title")
    fill_in("Body", with: "New Body")
    click_link("Cancel")

    expect(page).to_not have_content("New Title")
    expect(page).to_not have_content("New Body")
    expect(page).to have_content("Title 1")
    expect(page).to have_content("Body 1")
  end
end
