require 'spec_helper'

describe OutNote do

  context '#initialize' do
    it 'initializes with an a hash of attributes (to, from, subject, text) as an argument' do
      note = OutNote.new(:to => 'dorrit')
      note.should be_an_instance_of OutNote
    end
  end

  context '#impart' do
    it 'POSTs the out_note to the server' do
      note = OutNote.new(:to => 'dorrit')
      stub = stub_request(:post, "#{MAILGUN_URL}/messages")
        # with(:body => {:to => 'dorrit', :from => ZEN_GUN_EMAIL, :subject => CONTEMPLATION, :text => note.text})
      note.impart
      stub.should have_been_requested
    end
  end

end