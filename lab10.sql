CREATE TABLE tblob(name text, image oid);

INSERT INTO tblob VALUES('my_image',lo_import('D:\MMU\advanced-database-lab\image.png'));

select lo_export(tblob.image, 'D:\MMU\advanced-database-lab\image_copy.png') from tblob;

CREATE TABLE tbytea(name text, image bytea);

CREATE OR REPLACE FUNCTION bytea_import(p_path text, p_result out bytea) 
language plpgsql as $$
declare
  l_oid oid;
begin
  select lo_import(p_path) into l_oid;
  select lo_get(l_oid) INTO p_result;
  perform lo_unlink(l_oid);
end;$$;
INSERT INTO tbytea VALUES('my_image',bytea_import('D:\MMU\advanced-database-lab\image.png'));
select name, image from tbytea;