ShoppingCart.controllers :cart do
    before do
        @products = ['iPod black', 'iMac', 'iMac RC', 'iPod']
    end

    get :index, :map => '/' do
        session[:cart] = {}
        render 'cart/index'
    end

    get :add, :map => '/add' do
        product_id = params[:id].at(-1).to_i
        cart = session[:cart] || {}
        cart[product_id] ? cart[product_id] += 1 : cart[product_id] = 1
        session[:cart] = cart
        Padrino.logger.debug(cart.inspect)
        render 'cart/add'
    end
end
