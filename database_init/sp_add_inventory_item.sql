USE permissions;
-- add user request stored procedure
DELIMITER $$
CREATE PROCEDURE `sp_add_item_to_inventory`(
    IN p_name VARCHAR(60),
    IN p_serial int(45),
    IN p_invoice_id int(25),
    IN p_purchase_date varchar(20),
    IN p_price float(10),
    IN p_vendor_name VARCHAR(60),
    IN p_building VARCHAR(60),
    IN p_room_num VARCHAR(45),
    IN p_shelf VARCHAR(10),
    IN p_quantity int(10)
)

BEGIN
	REPLACE into object (
        name,
        serial_num
	) values (
        p_name,
        p_serial
  );

  IF (select not exists (select 1 from invoice where invoice_id = p_invoice_id)) THEN
    REPLACE into invoice (
        invoice_id,
        purchase_date,
        vendor_name
  	) values (
        p_invoice_id,
        p_purchase_date,
        p_vendor_name
    );
  END IF;

  REPLACE into object_invoice (
    invoice_id,
    serial_num,
    object_price
  ) values (
    p_invoice_id,
    p_serial,
    p_price
  );

  IF (select not exists (select 1 from location where building = p_building and room_num = p_room_num)) THEN
    REPLACE into location(
      building,
      room_num
    ) values (
      p_building,
      p_room_num
    );
  END IF;

  REPLACE into item_locations (
    location_id,
    serial_num,
    quantity,
    shelf
  ) values(
    (select location_id from location where building=p_building AND room_num = p_room_num),
    p_serial,
    p_quantity,
    p_shelf
  );

  commit;

END $$

DELIMITER ;
