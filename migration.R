# Connection
library(odbc)
library(DBI)

write_dsn_name <- "Snowflake"
write_database_name <- "DATA_LAKE__NCL"
write_schema_name <- "ANALYST_MANAGED"
write_table_name <- r"{"turnaround_times_clean_write_test"}"
schema_table_name_write <- paste(write_schema_name,write_table_name,sep = ".")
db_sch_tbl_name_write <- paste0(write_database_name,".",write_schema_name,".",write_table_name)

con_write <- dbConnect(odbc::odbc(),
                 dsn = write_dsn_name,
                 database = write_database_name,
                 TrustedConnection = TRUE)


read_dsn_name <- "SANDPIT"
read_database_name <- "Data_Lab_NCL_Dev"
read_schema_name <- "PeterS"
read_table_name <- r"{turnaround_times}"
schema_table_name_read <- paste(read_schema_name,read_table_name,sep = ".")
db_sch_tbl_name_read <- paste0(read_database_name,".",read_schema_name,".",read_table_name)

con_read <- dbConnect(odbc::odbc(),
                     dsn = read_dsn_name,
                     database = read_database_name,
                     TrustedConnection = TRUE)

select_query_read <- paste0("SELECT * FROM ", schema_table_name_read)

existing_data <- dbGetQuery(con_read, select_query_read)

batch_size <- nrow(existing_data)

# Users that may be more sensitive in one direction or another ( performance vs memory management ) retain 
# the ability to revert to prior behavior by setting the batch_rows parameter to be equal to the number of rows of the data.frame.

start_write <- Sys.time() # , batch_rows = batch_size
DBI::dbWriteTable(con_write, DBI::SQL(schema_table_name_write), existing_data, row.names=F, append = TRUE) # write to new main table
Sys.time() - start_write

# 9:35 start

# if works try wrangling new data and appending