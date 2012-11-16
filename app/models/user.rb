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




end
