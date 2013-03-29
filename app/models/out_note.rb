class OutNote
  include ActiveModel::Validations

  API_KEY = 

  MAILGUN_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/dorrit.epicodus.mailgun.org"

  ZEN_GUN_EMAIL = "tao.mind@zen.gun"

  CONTEMPLATION = "Your contemplation~~~"

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
      request.url "#{MAILGUN_URL}/messages"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")
      request.body = URI.encode_www_form({:to => @to, :from => @from, :subject => @subject, :text => @text})
    end
  end

  private

  def zenify!
    pearls.sample
  end

  def pearls
    ["Simplicity, patience, compassion.\nThese three are your greatest treasures.\nSimple in actions and thoughts, you return to the source of being.\nPatient with both friends and enemies,\nyou accord with the way things are.\nCompassionate toward yourself,\nyou reconcile all beings in the world.",
    "Knowing others is intelligence; knowing yourself is true wisdom. Mastering others is strength; mastering yourself is true power. If you realize that you have enough, you are truly rich.",
    "Those who know do not speak. Those who speak do not know.",
    "When you are content to be simply yourself and don't compare or compete, everyone will respect you.",
    "The truth is not always beautiful, nor beautiful words the truth.",
    "A man with outward courage dares to die; a man with inner courage dares to live.",
    "If you understand others you are smart.\nIf you understand yourself you are illuminated.\nIf you overcome others you are powerful.\nIf you overcome yourself you have strength.\nIf you know how to be satisfied you are rich.\nIf you can act with vigor, you have a will.\nIf you don't lose your objectives you can be long-lasting.\nIf you die without loss, you are eternal.",
    "Do you have the patience to wait until your mud settles and the water is clear?",
    "The flame that burns Twice as bright burns half as long.",
    "A leader is best\nWhen people barely know he exists\nOf a good leader, who talks little,\nWhen his work is done, his aim fulfilled,\nThey will say, 'We did this ourselves.'",
    "Stop thinking, and end your problems.\nWhat difference between yes and no?\nWhat difference between success and failure?\nMust you value what others value,\navoid what others avoid?\nHow ridiculous!\n\nOther people are excited,\nas though they were at a parade.\nI alone don't care,\nI alone am expressionless,\nlike an infant before it can smile.\n\nOther people have what they need;\nI alone possess nothing.\nI alone drift about,\nlike someone without a home.\nI am like an idiot, my mind is so empty.\n\nOther people are bright;\nI alone am dark.\nOther people are sharp;\nI alone am dull.\nOther people have purpose;\nI alone don't know.\nI drift like a wave on the ocean,\nI blow as aimless as the wind.\n\nI am different from ordinary people.\nI drink from the Great Mother's breasts.",
    "To understand the limitation of things, desire them.",
    "The further one goes, the less one knows.",
    "The wise man is one who, knows, what he does not know.",
    "Love\n\nEmbracing Tao, you become embraced.\nSupple, breathing gently, you become reborn.\nClearing your vision, you become clear.\nNurturing your beloved, you become impartial.\nOpening your heart, you become accepted.\nAccepting the World, you embrace Tao.\nBearing and nurturing,\nCreating but not owning,\nGiving without demanding,\nControlling without authority,\nThis is love.",
    "If you try to change it, you will ruin it. Try to hold it, and you will lose it.",
    "Close your mouth,\nblock off your senses,\nblunt your sharpness,\nuntie your knots,\nsoften your glare,\nsettle your dust.\nThis is the primal identity.",
    "Hope and fear are both phantoms that arise from thinking of the self. When we don't see the self as self, what do we have to fear?",
    "Countless words \ncount less \nthan the silent balance \nbetween yin and yang",
    "He who conquers others is strong; he who conquers himself is mighty",
    "When nothing is done, \nnothing is left undone.",
    "all streams flow to the sea because it is lower than they are. humility gives it its power. if you want to govern the people, you must place yourself below them. if you want to lead the people, you must learn how to follow them.",
    "Fill your bowl to the brim and it will spill. Keep sharpening your knife and it will blunt.",
    "Give evil nothing to oppose\nand it will disappear by itself.",
    "My teachings are easy to understand \nand easy to put into practice.\nYet your intellect will never grasp them,\nand if you try to practice them,you'll fail.\n\nMy teachings are older than the world.\nHow can you grasp their meaning?\n\nIf you want to know me,\nLook inside your heart.",
    "When people see some things as beautiful,\nother things become ugly.\nWhen people see some things as good,\nother things become bad.",
    "When there is no desire,\nall things are at peace.",
    "When the people of the world all know beauty as beauty, there arises the recognition of ugliness. When they all know the good as good, there arises the recognition of evil.",
    "Knowing others is wisdom;\nKnowing the self is enlightenment.\nMastering others requires force;\nMastering the self requires strength;\nHe who knows he has enough is rich.\nPerseverance is a sign of will power.",
    "When goodness is lost there is morality."]
  end

end