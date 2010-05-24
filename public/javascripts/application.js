// Put your application scripts here
for (var i=0; i<4; i++) {
    new Draggable('product_'+i, { revert: true });
}

Droppables.add('cart', {
    accept: 'products',
    onDrop: function(element) {
        new Ajax.Request($('shopping_cart').readAttribute('data-url'), { method: 'get', parameters: { id: element.id } })
    }
});
