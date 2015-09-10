require "features_helper"

describe "List children" do
  before do
    ChildRepository.create Child.new(name: "Joshua Kisakye")
    ChildRepository.create Child.new(name: "Confiance Umurungezi")
  end

  it "shows a child element for each child" do
    visit "/admin/children"
    expect(page).to have_css ".child", count: 2
  end
end
