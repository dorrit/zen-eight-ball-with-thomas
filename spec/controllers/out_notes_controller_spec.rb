
require 'spec_helper'

describe OutNotesController do
  
  context 'routing' do
    it {should route(:post, '/out_notes').to :action => :create}
  end

  context 'POST create' do
    Kernel.stub(:rand).and_return(1)
    stub = stub_request(:post, "#{OUT_URL}/messages").
      with(:body => {:to => note.to, :from => ZEN_GUN_EMAIL, :subject => CONTEMPLATION, :text => "The Tao is the way."})

    stub = stub_request(:post, )

    # context 'with valid parameters' do
    #   let(:valid_attributes) {{:to => 'dorrit'}}
    #   let(:valid_parameters) {{:out_note => valid_attributes}}


    #   before {post :create}
    #   it {should respond_with 200}
    # end
  end

end
