require 'spec_helper'
require_relative '../../../../apps/admin/controllers/children/show'

describe Admin::Controllers::Children::Show do
  let(:action) { Admin::Controllers::Children::Show.new }
  let(:params) { Hash[] }

  let(:child) { ChildRepository.create Child.new(name: "Joshua Kisakye") }

  context "with child id" do
    let(:params) { Hash[id: child.id] }

    it "exposes a specific child" do
      action.call params
      expect(action.exposures[:child].id).to eql child.id
    end
  end

  context "without child id" do
    it "redirects back to list" do
      page = action.call params
      expect(page[0]).to eql 302
      expect(page[1]["Location"]).to match(/children$/)
    end
  end
end
