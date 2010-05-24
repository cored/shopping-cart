ShoppingCart.controllers :cart do
    get :index, :map => '/' do
        session[:cart] = {}
        @products = ['iPod black', 'iMac', 'iMac RC', 'iPod']
        render 'cart/index'
    end

    get :add, :map => '/add' do
        product_id = params[:id].at(8).to_i
        Padrino.logger.info(params[:id].inspect + " " + product_id.inspect)
        cart = session[:cart] || {}
        cart[product_id] ? cart[product_id] += 1 : cart[product_id] = 1
        session[:cart] = cart
        @products = ['iPod black', 'iMac', 'iMac RC', 'iPod']
        Padrino.logger.info(cart.inspect)
        Padrino.logger.info(cart.inspect)
        render 'cart/add'
    end

end
