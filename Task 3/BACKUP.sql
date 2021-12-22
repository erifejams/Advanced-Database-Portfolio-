drop table sales;
drop table customers;
drop table shops;
drop table sales_audit;

create table shops
( shop_id int,
name varchar2(20),
address varchar2(100),
country varchar2(20)
);

create table customers
( cust_id int,
name varchar2(100),
signup date,
creditlimit int,
vip varchar2(1),
shop_id int
);

create table sales
( sales_id int,
cust_id int,
tstamp timestamp,
amount number(10,2),
prod_id int
);

create table sales_audit
( sales_id int,
sale_amount number(10, 2),
username varchar2(50)
);



insert /*+ APPEND */ into shops
select rownum, 'shop'||rownum, 'address'||rownum , 'IRELAND'
from dual
connect by level <= 50;

insert /*+ APPEND */ into customers
select rownum, 'cust'||rownum, sysdate-720+mod(rownum,500), dbms_random.value(1,1000),
case when mod(rownum,10)=0 then 'Y' else 'N' end, mod(rownum,50)+1
from dual
connect by level <= 1000;

insert /*+ APPEND */ into sales
select rownum, 1+mod(rownum,100), sysdate-720+rownum/(5000/720), rownum/1000, mod(rownum,100)
from dual
connect by level <= 50000;

-- QUESTION 2
CREATE OR REPLACE TRIGGER customer_credit_limit_trg 
    BEFORE INSERT 
    ON customers 
    FOR EACH ROW 
    DECLARE 
        credit_limit integer;
        vip_trg varchar2(1);
BEGIN 
    vip_trg := :NEW.vip;
    credit_limit := :NEW.creditlimit;
    
    IF (credit_limit > 500 AND vip_trg = 'N') THEN 
        raise_application_error(-20090,'this customer is not a vip, so they cannot have a credit limit of more than 500'); 
    END IF; 
    IF (credit_limit > 1000 AND vip_trg = 'Y') THEN 
        raise_application_error(-20000,'this customer is a vip, so they cannot have a credit limit of more than 1000'); 
    END IF;
END; 
/

INSERT INTO customers VALUES (51, 'cust51', TO_DATE('12-JAN-20','DD.MM.YY'), 600, 'N',60);
INSERT INTO customers VALUES (52, 'cust52', TO_DATE('15-JAN-20','DD.MM.YY'), 1500, 'Y',61);
SELECT * FROM customers;


-- QUESTION 3
CREATE OR REPLACE TRIGGER no_update_createdShops_trg
    BEFORE UPDATE OF country
    ON shops
    FOR EACH ROW
    DECLARE ShopID INTEGER;
BEGIN
    ShopID := :new.shop_id;
    IF ShopID IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20000, 'cannot update the country, shop aleady exist');
    END IF;
END;
/

UPDATE shops SET country = 'FRANCE' WHERE shop_id = 2;
SELECT * FROM shops


-- QUESTION 4
CREATE OR REPLACE TRIGGER sales_customer_trg
   BEFORE DELETE
   ON sales
   FOR EACH ROW
    DECLARE amountOfSales number(10,2);
BEGIN 
    amountOfSales := :OLD.amount;
    IF amountOfSales > 0.00 THEN 
        RAISE_APPLICATION_ERROR(-20000, 'This customer already contributed to sales, so cannot delete');
    END IF;
END;
/

DELETE FROM sales WHERE amount = 0.03;
DELETE FROM sales WHERE amount = 0.00;

SELECT * FROM sales;


-- QUESTION 5
CREATE OR REPLACE TRIGGER sales_username_trg
    AFTER INSERT
    ON sales_audit
    FOR EACH ROW
    DECLARE usernamePerson varchar2(50);
BEGIN 
    select user FROM dual INTO usernamePerson;
    INSERT INTO sales_audit(sales_id, sale_amount, username) VALUES (NEW.sales_id, NEW.sale_amount, usernamePerson);
    --IF usernamePerson IS NULL THEN 
    --RAISE_APPLICATION_ERROR(-20000, 'your username is empty');
    --END IF;
END;
/

INSERT INTO sales_audit(sales_id, sale_amount, username) VALUES (6, 0.01, 'erife');

SELECT * FROM sales_audit;



-- QUESTION 6
CREATE OR REPLACE TRIGGER nosales_afterTime_trg
    BEFORE UPDATE OF name
    ON customers
    DECLARE time_Of_Day NUMBER;
BEGIN 
    time_Of_Day := EXTRACT(HOUR FROM systimestamp);
    IF time_Of_Day NOT BETWEEN 23 AND 24 THEN 
        RAISE_APPLICATION_ERROR(-20000, 'cannot update customer name, unless it is  11pm to midnight');
    END IF;
END;
/

UPDATE customers SET name = 'bella' where cust_id = 4

SELECT * FROM customers;


commit;