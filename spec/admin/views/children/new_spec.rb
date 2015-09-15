require 'spec_helper'
require_relative '../../../../apps/admin/views/children/new'

describe Admin::Views::Children::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/children/new.html.haml') }
  let(:view)      { Admin::Views::Children::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
