CREATE DATABASE Derco;

CREATE TABLE imports(
srno INT NOT NULL AUTO_INCREMENT,
eta_date DATE,
job INT,
impname VARCHAR(30),
shipper VARCHAR(20),
pks INT,
invoice_no VARCHAR(20),
comm VARCHAR(30),
be INT,
be_date DATE,
container_no VARCHAR(20),
phyto VARCHAR(30),
st_duty VARCHAR(30),
yield VARCHAR(30),
ship_rec VARCHAR(30),
cfs VARCHAR(30),
duty_rec VARCHAR(30),
pq_rec VARCHAR(30),
fssai_rec VARCHAR(30),
surv_rec VARCHAR(30),
o_rec VARCHAR(30),
rba_bill_a VARCHAR(30),
rba_bill_b VARCHAR(30),
job_status bool NOT NULL,
job_delayed bool NOT NULL,
PRIMARY KEY (srno)
);

-- ALTER TABLE imports
-- ADD COLUMN job_status bool,
-- ADD COLUMN job_delayed bool,
-- ADD COLUMN det1 VARCHAR(100),
-- ADD COLUMN det2 VARCHAR(100),
-- ADD COLUMN det3 VARCHAR(100),
-- ADD COLUMN det4 VARCHAR(100),
-- ADD COLUMN det5 VARCHAR(100),
-- ADD COLUMN det6 VARCHAR(100);

CREATE TABLE accounts(
acno INT NOT NULL AUTO_INCREMENT,
userid VARCHAR(20) NOT NULL,
pass VARCHAR(20) NOT NULL,
PRIMARY KEY (acno)
);

CREATE OR REPLACE VIEW importers AS SELECT DISTINCT impname from imports;
CREATE OR REPLACE VIEW pending AS SELECT * FROM imports where job_status = 0;
CREATE OR REPLACE VIEW delay AS SELECT * FROM imports where job_status = 0 and job_delayed = 1;
CREATE OR REPLACE VIEW completed AS SELECT * FROM imports where job_status = 1;

select * from imports;

INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (1, '1980-04-15', 7, 'voluptas', 'perspiciatis', 0, '', 'aliquid', NULL, '2009-12-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (2, '1972-09-24', 6, 'optio', 'natus', 0, '8', 'enim', NULL, '1994-09-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (3, '1994-03-17', 5, 'dolore', 'sint', 4, '5', 'consequatur', NULL, '2020-07-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (4, '1986-02-24', 5, 'eum', 'rerum', 1, '3', 'id', NULL, '1986-02-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (5, '1977-10-21', 8, 'voluptatum', 'aliquam', 9, '7', 'odio', NULL, '1993-03-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (6, '2002-08-07', 1, 'enim', 'dolore', 7, '2', 'quae', NULL, '1987-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (7, '1979-06-01', 4, 'minima', 'magnam', 2, '7', 'sit', NULL, '1971-06-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (8, '2001-01-09', 4, 'in', 'nesciunt', 3, '5', 'omnis', NULL, '2014-10-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (9, '2000-02-20', 1, 'quis', 'iusto', 5, '4', 'esse', NULL, '2005-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `imports` (`srno`, `eta_date`, `job`, `impname`, `shipper`, `pks`, `invoice_no`, `comm`, `be`, `be_date`, `container_no`, `phyto`, `st_duty`, `yield`, `ship_rec`, `cfs`, `duty_rec`, `pq_rec`, `fssai_rec`, `surv_rec`, `o_rec`, `rba_bill_a`, `rba_bill_b`, `job_status`, `job_delayed`) VALUES (10, '2020-05-26', 1, 'reprehenderit', 'mollitia', 3, '5', 'sunt', NULL, '2013-07-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);

