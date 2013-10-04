module Spree
  class Address < ActiveRecord::Base
    belongs_to :country, class_name: "Spree::Country"
    belongs_to :state, class_name: "Spree::State"

    has_many :shipments

    alias_attribute :first_name, :firstname
    alias_attribute :last_name, :lastname

    before_save :state_validate

    def self.default
      country = Spree::Country.find(Spree::Config[:default_country_id]) rescue Spree::Country.first
      new(country: country)
    end

    # Can modify an address if it's not been used in an order (but checkouts controller has finer control)
    # def editable?
    #   new_record? || (shipments.empty? && checkouts.empty?)
    # end

    def full_name
      "#{firstname} #{lastname}".strip
    end

    def state_text
      state.try(:abbr) || state.try(:name) || state_name
    end

    def same_as?(other)
      return false if other.nil?
      attributes.except('id', 'updated_at', 'created_at') == other.attributes.except('id', 'updated_at', 'created_at')
    end

    alias same_as same_as?

    def to_s
      "#{full_name}: #{address1}"
    end

    def clone
      self.class.new(self.attributes.except('id', 'updated_at', 'created_at'))
    end

    def ==(other_address)
      self_attrs = self.attributes
      other_attrs = other_address.respond_to?(:attributes) ? other_address.attributes : {}

      [self_attrs, other_attrs].each { |attrs| attrs.except!('id', 'created_at', 'updated_at', 'order_id') }

      self_attrs == other_attrs
    end

    def empty?
      attributes.except('id', 'created_at', 'updated_at', 'order_id', 'country_id').all? { |_, v| v.nil? }
    end

    # Generates an ActiveMerchant compatible address hash
    def active_merchant_hash
      {
          name: full_name,
          address1: address1,
          address2: address2,
          city: city,
          state: state_text,
          zip: zipcode,
          country: country.try(:iso),
          phone: phone
      }
    end

    private
    def require_phone?
      true
    end

    def require_zipcode?
      true
    end

    def state_validate
      state = Spree::State.find_by abbr: "EUX"
      self.state = state
    end
  end
end