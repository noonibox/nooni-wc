-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ┃ NOTICE (공지사항)
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- ┃ LOGIN
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
create sequence if not exists seq_login;
create table if not exists login (
    id bigint not null default nextval('seq_login'),
    email varchar(320) not null,
    password char(60) not null,
    verified boolean not null,
    verified_at timestamp null,
    create_at timestamp not null,
    update_at timestamp not null,
    constraint pk_login_id primary key (id),
    constraint uix_login_email unique (email)
);
comment on table login is '사용자 이메일';
comment on column login.id is '고유번호';
comment on column login.email is '이메일 주소';
comment on column login.password is '비밀번호';
comment on column login.verified is '인증 여부';
comment on column login.verified_at is '인증 일시';
comment on column login.update_at is '수정일자';
comment on column login.create_at is '생성일자';
comment on column login.update_at is '수정일자';


-- -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- -- ┃ COMPANY
-- -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- create sequence if not exists seq_company;
-- create type company_tp as enum ('co', 'inc', 'plc', 'llc');
-- create type company_state as enum ('closed', 'open');
-- create table if not exists company (
--     company_seq bigint not null default nextval('seq_company'),
--     up_company_seq bigint null,
--     name varchar(255) not null,
--     company_tp company_tp not null,
--     company_state company_state not null,
--     adj_rate decimal(5,4) not null,
--     remark varchar(255) null,
--     create_at timestamp not null,
--     update_at timestamp not null,
--     constraint pk_company_seq primary key (company_seq),
--     constraint fk_company_up_company_seq foreign key (up_company_seq) references company(company_seq) on delete cascade on update cascade
-- );
--
-- comment on type company_tp is '회사 타입 (co: 개인회사, inc: 주식회사, plc: 상장법인, llc: 유한회사)';
-- comment on type company_state is '회사 상태 (closed: 폐업, open: 영업중)';
-- comment on table company is '회사';
-- comment on column company.company_seq is '회사 고유번호';
-- comment on column company.up_company_seq is '부모 회사';
-- comment on column company.name is '회사 이름';
-- comment on column company.company_tp is '회사 타입 (co: 개인회사, inc: 주식회사, plc: 상장법인, llc: 유한회사)';
-- comment on column company.company_state is '회사 상태 (closed: 폐업, open: 영업중)';
-- comment on column company.adj_rate is '정산율';
-- comment on column company.remark is '관리 코멘트';
-- comment on column company.create_at is '생성일자';
-- comment on column company.update_at is '수정일자';
--
-- create sequence seq_company_history;
-- create table if not exists company_history (
--     company_history_seq bigint not null default nextval('seq_company_history'),
--     company_seq bigint not null,
--     up_company_seq bigint null,
--     name varchar(255) not null,
--     company_tp company_tp not null,
--     company_state company_state not null,
--     adj_rate decimal(5,4) not null,
--     remark varchar(255) null,
--     create_at timestamp not null,
--     update_at timestamp not null,
--     constraint pk_company_history_seq primary key (company_history_seq),
--     constraint fk_company_history_company_seq foreign key (company_seq) references company(company_seq) on update cascade on delete cascade
-- );
--
-- comment on table company_history is '회사 히스토리';
-- comment on column company_history.company_history_seq is '고유번호';
-- comment on column company_history.company_seq is '회사 고유번호';
-- comment on column company_history.up_company_seq is '부모 회사';
-- comment on column company_history.name is '회사 이름';
-- comment on column company_history.company_tp is '회사 타입 (co: 개인회사, inc: 주식회사, plc: 상장법인, llc: 유한회사)';
-- comment on column company_history.company_state is '회사 상태 (closed: 폐업, open: 영업중)';
-- comment on column company_history.adj_rate is '정산율';
-- comment on column company_history.remark is '관리 코멘트';
-- comment on column company_history.create_at is '생성일자';
-- comment on column company_history.update_at is '수정일자';
--
-- create function fc_trigger_company_history() returns trigger as
-- $$
-- declare
-- begin
--     insert into company_history
--     (
--          company_seq,
--          up_company_seq,
--          name,
--          company_tp,
--          company_state,
--          adj_rate,
--          remark,
--          create_at,
--          update_at
--      )
--     values
--     (
--         new.company_seq,
--         new.up_company_seq,
--         new.name,
--         new.company_tp,
--         new.company_state,
--         new.adj_rate,
--         new.remark,
--         now(),
--         now()
--     );
--     return new;
-- end
-- $$ language 'plpgsql';
--
--
-- create trigger trigger_company_history after insert or update on company
--     for each row execute procedure fc_trigger_company_history();
--
-- -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- -- ┃ STAFF
-- -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- create sequence if not exists seq_staff;
-- create table if not exists staff (
--     company_seq bigint not null,
--     member_seq bigint not null,
--     create_at timestamp not null,
--     update_at timestamp not null,
--     constraint pk_staff primary key (company_seq, member_seq),
--     constraint fk_staff_company_seq foreign key (company_seq) references company(company_seq) on update cascade on delete cascade,
--     constraint fk_staff_member_seq foreign key (member_seq) references member(member_seq) on update cascade on delete cascade
-- );
--
-- comment on column staff.company_seq is '회사고유번호';
-- comment on column staff.member_seq is '회원고유번호';
-- comment on column staff.create_at is '생성일자';
-- comment on column staff.update_at is '수정일자';
--
-- create type staff_authority_tp as enum ('read', 'write');
-- create table if not exists staff_authority (
--     company_seq bigint not null,
--     member_seq bigint not null,
--     authority staff_authority_tp not null,
--     create_at timestamp not null,
--     update_at timestamp not null,
--     constraint pk_staff_authority_seq primary key (company_seq, member_seq),
--     constraint fk_staff_authority_company_seq_member_seq foreign key (company_seq, member_seq) references staff(company_seq, member_seq) on update cascade on delete cascade
-- );
-- comment on column staff_authority.authority is '권한';
-- comment on column staff_authority.company_seq is '회사고유번호';
-- comment on column staff_authority.member_seq is '회원고유번호';
-- comment on column staff_authority.create_at is '생성일자';
-- comment on column staff_authority.update_at is '수정일자';

-- -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- -- ┃ CATEGORY
-- -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- create sequence if not exists seq_category;
-- create table if not exists category (
--     category_seq bigint not null default nextval('seq_category'),
--     up_category_seq bigint null,
--     name varchar(255) not null,
--     show_yn bit not null,
--     create_at timestamp not null,
--     update_at timestamp not null,
--     constraint pk_category_seq primary key (category_seq),
--     constraint fk_category_up_category_seq foreign key (up_category_seq) references category(category_seq) on delete cascade on update cascade
-- );
--
-- comment on table category is '카테고리';
-- comment on column category.category_seq is '카테고리 고유번호';
-- comment on column category.name is '카테고리 이름';
-- comment on column category.show_yn is '보일지/말지';
-- comment on column category.up_category_seq is '부모 카테고리 고유번호';
-- comment on column category.create_at is '생성일자';
-- comment on column category.update_at is '수정일자';
--
-- -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- -- ┃ PRODUCT
-- -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- create sequence if not exists seq_product;
-- create type product_tp as enum ('PICTURE', 'IMAGE', 'GOODS');
-- create table if not exists product (
--     product_seq bigint not null default nextval('seq_product'),
--     display_name varchar(255) not null,
--     type product_tp not null,
--     remark varchar(255) not null,
--     list_price decimal(10,2) not null,
--     sale_price decimal(10,2) not null,
--     create_at timestamp not null,
--     update_at timestamp not null,
--     constraint pk_product_seq primary key (product_seq)
-- );
--
-- comment on table product is '제품';
-- comment on column product.product_seq is '제품 고유번호';
-- comment on column product.create_at is '생성일자';
-- comment on column product.update_at is '수정일자';