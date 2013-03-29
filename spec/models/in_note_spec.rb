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
    it 'POSTs to the OutNote Controllers to POST' do
     note = InNote.new(response)
     stub =  stub_request(:post, "http://zengun.fwd.wf/out_notes").
         with(:body => 'to=Thomas+Hopkins+%3Chopkins.tc%40gmail.com%3E')
     note.respond
     stub.should have_been_requested
    end
  end

end