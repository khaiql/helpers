require 'test_helper'

describe Lotus::Helpers::RoutingHelper do
  before do
    @template = Lotus::View::Template.new('test/fixtures/templates/full_stack/dashboard/index.html.erb')
  end

  describe 'when routing constant is defined' do
    before do
      @view = FullStack::Views::Dashboard::Index.new(@template, {})
    end

    it 'has access to routing helper' do
      @view.routing_helper_path.must_equal %(/dashboard)
    end
  end

  describe 'when routing constant is not defined' do
    before do
      @view = ViewWithoutRoutingHelper.new(@template, {})
    end

    it 'raises an exception when trying to access routing helper' do
      -> { @view.routing_helper_path }.must_raise NameError
    end
  end
end
