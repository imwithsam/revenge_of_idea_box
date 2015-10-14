require "rails_helper"

RSpec.feature "Ideas rendering", type: :feature do
  scenario "User visits the root path", js: true do
    Idea.create(title: "Title 1",
                body:  "Body 1")

    visit root_path

    expect(page).to have_content("Title 1")
    expect(page).to have_content("Body 1")
    expect(page).to have_content("swill")
  end
end
