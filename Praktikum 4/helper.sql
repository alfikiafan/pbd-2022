-- Perintah untuk menampilkan list login
SELECT
  sp.name AS login,
  sp.type_desc AS login_type,
  CASE
    WHEN sp.is_disabled = 1 THEN 'Disabled'
    ELSE 'Enabled'
  END AS status,
  sl.password_hash,
  sp.create_date,
  sp.modify_date
FROM sys.server_principals sp
LEFT JOIN sys.sql_logins sl
  ON sp.principal_id = sl.principal_id
WHERE sp.type NOT IN ('G', 'R')
ORDER BY create_date DESC;

-- Perintah untuk menampilkan list user
SELECT name FROM sys.database_principals WHERE
type_desc = 'SQL_USER' AND default_schema_name = 'dbo';

-- Perintah untuk menampilkan list role
SELECT name FROM sys.database_principals WHERE
type_desc = 'DATABASE_ROLE';

-- Perintah untuk menampilkan list user tiap role
SELECT
  r.name role_name,
  m.name member_name
FROM sys.database_principals r
INNER JOIN sys.database_role_members rm ON rm.role_principal_id = r.principal_id
INNER JOIN sys.database_principals m ON m.principal_id = rm.member_principal_id;

-- Perintah untuk menampilkan list permission
SELECT
    class_desc
  , CASE WHEN class = 0 THEN DB_NAME()
         WHEN class = 1 THEN OBJECT_NAME(major_id)
         WHEN class = 3 THEN SCHEMA_NAME(major_id) END [Securable]
  , USER_NAME(grantee_principal_id) [User]
  , permission_name
  , state_desc
FROM sys.database_permissions;
