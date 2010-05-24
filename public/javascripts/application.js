// Put your application scripts here
for (var i=0; i<4; i++) {
    new Draggable('product_'+i, { revert: true });
}

Droppables.add('cart', {
    accept: 'products',
    onDrop: function(element) {
        $('items').update('Dropped an element'+element.id+'on me');
    }
});
