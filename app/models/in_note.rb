class InNote

  attr_reader :from, :text, :sender, :subject

  def initialize(attributes)
    @from = attributes["from"]
    @text = attributes["body-plain"]
    @sender = attributes["sender"]
    @subject = attributes["subject"]
  end

  def respond
    #post to a url/outnotes, include @from
    response = Faraday.post do |request|
      request.url "http://zengun.fwd.wf/out_notes"
      request.body = {:to => @from}
    end
  end
end