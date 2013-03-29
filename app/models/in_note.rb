class InNote

  attr_reader :from, :text, :sender, :subject
  LOCAL_URL = "http://zengun.fwd.wf"

  def initialize(attributes)
    @from = attributes["from"]
    @text = attributes["body-plain"]
    @sender = attributes["sender"]
    @subject = attributes["subject"]
  end

  # def respond
  #   #post to a url/outnotes, include @from
  #   response = Faraday.post do |request|
  #     request.url "#{LOCAL_URL}/out_notes"
  #     request.body = {:to => @from}
  #   end
  # end

  def respond
    out_note = OutNote.new(:to => @from)
    out_note.impart
  end
end