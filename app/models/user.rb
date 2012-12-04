class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,# :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password


  ## Additional fields
  field :name,        :type => String
  field :occupation,  :type => String
  field :phone,       :type => String
  field :city,        :type => String

  field :seminars,    type: Array, default: []

  validates_presence_of :name
  validates_presence_of :occupation
  validates_presence_of :city
  validates_presence_of :phone
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  #field :confirmation_token,   :type => String
  #field :confirmed_at,         :type => Time
  #field :confirmation_sent_at, :type => Time
  #field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  def add_seminar(seminar_index)
    unless seminars.include? seminar_index
      seminars << seminar_index
      save
    end
  end

  scope :morning_mon, any_in(:seminars => ['0'])
  scope :morning_tue, any_in(:seminars => ['9'])
  scope :morning_wed, any_in(:seminars => ['10'])
  scope :morning_thu, any_in(:seminars => ['11'])
  scope :morning_fri, any_in(:seminars => ['12'])
  scope :morning_sat, any_in(:seminars => ['13'])
  scope :morning_sun, any_in(:seminars => ['14'])

  scope :s1_mon, any_in(:seminars => ['1'])
  scope :s2_tue, any_in(:seminars => ['2'])
  scope :s3_wed, any_in(:seminars => ['3'])
  scope :s4_thu, any_in(:seminars => ['4'])
  scope :s5_fri, any_in(:seminars => ['5'])
  scope :s6_sat, any_in(:seminars => ['6'])
  scope :s7_sat, any_in(:seminars => ['7'])
  scope :s8_sun, any_in(:seminars => ['8'])

end
