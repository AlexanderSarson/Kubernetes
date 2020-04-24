drop schema if exists PIMTEST;
create schema PIMTEST;
use PIMTEST;
create table ValueTypes
(
    valuetype_id   bigint auto_increment,
    valuetype_name varchar(50) not null,
    primary key (valuetype_id)
);
create table Products
(
    product_id bigint auto_increment,
    primary key (product_id)
);
create table Components
(
    component_id   bigint auto_increment,
    component_name varchar(100) not null,
    primary key (component_id)
);
create table ComponentValues
(
    product_id      bigint not null,
    component_id    bigint not null,
    component_value TEXT   not null,
    primary key (product_id, component_id),
    foreign key (product_id) references Products (product_id),
    foreign key (component_id) references Components (component_id)
);
create table ComponentType
(
    component_id bigint not null,
    valuetype_id bigint not null,
    primary key (component_id, valuetype_id),
    foreign key (component_id) references Components (component_id),
    foreign key (valuetype_id) references ValueTypes (valuetype_id)
);
create table Categories
(
    category_id bigint auto_increment,
    category_name varchar(100) not null unique,
    category_image varchar(100),
    category_description TEXT NOT NULL,
    primary key (category_id)
);
create table ProductCategory
(
    product_id  bigint not null,
    category_id bigint not null,
    primary key (product_id, category_id),
    foreign key (product_id) references Products (product_id),
    foreign key (category_id) references Categories (category_id)
);
create table ComponentCategory
(
    component_id bigint not null,
    category_id  bigint not null,
    primary key (component_id, category_id),
    foreign key (component_id) references Components (component_id),
    foreign key (category_id) references Categories (category_id)
);

create index componentNameIndex on Components (component_name);

insert into ValueTypes(valuetype_name)
values ("int");
insert into ValueTypes(valuetype_name)
values ("double");
insert into ValueTypes(valuetype_name)
values ("String");
insert into ValueTypes(valuetype_name)
values ("Date");
insert into ValueTypes(valuetype_name)
values ("Time");
insert into ValueTypes(valuetype_name)
values ("long");
insert into Components(component_name)
values ("Product Number");
insert into Components(component_name)
values ("Product Name");
insert into Components(component_name)
values ("Product Description");
insert into Components(component_name)
values ("Product Text");
insert into Components(component_name)
values ("Product Status");
insert into Components(component_name)
values ("Product Info");
insert into Components(component_name)
values ("Product Image");
insert into ComponentType(component_id, valuetype_id)
values (1, 1);
insert into ComponentType(component_id, valuetype_id)
values (2, 3);
insert into ComponentType(component_id, valuetype_id)
values (3, 3);
insert into ComponentType(component_id, valuetype_id)
values (4, 3);
insert into ComponentType(component_id, valuetype_id)
values (5, 3);
insert into ComponentType(component_id, valuetype_id)
values (6, 3);
insert into ComponentType(component_id, valuetype_id)
values (7, 3);
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (1, 1, "1111");
insert into ComponentValues(product_id, component_id, component_value)
values (1, 2, "Effipro Spot-On Opl 50 Mg");
insert into ComponentValues(product_id, component_id, component_value)
values (1, 3, "Bla Bla Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (1, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (1, 5, "Done");
insert into ComponentValues(product_id, component_id, component_value)
values (1, 6, "Bla Bla Bla Bla Product Info");
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (2, 1, "2222");
insert into ComponentValues(product_id, component_id, component_value)
values (2, 2, "Kaleorid Tabl 750 Mg");
insert into ComponentValues(product_id, component_id, component_value)
values (2, 3, "Bla Bla Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (2, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (2, 5, "Not Done");
insert into ComponentValues(product_id, component_id, component_value)
values (2, 6, "Bla Bla Bla Bla Product Info");
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (3, 1, "3333");
insert into ComponentValues(product_id, component_id, component_value)
values (3, 2, "Imodium Smelt Frys. Tabl 2 Mg");
insert into ComponentValues(product_id, component_id, component_value)
values (3, 3, "Bla Bla Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (3, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (3, 5, "Not Done");
insert into ComponentValues(product_id, component_id, component_value)
values (3, 6, "Bla Bla Bla Bla Product Info");
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (4, 1, "4444");
insert into ComponentValues(product_id, component_id, component_value)
values (4, 2, "Bromhexin Or.Opl 0,8Mg/Ml (Dak");
insert into ComponentValues(product_id, component_id, component_value)
values (4, 3, "Bla Bla Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (4, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (4, 5, "Not Done");
insert into ComponentValues(product_id, component_id, component_value)
values (4, 6, "Bla Bla Bla Bla Product Info");
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (5, 1, "5555");
insert into ComponentValues(product_id, component_id, component_value)
values (5, 2, "Movicol Junior Plv T.Oral Opl");
insert into ComponentValues(product_id, component_id, component_value)
values (5, 3, "Bla Bla Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (5, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (5, 5, "Not Done");
insert into ComponentValues(product_id, component_id, component_value)
values (5, 6, "Bla Bla Bla Bla Product Info");
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (6, 1, "6666");
insert into ComponentValues(product_id, component_id, component_value)
values (6, 2, "Movicol Junior Plv T.Oral Opl");
insert into ComponentValues(product_id, component_id, component_value)
values (6, 3, "Bla Bla Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (6, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (6, 5, "Not Done");
insert into ComponentValues(product_id, component_id, component_value)
values (6, 6, "Bla Bla Bla Bla Product Info");
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (7, 1, "7777");
insert into ComponentValues(product_id, component_id, component_value)
values (7, 2, "Movicol Junior Plv T.Oral Opl");
insert into ComponentValues(product_id, component_id, component_value)
VALUES (7, 3, "Bla B'la Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (7, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (7, 5, "Not Done");
insert into ComponentValues(product_id, component_id, component_value)
values (7, 6, "Bla Bla Bla Bla Product Info");
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (8, 1, "8888");
insert into ComponentValues(product_id, component_id, component_value)
values (8, 2, "Movicol Junior Plv T.Oral Opl");
insert into ComponentValues(product_id, component_id, component_value)
values (8, 3, "Bla Bla Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (8, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (8, 5, "Not Done");
insert into ComponentValues(product_id, component_id, component_value)
values (8, 6, "Bla Bla Bla Bla Product Info");
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (9, 1, "9999");
insert into ComponentValues(product_id, component_id, component_value)
values (9, 2, "Movicol Junior Plv T.Oral Opl");
insert into ComponentValues(product_id, component_id, component_value)
values (9, 3, "Bla Bla Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (9, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (9, 5, "Not Done");
insert into ComponentValues(product_id, component_id, component_value)
values (9, 6, "Bla Bla Bla Bla Product Info");
insert into Products()
values ();
insert into ComponentValues(product_id, component_id, component_value)
values (10, 1, "10000");
insert into ComponentValues(product_id, component_id, component_value)
values (10, 2, "Movicol Junior Plv T.Oral Opl");
insert into ComponentValues(product_id, component_id, component_value)
values (10, 3, "Bla Bla Bla Bla Product Description");
insert into ComponentValues(product_id, component_id, component_value)
values (10, 4, "Bla Bla Bla Bla Product Text");
insert into ComponentValues(product_id, component_id, component_value)
values (10, 5, "Not Done");
insert into ComponentValues(product_id, component_id, component_value)
values (10, 6, "Bla Bla Bla Bla Product Info");
insert into Categories(category_name, category_description)
values ("Medicinal", "Medicinal Description");
insert into ComponentCategory(component_id, category_id)
values (1, 1);
insert into ComponentCategory(component_id, category_id)
values (2, 1);
insert into ComponentCategory(component_id, category_id)
values (3, 1);
insert into ComponentCategory(component_id, category_id)
values (5, 1);
insert into Categories(category_name, category_description)
values ("Electronics", "Electronics Description");
insert into ComponentCategory(component_id, category_id)
values (1, 2);
insert into ComponentCategory(component_id, category_id)
values (2, 2);
insert into ComponentCategory(component_id, category_id)
values (3, 2);
insert into ComponentCategory(component_id, category_id)
values (5, 2);
insert into Categories(category_name, category_description)
values ("Non-Food", "Non-Food Description");
insert into ComponentCategory(component_id, category_id)
values (1, 3);
insert into ComponentCategory(component_id, category_id)
values (2, 3);
insert into ComponentCategory(component_id, category_id)
values (3, 3);
insert into ComponentCategory(component_id, category_id)
values (5, 3);
insert into ProductCategory(product_id, category_id)
values (1, 1);
insert into ProductCategory(product_id, category_id)
values (1, 2);
insert into ProductCategory(product_id, category_id)
values (1, 3);