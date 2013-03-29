require 'spec_helper'

describe OutNote do

  context '#initialize' do
    it 'initializes with an a hash of attributes (to, from, subject, text) as an argument' do
      note = OutNote.new(:to => 'dorrit')
      note.should be_an_instance_of OutNote
    end
  end

  # context '#zenify!' do
  #   it 'picks a random quote from an array of quotes' do
  #     Kernel.stub(:rand).and_return(1)
  #     note = OutNote.new(:to => 'dorrit')
  #     note.text.should be_nil
  #     note.zenify!
  #     note.text.should eq 'simplicity'
  #   end
  # end

  context '#impart' do
    it 'POSTs the out_note to the server' do
      note = OutNote.new(:to => 'dorrit')
      # note.zenify!
      stub = stub_request(:post, "#{OUT_URL}/messages").
        with(:body => {:to => note.to, :from => note.from, :subject => note.subject, :text => note.text})
      note.impart
      stub.should have_been_requested
    end
  end

end