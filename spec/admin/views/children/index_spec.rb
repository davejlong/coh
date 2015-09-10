require 'spec_helper'
require_relative '../../../../apps/admin/views/children/index'

describe Admin::Views::Children::Index do
  let(:exposures) { Hash[children: []] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/children/index.html.haml') }
  let(:view)      { Admin::Views::Children::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #children" do
    expect(view.children).to eql exposures.fetch(:children)
  end

  context "when there are no children" do
    it "shows a placeholder message" do
      expect(rendered).to include "There are no children available."
    end
  end

  context "when there are children" do
    let(:child1) { Child.new name: "Joshua Kisakye" }
    let(:child2) { Child.new name: "Confiance Umurungezi" }
    let(:exposures) { Hash[children: [child1, child2]] }

    it "lists them all" do
      expect(rendered.scan(/class=["']child['"]/).count).to eql 2
      expect(rendered).to include child1.name
      expect(rendered).to include child2.name
    end

    it "hides the placeholder message" do
      expect(rendered).not_to include "There are no children available."
    end
  end
end
