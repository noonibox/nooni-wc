create sequence if not exists seq_company;
create table if not exists company (
    company_seq bigint not null default nextval('seq_company'),
    constraint pk_company_seq primary key (company_seq)
);

create sequence if not exists seq_category;
create table if not exists category (
    category_seq bigint not null default nextval('seq_category'),
    up_category_seq bigint null,
    name varchar(255) not null,
    show_yn bit not null,
    create_at timestamp not null,
    update_at timestamp not null,
    constraint pk_category_seq primary key (category_seq),
    constraint fk_up_category_seq foreign key (up_category_seq) references category(category_seq) on delete cascade on update cascade
);

comment on table category is '카테고리';
comment on column category.category_seq is '카테고리 고유번호';
comment on column category.name is '카테고리 이름';
comment on column category.show_yn is '보일지/말지';
comment on column category.up_category_seq is '부모 카테고리 고유번호';
comment on column category.create_at is '생성일자';
comment on column category.update_at is '수정일자';


create sequence if not exists seq_product;
create type product_tp as enum ('PICTURE', 'IMAGE', 'GOODS');
create table if not exists product (
    product_seq bigint not null default nextval('seq_product'),
    display_name varchar(255) not null,
    type product_tp not null,
    remark varchar(255) not null,
    list_price numeric not null,
    sale_price numeric not null,
    create_at timestamp not null,
    update_at timestamp not null,
    constraint pk_product_seq primary key (product_seq)
);

comment on table product is '제품';
comment on column product.product_seq is '제품 고유번호';
comment on column product.create_at is '생성일자';
comment on column product.update_at is '수정일자';