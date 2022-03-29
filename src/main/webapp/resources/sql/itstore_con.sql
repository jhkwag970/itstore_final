

drop table files;
drop table replies;
drop table boards;
drop table likes;
drop table coupons;
drop table carts;
drop table members;
drop table specifications;
drop table models;
drop table products;

commit;

/*--------------------------*/

show create table products;

drop table products;
create table products(
    product_id int 
		auto_increment primary key,
    product_name varchar(50)
);

drop table models;
create table models(
    model_id int 
		auto_increment primary key,
    product_id int 
		references products(product_id) on DELETE CASCADE,
    model_name varchar(50)
);



drop table specifications;
create table specifications(
    spec_id int 
		auto_increment primary key,
    model_id int 
		references models(model_id) on Delete CASCADE,
    spec_processor varchar(100),
    spec_memory varchar(100),
    spec_display varchar(100),
    spec_network varchar(100),
    spec_weight int,
    spec_color varchar(50),
    spec_price int,
    spec_qty int
);


drop table members;
create table members(
    mem_name varchar(300),
    mem_id varchar(36) primary key,
    mem_password varchar(150),
    mem_email varchar(300),
    mem_birth varchar(30),
    mem_post_code varchar(30),
    mem_address varchar(300),
    mem_point int
);



drop table carts;
create table carts(
    cart_id int 
		auto_increment primary key,
    spec_id int 
		references specifications(spec_id) on Delete CASCADE,
    mem_id varchar(36) 
		references members(mem_id) on Delete CASCADE,
    cart_imp_uid varchar(500),
    cart_merchant_uid varchar(500),
    cart_price int default 0,
    cart_qty int default 1,
    cart_date varchar(30),
    cart_refund int default 0,
    cart_repair_date varchar(30),
    cart_r_est_date varchar(30),
    cart_address varchar(300),
    cart_phone varchar(300),
    cart_isCare int
);


drop table coupons;
create table coupons(
    coupon_id int 
		auto_increment primary key,
    mem_id varchar(36)
        references members(mem_id) on Delete CASCADE,
    coupon_desc varchar(100),
    coupon_pct int default 0,
    coupon_price int default 0,
    coupon_valid_date varchar(36)
);


drop table likes;
create table likes(
    like_id int
        auto_increment primary key,
    spec_id int
        references specifications(spec_id) on Delete CASCADE,
    mem_id varchar(26)
        references members(mem_id) on Delete CASCADE
);


drop table boards;
create table boards(
    board_id int
        auto_increment primary key,
    mem_id varchar(36)
        references members(mem_id) on Delete CASCADE,
    spec_id int
        references specifications(spec_id) on Delete CasCADE,
	model_id int
		references models(model_id) on delete cascade,
    board_rate int,
    board_title varchar(100),
    board_content varchar(100),
    board_date datetime default NOW(),
    board_type varchar(30)
);



drop table replies;
create table replies(
    reply_id int
        auto_increment primary key,
    mem_id varchar(36)
        references members(mem_id) on Delete CASCADE,
    board_id int
        references boards(board_id) on Delete CASCADE,
    reply_content varchar(500),
    reply_date datetime default NOW()
);


drop table files;
create table files(
    file_id int
        auto_increment primary key,
    board_id int
        references boards(board_id) on Delete CASCADE,
    file_name varchar(100)
);

commit;



alter table files
add FOREIGN key(board_id)
references boards (board_id) on delete cascade on update cascade;

alter table replies drop foreign key replies_ibfk_3;

select * from information_schema.table_constraints where table_name = 'files';

commit;