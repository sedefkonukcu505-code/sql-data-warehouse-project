/*

=============================================================
Veritabanı ve Şemaları Oluşturma
=============================================================
Betik Amacı:
Bu betik, halihazırda var olup olmadığını kontrol ettikten sonra 'DataWarehouse' adında yeni bir veritabanı oluşturur.
Eğer veritabanı zaten varsa, silinir ve yeniden oluşturulur. Ek olarak betik,
veritabanı içerisinde üç adet şema yapılandırır: 'bronze', 'silver' ve 'gold'.

UYARI:
Bu betiği çalıştırmak, eğer mevcutsa 'DataWarehouse' veritabanının tamamını silecektir. Veritabanındaki tüm veriler kalıcı olarak silinecektir. İşleme dikkatle devam edin
ve bu betiği çalıştırmadan önce uygun yedeklere sahip olduğunuzdan emin olun.

*/

USE master ; 
GO

--Veri Ambarı veritabanını silin ve yeniden oluşturun
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse ;
GO

USE DataWarehouse ;
GO

CREATE SCHEMA bronze ;
GO 

CREATE SCHEMA silver ;
GO 

CREATE SCHEMA gold ;
GO
