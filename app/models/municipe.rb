# frozen_string_literal: true

class Municipe < ApplicationRecord
  searchkick

  enum status: { active: true, inactive: false }

  has_one :address, dependent: :destroy, inverse_of: :municipe
  has_one_attached :photo
  accepts_nested_attributes_for :address

  validates :full_name, :cpf, :cns, :email, :date_of_birth, :phone, :photo, presence: true
  validates :cpf, :cns, :email, uniqueness: { case_sensitive: false }
  validates :cpf, cpf: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/ }
  validates :cns, '::CnsBrazil::Cns': true
  validates :full_name, :email, length: { maximum: 255 }
  validates :phone, format: { with: /\A\+55\s\(\d{2}\)\s\d{5}-\d{4}\z/ }
  validates :date_of_birth, date: { before_or_equal_to: proc { Time.zone.now }, message: :invalid }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_commit :dispatch_created, on: :create
  after_commit :dispatch_updated, on: :update

  def search_data
    {
      full_name: full_name,
      cpf: cpf,
      cns: cns,
      email: email
    }
  end

  def dispatch_created
    sms_message = I18n.t('sms.messages.created', name: full_name)
    MunicipeMailer.created(self).deliver_later
    TwilioService.new.send_sms(phone, sms_message) unless Rails.env.test?
  end

  def dispatch_updated
    sms_message = I18n.t('sms.messages.updated', name: full_name)
    MunicipeMailer.updated(self).deliver_later
    TwilioService.new.send_sms(phone, sms_message) unless Rails.env.test?
  end
end
