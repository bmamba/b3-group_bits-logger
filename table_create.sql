create table group_bits_log (
	id int(11) unsigned not null auto_increment,
	client_id int(11) unsigned,
	group_bits_old mediumint(8) unsigned,
	group_bits_new mediumint(8) unsigned,
	time timestamp,
	primary key(id)
);

