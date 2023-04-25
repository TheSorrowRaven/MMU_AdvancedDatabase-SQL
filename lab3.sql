/* 3 */

CREATE OR REPLACE FUNCTION set_discount() RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
	IF NEW.FEE >= 3500
	THEN
    	NEW.DISCOUNT := NEW.FEE * 0.1;
    ELSE
		NEW.DISCOUNT := 0;
    END IF;
	RETURN NEW;
END; $$

CREATE OR REPLACE TRIGGER DISCOUNT_TRIGGER
BEFORE INSERT OR UPDATE
ON ENGAGEMENT
FOR EACH ROW
EXECUTE PROCEDURE set_discount();

SELECT * FROM ENGAGEMENT;

UPDATE ENGAGEMENT
SET FEE = FEE
WHERE FEE = FEE;

/* 4 */
create or replace view Fee_Charged_View as
select engagement_id, description, client_name, (e.fee - e.discount) as Fee_Charged
from engagement e
join event v on e.event_id = v.event_id
join client c on e.client_id = c.client_id

select * from Fee_Charged_View;

/* 5 */
insert into engagement 
values ('G0010', '2015/7/12', 14, '2015/8/30', 4, 50, 'Le Meridien KL', '1007890', 'E005', 'C1001', 3800, NULL);

/* 6 */
update engagement 
set fee = 3200
where engagement_id = 'G0003';
select * from engagement 
where engagement_id = 'G0003';

/* 7 */
alter table eventmanager
add column status char(6) check (status in ('Junior', 'Senior'));

select * from eventmanager;

/* 8 */
create or replace procedure set_senior_state_limit(engagements_done integer)
language plpgsql
as $$
begin
	update eventmanager
	set status = 'Senior'
	where staff_id in
	(
		select e.staff_id from eventmanager e
		join engagement g on g.staff_id = e.staff_id
		group by (e.staff_id)
		having COUNT(e.staff_id) >= engagements_done
	);
	update eventmanager
	set status = 'Junior'
	where staff_id in
	(
		select e.staff_id from eventmanager e
		join engagement g on g.staff_id = e.staff_id
		group by (e.staff_id)
		having COUNT(e.staff_id) < engagements_done
	);
end; $$;

/* 9 */
call set_senior_state_limit(2); 

select * from eventmanager e
join engagement g on g.staff_id = e.staff_id;

select * from eventmanager;

/* 11 */
create or replace function get_client_engagement_details()
returns table(
	client_name varchar(25),
	number_of_engagement integer,
	max_fee_charged numeric(7,2),
	min_fee_charged numeric(7,2)
)
language plpgsql
as $$
begin
	return QUERY
	select c.client_name, COUNT(e.engagement_id)::integer as number_of_engagement, MAX(e.fee - e.discount) as max_fee_charged, MIN(e.fee - e.discount) as min_fee_charged from engagement e 
	join client c on c.client_id = e.client_id
	group by c.client_id;
end; $$;

select * from get_client_engagement_details();

select * from engagement e
join client c on c.client_id = e.client_id;


/* ADDITIONAL (Logging) */
CREATE TABLE client_log (entry_time timestamp, op char(1), user_id varchar(20), entry client);

CREATE or REPLACE FUNCTION fclient_log() RETURNS trigger LANGUAGE plpgsql AS
$$
BEGIN
 IF (TG_OP = 'DELETE') THEN
   INSERT INTO client_log(entry_time, op, user_id, entry) VALUES (now(), 'D', user, OLD);
 ELSIF (TG_OP = 'UPDATE') THEN
   IF NEW <> OLD THEN
    INSERT INTO client_log(entry_time, op, user_id, entry) VALUES (now(), 'U', user, OLD);
   END IF;
 ELSIF (TG_OP = 'INSERT') THEN
   INSERT INTO client_log(entry_time, op, user_id, entry) VALUES (now(), 'I', user, NEW); 
 END IF;
RETURN NULL;
END;
$$;

CREATE TRIGGER trclient_log
  AFTER INSERT OR UPDATE OR DELETE ON client
  FOR EACH ROW
  EXECUTE PROCEDURE fclient_log();
 
select * from client;
select * from client_log;

alter table client
add column phone varchar(12);

INSERT INTO Client VALUES( 'C2001', 'White Doggie', 'Ron Pang', 'Pang@mmu.edu.my', '03-85423457' );
INSERT INTO Client VALUES( 'C2003', 'Sudirman', 'Hoo Pang Ron', 'Ron@mmu.edu.my', '03-83123457' );
UPDATE Client SET contact_person = 'Black Kittie', phone = '010245768' WHERE client_id = 'C2001';
DELETE FROM Client WHERE client_id = 'C2003';







