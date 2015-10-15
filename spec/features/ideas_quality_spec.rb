require "rails_helper"

RSpec.feature "Ideas quality", type: :feature, js: true do
  before do
    visit root_path

    fill_in("title", with: "Title 1")
    fill_in("body", with: "Body 1")
    click_button("Save")
  end

  scenario "User likes an existing idea", js: true do
    click_link("Like")
    wait_for_ajax

    expect(page).to_not have_content("swill")
    expect(page).to_not have_content("genius")
    expect(page).to have_content("plausible")
  end

  scenario "User likes an existing idea twice", js: true do
    click_link("Like")
    wait_for_ajax
    click_link("Like")
    wait_for_ajax

    expect(page).to_not have_content("swill")
    expect(page).to_not have_content("plausible")
    expect(page).to have_content("genius")
  end

  scenario "User likes an existing idea thrice", js: true do
    click_link("Like")
    wait_for_ajax
    click_link("Like")
    wait_for_ajax
    click_link("Like")
    wait_for_ajax

    expect(page).to_not have_content("swill")
    expect(page).to_not have_content("plausible")
    expect(page).to have_content("genius")
  end

  scenario "User dislikes a genius idea", js: true do
    click_link("Like")
    wait_for_ajax
    click_link("Like")
    wait_for_ajax
    click_link("Dislike")
    wait_for_ajax

    expect(page).to_not have_content("swill")
    expect(page).to_not have_content("genius")
    expect(page).to have_content("plausible")
  end

  scenario "User dislikes a genius idea twice", js: true do
    click_link("Like")
    wait_for_ajax
    click_link("Like")
    wait_for_ajax
    click_link("Dislike")
    wait_for_ajax
    click_link("Dislike")
    wait_for_ajax

    expect(page).to_not have_content("plausible")
    expect(page).to_not have_content("genius")
    expect(page).to have_content("swill")
  end

  scenario "User dislikes a genius idea thrice", js: true do
    click_link("Like")
    wait_for_ajax
    click_link("Like")
    wait_for_ajax
    click_link("Dislike")
    wait_for_ajax
    click_link("Dislike")
    wait_for_ajax
    click_link("Dislike")
    wait_for_ajax

    expect(page).to_not have_content("plausible")
    expect(page).to_not have_content("genius")
    expect(page).to have_content("swill")
  end
end
