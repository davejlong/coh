require 'spec_helper'
require_relative '../../../../apps/admin/controllers/children/index'

describe Admin::Controllers::Children::Index do
  let(:action) { Admin::Controllers::Children::Index.new }
  let(:params) { Hash[error: 404] }

  let!(:child) { ChildRepository.create Child.new(name: "Joshua Kisakye") }
  
  it "exposes all children" do
    action.call params
    expect(action.exposures[:children].map(&:id)).to eql [child.id]
  end

  it "exposes any errors it receives" do
    action.call params
    expect(action.exposures[:error]).to eql 404
  end
end
