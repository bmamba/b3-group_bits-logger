delimiter $$
create trigger after_clients_update
after update on clients
for each row
begin
	if new.group_bits != old.group_bits and new.id = old.id then
		insert into group_bits_log set client_id = old.id, group_bits_old = old.group_bits, group_bits_new = new.group_bits;
	end if;
end$$

create trigger after_clients_insert
after insert on clients
for each row
begin
	insert into group_bits_log set client_id = new.id, group_bits_new = new.group_bits;
end$$

create trigger after_clients_delete
after delete on clients
for each row
begin
	insert into group_bits_log set client_id = old.id, group_bits_old = old.group_bits;
end$$

delimiter ;
