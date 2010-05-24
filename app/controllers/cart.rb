ShoppingCart.controllers :cart do
    get :index, :map => '/' do
        session[:cart] = []
        @products = ['iPod black', 'iMac', 'iMac RC', 'iPod']
        render 'cart/index'
    end

    get :add, :map => '/add' do
        product_id = params[:id][-1].to_i
        cart = session[:cart] || []
        unless cart[product_id]
            cart[product_id] = 1
        else
            cart[product_id] += 1
        end
        session[:cart] = cart
        @products = ['iPod black', 'iMac', 'iMac RC', 'iPod']
    end

end
