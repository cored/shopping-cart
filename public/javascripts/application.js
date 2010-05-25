// Put your application scripts here
for (var i=0; i<4; i++) {
    new Draggable('product_'+i, { revert: true });
}

Ajax.Responders.register({
    onCreate: function() {
        if($('indicator') && Ajax.activeRequestCount>0)
            Element.show('indicator');
    },
    onComplete: function() {
        if($('indicator') && Ajax.activeRequestCount==0)
            Element.hide('indicator');
    }
});

Droppables.add('cart', {
    accept: 'products',
    onDrop: function(element) {
        new Ajax.Updater('items', $('shopping_cart').readAttribute('data-url'), { method: 'get', parameters: { id: element.id }});
    }, 
    hoverclass: "cart-active"
});


