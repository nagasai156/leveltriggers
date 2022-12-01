--use the table customers from the sample database for the practice

--table CONTains costumer_id,name,address,website,credit_limit
CREATE OR REPLACE TRIGGER customers_credit_trg
    BEFORE UPDATE OF credit_limit  
    ON customers
DECLARE
    l_day_of_month NUMBER;
BEGIN
    -- determine the transaction type
    l_day_of_month := EXTRACT(DAY FROM sysdate);

    IF l_day_of_month BETWEEN 28 AND 31 THEN
        raise_application_error(-20100,'Cannot update customer credit from 28th to 31st');
    END IF;
END;

CREATE OR REPLACE TRIGGER customers_credit_trg
BEFORE UPDATE OF credit_limit  
    ON customers

DECLARE
    l_day_of_month NUMBER;

l_day_of_month := EXTRACT(DAY FROM sysdate);

IF l_day_of_month BETWEEN 28 AND 31 THEN
    raise_application_error(-20100,'Cannot update customer credit from 28th to 31st');
END IF;

UPDATE 
    customers 
SET 
    credit_limit = credit_limit * 110;
