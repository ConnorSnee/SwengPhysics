function addInventoryItem(serial_num, invoice_id, purchase_date, price, vendor_name, building, room_num, shelf, quantity) {
    $.getJSON('/addInventoryItem', {
            serial_num: serial_num,
            invoice_id: invoice_id,
            purchase_date: purchase_date,
            price: price,
            vendor_name: vendor_name,
            building: building,
            room_num: room_num,
            shelf: shelf,
            quantity: quantity
        },
        function(data) {
            location.reload();
        });
}
