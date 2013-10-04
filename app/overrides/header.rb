Deface::Override.new(:virtual_path => "spree/admin/shared/_header",
                      :insert_after => "[data-hook='user-logged-in-as']",
                      :text => "<li><i class='icon-share-alt'></i><a href='http://webmail.dugginsnv.com/' target='_blank'>Webmail</a></li>",
                      :name => 'header'

)

Deface::Override.new(:virtual_path => "spree/shared/_nav_bar",
                     :insert_after => "#link-to-cart",
                     :text => " <% if can?(:admin, Spree::Order) %><li><i class='icon-share-alt'></i><a href='/admin' target='_blank'>Admin</a></li><% end %>",
                     :name => 'header'

)

