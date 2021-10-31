create table mobilede.advertisements
(
	id int not null
		primary key,
	url varchar(2048) null,
	raw longtext null,
	status int null
);

create index advertisements_id_index
	on mobilede.advertisements (id);

create index advertisements_status_index
	on mobilede.advertisements (status);

create table mobilede.cars
(
	id int not null
		primary key,
	title text not null,
	price decimal(12,2) null,
	damage text null,
	mileage int null,
	displacement int null,
	power int null,
	consumption_k decimal(12,2) null,
	consumption_i decimal(12,2) null,
	consumption_a decimal(12,2) null,
	fuel text null,
	emission int null,
	transmission varchar(255) null,
	registration date null,
	info longtext null,
	color varchar(255) null,
	color_manf varchar(255) null,
	category varchar(255) null,
	manufacturer varchar(255) null,
	model varchar(255) null
);

create index cars_id_index
	on mobilede.cars (id);

create index cars_mileage_index
	on mobilede.cars (mileage);

create index cars_price_index
	on mobilede.cars (price);

create table mobilede.cars_features
(
	car int not null,
	feature int not null,
	primary key (car, feature)
);

create table mobilede.color
(
	color varchar(255) null,
	category varchar(255) null
);

create table mobilede.features
(
	id int auto_increment
		primary key,
	name varchar(255) null
);

create table mobilede.manufacturer
(
	manufacturer varchar(255) not null
		primary key,
	country varchar(255) null
);

