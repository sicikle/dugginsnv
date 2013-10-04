module Spree
    class BaseMailer < ActionMailer::Base
        def from_address
            "store@dugginsnv.com"
        end
        
        def money(amount)
            Spree::Money.new(amount).to_s
        end
        helper_method :money
    end
end