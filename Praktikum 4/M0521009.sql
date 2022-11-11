--
-- DOWN - abaikan jika errornya "does not exist" atau sejenisnya
--

USE [PERPUSTAKAAN_NEW]; -- Masukkan nama database di sini

ALTER ROLE [db_owner] DROP MEMBER [cliffe];
ALTER ROLE [r_bookmgr] DROP MEMBER [minh];
ALTER ROLE [r_librarymgr] DROP MEMBER [gabe];
ALTER ROLE [r_loanmgr] DROP MEMBER [dave];
ALTER ROLE [r_loanmgr] DROP MEMBER [chris];

DROP ROLE [r_bookmgr];
DROP ROLE [r_librarymgr];
DROP ROLE [r_loanmgr];

DROP USER [cliffe];
DROP USER [minh];
DROP USER [gabe];
DROP USER [dave];
DROP USER [chris];

USE [master];

DROP LOGIN [perpustakaan_cliffe];
DROP LOGIN [perpustakaan_minh];
DROP LOGIN [perpustakaan_gabe];
DROP LOGIN [perpustakaan_dave];
DROP LOGIN [perpustakaan_chris];

--
-- UP -- kerjakan di sini
--

USE [master];

-- Setup login di sini
CREATE LOGIN [perpustakaan_cliffe] WITH PASSWORD = 'c6eif',
DEFAULT_DATABASE = [PERPUSTAKAAN_NEW],
CHECK_POLICY = OFF,
CHECK_EXPIRATION = OFF; 

CREATE LOGIN [perpustakaan_minh] WITH PASSWORD = 'm4hin',
DEFAULT_DATABASE = [PERPUSTAKAAN_NEW],
CHECK_POLICY = OFF,
CHECK_EXPIRATION = OFF; 

CREATE LOGIN [perpustakaan_gabe] WITH PASSWORD = 'g4eab',
DEFAULT_DATABASE = [PERPUSTAKAAN_NEW],
CHECK_POLICY = OFF,
CHECK_EXPIRATION = OFF;

CREATE LOGIN [perpustakaan_dave] WITH PASSWORD = 'd4eav',
DEFAULT_DATABASE = [PERPUSTAKAAN_NEW],
CHECK_POLICY = OFF,
CHECK_EXPIRATION = OFF;

CREATE LOGIN [perpustakaan_chris] WITH PASSWORD = 'c4sr',
DEFAULT_DATABASE = [PERPUSTAKAAN_NEW],
CHECK_POLICY = OFF,
CHECK_EXPIRATION = OFF;

USE [PERPUSTAKAAN_NEW]; -- Masukkan nama database di sini

-- Setup user, permission, dan role di sini
CREATE USER [cliffe] FOR LOGIN [perpustakaan_cliffe];
CREATE USER [minh] FOR LOGIN [perpustakaan_minh];
CREATE USER [gabe] FOR LOGIN [perpustakaan_gabe];
CREATE USER [dave] FOR LOGIN [perpustakaan_dave];
CREATE USER [chris] FOR LOGIN [perpustakaan_chris];

CREATE ROLE [r_bookmgr];
CREATE ROLE [r_librarymgr];
CREATE ROLE [r_loanmgr];

GRANT SELECT, INSERT, UPDATE, DELETE 
ON [BOOK] TO [r_bookmgr]

GRANT SELECT, INSERT, UPDATE, DELETE 
ON [dbo].[BOOK_AUTHORS] TO [r_bookmgr]

GRANT SELECT, INSERT, UPDATE, DELETE 
ON [PUBLISHER] TO [r_bookmgr]

GRANT SELECT, INSERT, UPDATE, DELETE 
ON [LIBRARY_BRANCH] TO [r_librarymgr]

GRANT SELECT, INSERT, UPDATE, DELETE 
ON [BOOK_COPIES] TO [r_librarymgr]

GRANT SELECT 
ON [BOOK] TO [r_librarymgr]

GRANT SELECT, INSERT, UPDATE, DELETE 
ON [BORROWER] TO [r_loanmgr]

GRANT SELECT, INSERT, UPDATE, DELETE 
ON [BOOK_LOANS] TO [r_loanmgr]

GRANT SELECT 
ON [BOOK] TO [r_loanmgr]

GRANT SELECT 
ON [LIBRARY_BRANCH] TO [r_loanmgr]

GRANT SELECT 
ON [BOOK_COPIES] TO [r_loanmgr]

ALTER ROLE [db_owner]
ADD MEMBER [cliffe];

ALTER ROLE [r_librarymgr]  
ADD MEMBER [gabe];

ALTER ROLE [r_bookmgr] 
ADD MEMBER [minh];

ALTER ROLE [r_loanmgr] 
ADD MEMBER [dave];

ALTER ROLE r_loanmgr  
ADD MEMBER [chris];