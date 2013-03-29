require 'spec_helper'

describe InNote do
  let(:response) {{ "sender"=>"hopkins.tc@gmail.com",
                    "subject"=>"Zen Words", 
                    "from"=>"Thomas Hopkins <hopkins.tc@gmail.com>", 
                    "body-plain"=>"you are enlightened!"}}

  context '#initialize' do
    it 'initializes an new instance of In Note with a hash as an argument' do 
      note = InNote.new(response)
      note.should be_an_instance_of InNote
    end

    it 'initializes an instance of In Note and returns who it is from' do
      note = InNote.new(response)
      note.from.should eq "Thomas Hopkins <hopkins.tc@gmail.com>"
    end

    it 'initializes an instance of In Note and returns the message body text' do
      note = InNote.new(response)
      note.text.should eq "you are enlightened!"
    end

    it 'initializes an instance of In Note and returns the sender' do
      note = InNote.new(response)
      note.sender.should eq "hopkins.tc@gmail.com"
    end

    it 'initializes an instance of In Note and returns the subject' do
      note = InNote.new(response)
      note.subject.should eq "Zen Words"
    end

  end

  context '#respond' do
    it 'creates an instance of out_note and imparts it' do
      stub = stub_request(:post, "#{MAILGUN_URL}/messages").
        with(:body => {:to => "Thomas Hopkins <hopkins.tc@gmail.com>", :from => ZEN_GUN_EMAIL, :subject => CONTEMPLATION, :text => "The Tao is the way."})
      Array.any_instance.stub(:sample).and_return("The Tao is the way.")
      out_note = double
      OutNote.stub(:new).and_return(out_note)
      out_note.should_receive(:impart)
      in_note = InNote.new(response)
      in_note.respond
    end

  end

end