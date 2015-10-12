require "rails_helper"

describe "Ideas API" do
  it "returns all ideas" do
    2.times do |i|
      Idea.create(
        title: "Title #{i+1}",
        body:  "Body #{i+1}"
      )
    end

    get "/api/v1/ideas"

    json = JSON.parse(response.body)

    expect(response).to be_success

    json.each_with_index do |idea, i|
      expect(idea["title"]).to eq("Title #{i+1}")
      expect(idea["body"]).to eq("Body #{i+1}")
    end
  end
end
