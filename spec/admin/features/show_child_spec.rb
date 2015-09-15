require "features_helper"

describe "Show child" do
  context "with existing child" do
    let(:child) { ChildRepository.create Child.new(name: "Joshua") }

    it "shows the child's information" do
      visit "/admin/children/#{child.id}"
      expect(page.status_code).to eql 200
      expect(page).to have_content child.name
    end
  end

  # context "without existing child" do
  #   it "redirects to the child list" do
  #     visit "/admin/children/99999"
  #     expect(page.status_code).to eql 302
  #     expect(page).to have_content "Child not found."
  #   end
  # end
end
