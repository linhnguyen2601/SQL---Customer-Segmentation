-- 1. Tạo bảng trong PostgreSQL
create table SALES_DATASET_RFM_PRJ
(
  ordernumber INTEGER,
  quantityordered INTEGER,
  priceeach        FLOAT,
  orderlinenumber  INTEGER,
  sales            FLOAT,
  orderdate        DATE,
  status           VARCHAR,
  productline      VARCHAR,
  msrp             INTEGER,
  productcode      VARCHAR,
  customername     VARCHAR,
  phone            VARCHAR,
  addressline1     VARCHAR,
  addressline2     VARCHAR,
  city             VARCHAR,
  state            VARCHAR,
  postalcode       VARCHAR,
  country          VARCHAR,
  territory        VARCHAR,
  contactfullname  VARCHAR,
  dealsize         VARCHAR
) 
-- 2. Check null, blank, duplicate, xử lý outliers. Lưu bảng mới:
	
CREATE TABLE sales_dataset_rfm_clean as 
	
with cte as
	(
select *,
(select avg(quantityordered) from sales_dataset_rfm_prj),
(select stddev(quantityordered) from sales_dataset_rfm_prj)
from sales_dataset_rfm_prj)

select * from cte
where abs((quantityordered - avg)/stddev) <= 3

-- 3. EDA
-- Q1: Doanh thu theo từng ProductLine, Yearh và DealSize? Output: PRODUCTLINE, YEAR_ID, DEALSIZE, REVENUE
	
-- Q2: Đâu là tháng có bán tốt nhất mỗi năm? Output: MONTH_ID, REVENUE, ORDER_NUMBER
	
-- Q3: Product line nào được bán nhiều ở tháng 11? Output: MONTH_ID, REVENUE, ORDER_NUMBER
	
-- Q4: Đâu là sản phẩm có doanh thu tốt nhất ở UK mỗi năm? Xếp hạng doanh thu đó theo từng năm. Output: YEAR_ID, PRODUCTLINE,REVENUE, RANK

-- Q5: Ai là khách hàng tốt nhất, phân tích dựa vào RFM 
(sử dụng lại bảng customer_segment ở buổi học 23)

