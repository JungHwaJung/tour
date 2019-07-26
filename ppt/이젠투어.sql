-- select * from tab;

-- ���� ���� �ѹ�: f12
-- ���� ���� Ŀ��: f11
-- ����: ctrl + enter
-- ���� ������ ����: �ش� �κ� �巡�� + ctrl + enter

---------------------------------------------------------------------
-- table ����
---------------------------------------------------------------------

create table member (
	m_id varchar2(80) not null primary key,
	m_password varchar2(80) not null,
	m_name varchar2(40) not null,
	m_tel varchar2(40),
	m_email varchar2(100),
	m_field varchar2(10),
	m_hashed varchar2(1000)
);

create table hotel (
	h_no number not null primary key,
	h_name varchar2(40) not null,
	h_address varchar2(200) not null,
	h_tel varchar2(40),
	h_price number not null,
	h_approve varchar2(10) default 'N',
	h_m_id varchar2(80) not null,
 	h_img varchar2(500),
   	h_type varchar2(100),
   	h_content varchar2(2000),
    h_room number not null,
	constraint fk_h_mid foreign key(h_m_id) references member(m_id) on delete cascade
);

create table hotel_room (
	hr_h_no number not null,
	hr_date date not null,
   	hr_room number,
	constraint hotel_room_pk primary key(hr_h_no, hr_date),
    constraint fk_hr_h_no foreign key(hr_h_no) references hotel(h_no) on delete cascade   
);

create table reservation(
	r_no number not null primary key,
	r_m_id varchar2(80) not null,
	r_h_no number not null,
	r_checkin date not null,
	r_checkout date not null,
	r_cancel varchar2(10) default 'N',
    r_room number not null,
	constraint fk_r_hno foreign key(r_h_no) references hotel(h_no) on delete cascade,
	constraint fk_r_mid foreign key(r_m_id) references member(m_id) on delete cascade
);

create table board (
	b_no number not null primary key,
	b_title varchar2(100) not null,
	b_content varchar2(2000),
	b_m_id varchar2(80) not null,
	b_regdate date,
	constraint fk_b_mid foreign key(b_m_id) references member(m_id) on delete cascade
);

create table comment_board (
	c_no number not null primary key,
	c_m_id varchar2(80) not null,
	c_content varchar2(2000),
	c_b_no number not null,
	c_regdate date,
	constraint fk_c_mid foreign key(c_m_id) references member(m_id) on delete cascade,
	constraint fk_c_bno foreign key(c_b_no) references board(b_no) on delete cascade
);

create table shopping_carts(
	s_no number not null primary key,
	s_h_no number not null,
	s_m_id varchar2(80) not null,
	s_checkin date,
	c_checkout date,
	constraint fk_s_hno foreign key(s_h_no) references hotel(h_no) on delete cascade,
	constraint fk_s_mid foreign key(s_m_id) references member(m_id) on delete cascade
);

create table price(
    p_no number not null primary key,
    p_r_no number not null,
    p_admin number,
    p_hostel number,
    p_room number not null,
    constraint fk_p_r_no foreign key(p_r_no) references reservation(r_no) on delete cascade
);

create table hotel_review (
    hre_no number not null primary key,
    hre_h_no not null,
    hre_m_id varchar2(80) not null,
    hre_comment varchar2(2000),
    hre_score number default 0,
    hre_date date,
    constraint fk_hre_hno foreign key(hre_h_no) references hotel(h_no) on delete cascade,
    constraint fk_hre_mid foreign key(hre_m_id) references member(m_id) on delete cascade
);

select * from shopping_carts;
select * from tab;

---------------------------------------------------------------------
-- ����
---------------------------------------------------------------------

-- *** Į�� �߰�, ���� �� Ŀ�� ����� ����! ***
commit;

-- ���̺� ����
drop table shopping_carts;
drop table comment_board;
drop table board;
drop table hotel_room;
drop table hotel_review;
drop table price;
drop table reservation;
drop table hotel;
drop table member;

-- ���̺� ��� ����
select * from tab;

-- �����Ⱚ ����
PURGE RECYCLEBIN;

-- ������ ����
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('admin', 'admin', '������', '010-0000-0000', 'admin@gmail.com', 'A');

-- ȸ��
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('hotel01', 'asdf', 'ȣ��01', '010-1111-1111', 'hotel01@gmail.com', 'H');
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('hotel02', 'asdf', 'ȣ��02', '010-2222-2222', 'hotel02@gmail.com', 'H');
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('hotel03', 'asdf', 'ȣ��03', '010-3333-3333', 'hotel03@gmail.com', 'H');
insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('hotel04', 'asdf', 'ȣ��04', '010-4444-4444', 'hotel04@gmail.com', 'H');

insert into member(m_id, m_password, m_name, m_tel, m_email, m_field) values ('user01', 'asdf', '�����01', '010-4444-4444', 'user01@gmail.com', 'U');

commit;

select * from member;

-- ȣ�� ������ ����
--  ����Ʈ -----------------------------------
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), '���̿�����Ʈ', '������ ������ ������ ���̿��� 424', '1588-7789'
 , 300000, 'N', 'hotel01', 'hotel_high1.jpg', '����Ʈ/�ܵ�'
 , '���� ������ �а� �����ο� ����, ��� �븮���� ���� ����� ������ ���� ���� ���׸�� ������ �ٸ� ������� �帳�ϴ�. �ϴû� ��õ(�߿�Ǯ), ��Ű���� �� �ְ��� �δ�ü��� ���� ����ƾ �ܵ����� �� ��ó�� ����� �޽��� ���� ���ʽÿ�.', 8);
 
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), 'õ�Ȼ�ϸ���Ʈ', '�泲 õ�Ƚ� ���Ÿ� ���ŷ� 576', '041-560-9114'
 , 136000, 'N', 'hotel02', 'hotel_sangnok.jpg', '����Ʈ/�ܵ�'
 , '�����ϰ� ����� �������� ���� ��ġ�� �����Դϴ�. ����Ȱ�뵵�� ����ϸ� ���Բ� ����԰� ��ſ��� ������ �帳�ϴ�.', 8);
 
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), '�Ե�����Ʈ�ο�', '�泲 �ο��� �Ծϸ� �������� 400', '041-939-1000'
 , 189000, 'N', 'hotel03', 'hotel_lotte.jpg', '����Ʈ/�ܵ�'
 , '������ �ź�ο� ������ �ο�, �Ե�����Ʈ�ο��� ������ ������ ���ǽİ� ���� ������ ������ ������ ǰ�� �ο��� �ڸ��� ���ο� ������ ���� ��ȭ �޾� ����Ʈ �Դϴ�. �Ե�����Ʈ�ο��� ���� ��ȭ Ž����� ����, �޽�, �̽İ� ����������� �� ���� ��� �� �ִ� ������ ���� ��ȭ �������� �����߽��ϴ�.', 8);
 
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), '�����غ�ġ����Ʈȣ��', '���� �������� ǥ���� �μ��ؾȷ� 537', '064-780-8100'
 , 310700, 'N', 'hotel02', 'hotel_haevichi.jpg', '����Ʈ/�ܵ�'
 , '��޽��� ���׸���� ����Ʈǳ�� �������� �������� ȣ�ڽ� �ܵ��̴Ͼ����� �ֺ��� ǥ�� �ؼ������ ������ Ǫ���ٴٸ� �Բ� �����Ҽ� �ִ³��� â�� ���ڴ� �׸��� ����ϰ� ��޽��� �ǳ� ������� ���� ���� �ü��� ���߰� �ִ�.32���� 189��, 49���� 24�� �� �� 215�Ƿ� �����Ǿ� ������,���� �߿� ������� �κ�����, �̵�, ���ϽĴ�, �ϳ�� �׸��� �뷡��� ������� ���Ǻδ�ü��� ����� �������� ���ӹ� �׸��� ���� �� ���� ���ǽü��� ���߰� �ִ�.', 8);
 
insert into hotel values( (select NVL(MAX(h_no)+1, 1) from hotel), '������Ʈ', '���� ��â�� ����ɸ� �ø��ȷ� 715', '033-335-5757'
 , 190000, 'N', 'hotel04', 'hotel_yongpyong.jpg', '����Ʈ/�ܵ�'
 , '���ѹα� ���� ��ȭ�� �������� ������Ʈ�� ������ �ǰ��� ������ȭ�� �����ϴ� ������� ���鿡�� ���� �޽��� �����Ͽ� ���� �ູ��ġ�� â���ϴ� ���� �濵�̳����� ��� �ֽ��ϴ�.', 5);
 
--  ��� -----------------------------------
insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '���������', '���� ��籺 ������ �α��� 28-29', '010-6616-7131'
 , 180000, 'N', 'hotel01', 'hotel_artinl.png', '���'
 , '���� ������ �а� �����ο� ����, ��� �븮���� ���� ����� ������ ���� ���� ���׸�� ������ �ٸ� ������� �帳�ϴ�. �ϴû� ��õ(�߿�Ǯ), ��Ű���� �� �ְ��� �δ�ü��� ���� ����ƾ �ܵ����� �� ��ó�� ����� �޽��� ���� ���ʽÿ�.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), 'L9Ǯ�������', '���� ������ �ϳ��� 333', '010-9119-7781'
 , 200000, 'N', 'hotel02', 'hotel_l9villa.png', '���'
 , '2�ν�, ������, ����, ħ���, �µ���, �����ٺ�ť, ��ä, ����, ��������, ����, �ٺ�ť��, ���, ����ü�, ��Ƽ, �ؼ�����, ������, ��Ű��, �ٴ尡, ���.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '�����', '���� ȫõ�� ���� ���߸����� 166', '010-9449-7781'
 , 300000, 'N', 'hotel03', 'hotel_melrose.png', '���'
 , '���� ������ �а� �����ο� ����, ��� �븮���� ���� ����� ������ ���� ���� ���׸�� ������ �ٸ� ������� �帳�ϴ�. �ϴû� ��õ(�߿�Ǯ), ��Ű���� �� �ְ��� �δ�ü��� ���� ����ƾ �ܵ����� �� ��ó�� ����� �޽��� ���� ���ʽÿ�.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '�ݴ뺰���', '���� ������ �ϳ��� 333', '010-6666-7781'
 , 200000, 'N', 'hotel04', 'hotel_banda.png', '���'
 , '��ü���뿡 ������ �ع�700m�� ��ġ�� ���� ���� ������ ���.', 8);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '�ĵ��Ҹ����', '���� ��ô�� ��ô�� 4246-30', '010-9119-7781'
 , 100000, 'N', 'hotel01', 'hotel_padosori.png', '���'
 , '������ ȫõ����, ��ߵ���ũ ���ǿ���, Ŀ�÷�,������, �ǳ��ٺ�ť ���� ���Ÿ��.', 8);
 
--  ȣ�� -----------------------------------
insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '���ǵ� �˽���ȣ��' , '���� �������� ��ȸ���76�� 16', '02-6670-7000'
 , 360000, 'N', 'hotel01', 'hotel_h_1.png', 'ȣ��'
 , '��ü 225���� ������ ������ �Ϻ� ���ǿ����� �Ѱ� ������ �����Ͻ� �� �ֽ��ϴ�. ��� ���ǿ����� 32��ġ TV, �����, ���� ���� �ֽ��ϴ�. ����, �̱���ťƼ�� ���ǿ� �����Ͻø� ���� �̴Ϲ�, �� ���� �̿��Ͻ� �� ������ �̱���ťƼ�� ������� ����Ͻ� �� �ֽ��ϴ�.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '���� �Ŷ�ȣ��', '����Ư����ġ�� �������� �߹�������72���� 75', '064-735-5114'
 , 450000, 'N', 'hotel01', 'hotel_h_2.png', 'ȣ��'
 , '�غ����� �����ٺ��̴� ������ ����� ������ ���� �Ŷ� ȣ���� �߹��������� �� �ڸ��ϰ� �־� �������Ĺ���, õ��������, ������ ������ ���� ���� ����� �Ÿ��� �ֽ��ϴ�. ����, ���ֱ��������� ���� 1�ð� 5�� �Ÿ��� ������ 1�� 3ȸ ȣ��-���� �� ���� ��Ʋ�� ��ϰ� �ֽ��ϴ�.ȣ�� ���� �����Ӱ� ��å�� ���⿡ ���� ���������� ������ ���� ������ �Ͻø� ķ�ΰ� �۷��ε� ���� �� �ֽ��ϴ�.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '�λ� �Ե�ȣ��', '�λ걤���� �λ����� ���ߴ�� 772', '051-810-1000'
 , 250000, 'N', 'hotel02', 'hotel_h_3.png', 'ȣ��'
 , '�Ե� ȣ�ڰ� �ø󽺿��� �������� ������ ���� ���� �������� �ؿ� ��Ʈ������ �ؿ� ħ�� ��Ʈ�� �̿��Ͻ� �� �ֽ��ϴ�. 190�� ���� �޴��� �ִ� �������� ������ �󼼴�, ǻ�� �߽Ĵ� ����, ������ �ѽĴ��� ����ȭ, �λ� ������ �ڶ��ϴ� �ϽĴ��� ���߸� �� ȣ�� �� �� 4���� ��������� �־� �پ��� ���̴� �ɼ��� ���� �� �ֽ��ϴ�.', 8);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '�Ķ���̽���Ƽ', '��õ������ �߱� �����ؾȳ���321���� 186', '1833-8855'
 , 250000, 'N', 'hotel02', 'hotel_h_4.png', 'ȣ��'
 , '99,825�� �Ը��� ������ ��ġ�� ���� ����Ʈ�� �Ķ���̽���Ƽ�� ī������, MICE��, �йи������� �����Ǿ� �ֽ��ϴ�. ȣ�� ������ ī�ٳ��� �ٰ� ������ �߿ܼ����� ���� ������ ������ ������ ������ �� �ִ� �ǳ� �����嵵 �ֽ��ϴ�.', 5);

insert into hotel values((select NVL(MAX(h_no)+1, 1) from hotel), '����Ʈ��������ȣ��', '������ ������ â�ط� 307', '033-660-9000'
 , 200000, 'N', 'hotel03', 'hotel_h_5.png', 'ȣ��'
 , '������ ������ ��ġ�� ����Ʈ��������ȣ���� ī�������� ��� �޾��� ����Ʈ�������� ������ �޾� ������ ȣ���Դϴ�. �����غ��� ��ġ�Ͽ� ���ؿ� ������� ������ ���ָ� ��å �ڽ��� ��� �� �ֽ��ϴ�. �ֺ� ��ҷδ� �����غ�, ��� �㳭���� ����, �ʴ絿 ���κ� ������ ���� 5�� �Ÿ��� ��ġ�� ������, �������� ���� 11��, �������� ���� 40���� �ҿ�˴ϴ�. ', 5);

--  �Խ�Ʈ�Ͽ콺 -----------------------------------
insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '�嵿�Խ�Ʈ�Ͽ콺��������', '���������� ����� ����15���� 63', '070-4158-3360'
 ,100000, 'N', 'hotel02', 'hotel_g_01.jpg', '�Խ�Ʈ�Ͽ콺'
 ,'�嵿 ���������������� ��ϰ� �ִ� �Խ�Ʈ�Ͽ콺�Դϴ�. ���� �ڿ��ӿ��� ����ϴ� �̵�� �Բ� �Ƹ��ٿ� �߾��� ��������', 5);

insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '�̳����� �Խ�Ʈ�Ͽ콺', '��û���� ���ֽ� ���ڹ�1�� 22-13', '010-8893-8381'
 ,30000, 'N', 'hotel02', 'hotel_g_02.jpg', '�Խ�Ʈ�Ͽ콺'
 ,'�ܵ������� �̿��Ͻ� �� ������ ���ý� ī������ε� �̿� �����մϴ�. ���꼺�� ���ɿո��� ������ �̵��� �� �ֽ��ϴ�.', 5);

insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '�����̳� �Խ�Ʈ�Ͽ콺', '�λ� �ؿ�뱸 �ؿ���570���� 55', '051-731-2120'
 ,200000, 'N', 'hotel01', 'hotel_g_03.jpg', '�Խ�Ʈ�Ͽ콺'
 ,'ã���ֽô� ���Ե��� ���� ���� ���� �� �ֵ��� ������ ���ϰ� �ֽ��ϴ�. ����, ��ȭ, ����, ��Ƽ�� ��� ���� �Խ�Ʈ�Ͽ콺�Դϴ�.', 5);

insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '�Ϸ� �Խ�Ʈ�Ͽ콺', '���� ���ʽ� ��ȷ� 19-1', '010-8407-6878'
 ,40000, 'N', 'hotel04', 'hotel_g_04.jpg', '�Խ�Ʈ�Ͽ콺'
 ,'�ϻ��� ��ǥ�� �� ������ ��⼼��. Ư�� ȣ�� ������ û���� �����ϰ� ������ ������ ����� �����ϰ� �ֽ��ϴ�.', 5);

insert into hotel values ((select NVL(MAX(h_no)+1, 1) from hotel), '���ä', '���� ���ֽ� �ϻ걸 ������ 94-5', '010-3166-9568'
 ,150000, 'N', 'hotel03', 'hotel_g_05.jpg', '�Խ�Ʈ�Ͽ콺'
 ,'���� �ѿ������� �ִ� �Խ�Ʈ�Ͽ콺�� ����ϰ� �ƴ��� ���ڸ��� ���� �� �帳�ϴ�. �ٸ� ���ھ��ҵ���� �޸� 1933�⿡ ������ ���� �ѿ� �Դϴ�. ���ä�� �����ø鼭 ������ ���� ������ ����� �����ϰ� ������.', 5);

commit;
-------------------------------------
