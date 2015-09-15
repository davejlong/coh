require 'spec_helper'
require_relative '../../../../apps/admin/controllers/children/new'

describe Admin::Controllers::Children::New do
  let(:action) { Admin::Controllers::Children::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
