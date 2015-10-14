require "rails_helper"

describe "Ideas API" do
  it "returns all ideas with last created first" do
    2.times do |i|
      Idea.create(
        title: "Title #{i+1}",
        body:  "Body #{i+1}"
      )
    end

    get "/api/v1/ideas"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json[0]["title"]).to eq("Title 2")
    expect(json[0]["body"]).to eq("Body 2")
    expect(json[0]["quality"]).to eq("swill")
    expect(json[1]["title"]).to eq("Title 1")
    expect(json[1]["body"]).to eq("Body 1")
    expect(json[1]["quality"]).to eq("swill")
  end
end
