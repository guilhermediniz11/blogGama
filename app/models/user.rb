class User
  include Mongoid::Document
  include Mongoid::Timestamps


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable

  field :name, type: String
  field :isPJ , type: Boolean
  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :ip, type: String


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ['Nome', 'Email', 'Tipo', 'IP', 'Data de Criacao']
      all.each do |user|
        csv << [user.name, user.email, (user.isPJ ? 'B2B' : 'B2C'), user.ip, user.created_at]
      end
    end
  end

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
end
