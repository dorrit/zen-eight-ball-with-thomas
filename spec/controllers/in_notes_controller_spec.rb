require 'spec_helper'

describe InNotesController do

  context 'routing' do
    it {should route(:post, '/in_notes').to :action => :create}
  end

  context 'POST create' do
    it 'initializes a new instance of InNote' do
      # stub = stub_request(:post, "#{LOCAL_URL}/out_notes").with(:body => {:to => 'dorrit@zengun.org'})
      in_note = double
      InNote.stub(:new).and_return(in_note)
      in_note.should_receive(:respond)
      params = {'from' => 'dorrit@zengun.org', 'body-plain' => 'send me something wise', 'sender' => "Thomas Hopkins <hopkins.tc@gmail.com>", 'subject' => 'are you serious?'}
      post :create, params
    end

    # it 'POSTs the in_note parameters to out_notes' do
    #   stub = stub_request(:post, "#{LOCAL_URL}/out_notes").with(:body => {:to => 'dorrit@zengun.org'})
    #   params = {'from' => 'dorrit@zengun.org', 'body-plain' => 'send me something wise', 'sender' => "Thomas Hopkins <hopkins.tc@gmail.com>", 'subject' => 'are you serious?'}
    #   post :create, params
    #   stub.should have_been_requested
    # end
  end

end