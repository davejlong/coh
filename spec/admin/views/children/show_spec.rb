require 'spec_helper'
require_relative '../../../../apps/admin/views/children/show'

describe Admin::Views::Children::Show do
  let(:exposures) { Hash[child: {}] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/children/show.html.haml') }
  let(:view)      { Admin::Views::Children::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #child" do
    expect(view.child).to eq exposures.fetch(:child)
  end

  context "when there is no child" do

  end
end
