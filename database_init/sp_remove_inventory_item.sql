USE physics;
DELIMITER $$

-- stored procedure to remove an inventory item
CREATE PROCEDURE `sp_remove_inventory_item`(

        IN p_hashed_serial BIGINT(60)
	)

BEGIN

		DELETE FROM item_locations where (p_hashed_serial = hashed_serial_num);

		DELETE FROM object_invoice where (p_hashed_serial = hashed_serial_num);

        DELETE FROM object_lab_demo where (p_hashed_serial = hashed_serial_num);

        DELETE FROM object where (p_hashed_serial = hashed_serial_num);

	commit;

END $$

DELIMITER ;
