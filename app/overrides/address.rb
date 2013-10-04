Deface::Override.new(:name => "remove billing address form",
                     :virtual_path => "spree/checkout/_address",
                     :remove => "#billing[data-hook]"
)

Deface::Override.new(:name => "remove use billing address checkbox",
                     :virtual_path => "spree/checkout/_address",
                     :remove => "[data-hook='use_billing']"
)

Deface::Override.new(:name => "remove second address",
                     :virtual_path => "spree/checkout/_address",
                     :remove => "p#saddress2"
)

Deface::Override.new(:name => "remove zip code",
                     :virtual_path => "spree/checkout/_address",
                     :remove => "p#szipcode"
)

Deface::Override.new(:name => "remove state",
                     :virtual_path => "spree/checkout/_address",
                     :remove => "p#sstate"
)

Deface::Override.new(:name => "remove country",
                     :virtual_path => "spree/checkout/_address",
                     :remove => "p#scountry"
)

Deface::Override.new(:name => "remove city",
                     :virtual_path => "spree/checkout/_address",
                     :remove => "p#scity"
)

Deface::Override.new(:name => "remove city",
                     :virtual_path => "spree/checkout/edit",
                     :remove => "p#scity"
)

Deface::Override.new(:name => "remove billing",
                     :virtual_path => "spree/shared/_order_details",
                     :remove => "[data-hook='order-bill-address']"
)