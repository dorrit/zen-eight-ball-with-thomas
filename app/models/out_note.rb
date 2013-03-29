
# require '../../env'
# API_KEY =

# OUT_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/dorrit.epicodus.mailgun.org"

# ZEN_GUN_EMAIL = "tao.mind@zen.gun"

# CONTEMPLATION = "Your contemplation~~~"

class OutNote 
  include ActiveModel::Validations

  attr_reader :to, :from, :subject, :text

  validates :to, :presence => true
  validates :from, :presence => true
  validates :subject, :presence => true
  validates :text, :presence=> true

  def initialize(attributes)
    @to = attributes[:to]
    @from = ZEN_GUN_EMAIL
    @subject = CONTEMPLATION
    @text = zenify!
  end

  def impart
    response = Faraday.post do |request|
      request.url "#{OUT_URL}/messages"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")
      request.body = URI.encode_www_form({:to => @to, :from => @from, :subject => @subject, :text => @text})
    end
    # status = response.status
    # sent_message = self.new(:to => attributes[:to], :from => attributes[:from], :subject => attributes[:subject], :text => attributes[:text], :status => status)
  end

  private

  def zenify!
    pearls[Kernel.rand(0..@contemplations.length-1)]
  end

end