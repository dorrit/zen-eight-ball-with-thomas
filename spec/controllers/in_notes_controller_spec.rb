require 'spec_helper'

describe InNotesController do

  context 'routing' do
    it {should route(:post, '/in_notes').to :action => :create}
  end

  context 'POST create' do
    it 'initializes a new instance of InNote'
      # before {post :create, params}
  end
end