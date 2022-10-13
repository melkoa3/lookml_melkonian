view: f_lineitems {
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  dimension: l_availqty {
    group_label: "03_Quantity"
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    group_label: "05_Other"
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey {
    group_label: "05_Other"
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
  }

  dimension: l_custkey {
    group_label: "05_Other"
    label: "CustomerKey"
    description: "foreign_key_for_customers"
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
  }

  dimension: l_discount {
    group_label: "02_Pricing and costs"
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: l_extendedprice {
    group_label: "02_Pricing and costs"
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_linenumber {
    group_label: "05_Other"
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    group_label: "01_Order Details"
    label: "OrderDate"
    description: "foreign_key_for_dates"
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
  }

  dimension: l_orderkey {
    group_label: "01_Order Details"
    type: number
    primary_key: yes
    sql: ${TABLE}."L_ORDERKEY" ;;
  }

  dimension: l_orderpriority {
    group_label: "01_Order Details"
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    group_label: "01_Order Details"
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    group_label: "05_Other"
    label: "PartKey"
    description: "foreign_key_for_parts"
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
  }

  dimension: l_quantity {
    group_label: "03_Quantity"
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    group_label: "05_Other"
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
  }

  dimension: l_returnflag {
    group_label: "01_Order Details"
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    group_label: "04_Shipment details"
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
  }

  dimension: l_shipinstruct {
    group_label: "04_Shipment details"
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    group_label: "04_Shipment details"
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    group_label: "04_Shipment details"
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    group_label: "05_Other"
    label: "SupplierKey"
    description: "foreign_key_for_suppliers"
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
  }

  dimension: l_supplycost {
    group_label: "02_Pricing and costs"
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  dimension: l_tax {
    group_label: "02_Pricing and costs"
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  dimension: l_totalprice {
    group_label: "02_Pricing and costs"
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: TotalSales{
    label: "Total Sales"
    type: sum
    description: "Total sales of ordered products (USD)"
    sql: ${l_extendedprice} ;; #value used in the sum function
    value_format_name: usd
  }

  measure: AverageSalesPrice{
    label: "Average Price (USD)"
    type: average
    description: "Average price of ordered products (USD)"
    sql: ${l_extendedprice} ;;
    value_format_name: usd
  }

  measure: CumulativeSales{
    label: "Cumulative Sales (USD)"
    type: running_total
    description: "Cumulative sales of ordered products (USD), equivalent to Running Total"
    sql: ${l_extendedprice} ;;
    value_format_name: usd
  }

  measure: TotalSales_Air {
    label: "Total Sales (USD) shipped by air"
    type: sum
    description: "Total sales of products shipped by air (USD)"
    sql: ${l_extendedprice} ;; #value used in the sum function
    filters: [l_shipmode: "AIR"]
    value_format_name: usd
  }

  measure: TotalSales_1911{
    label: "Total Sales (USD) - 1st January 1995"
    type: sum
    description: "Total sales of products ordered on the 1st January 1995 (USD)"
    sql: ${l_extendedprice} ;; #value used in the sum function
    filters: [l_orderdatekey: "1911"]
    value_format_name: usd
  }

  measure: TotalSalesPrice_Russia {
    label: "Total Sales of Russia"
    type: sum
    description: "Total sales to russian customers (USD)"
    sql: ${l_extendedprice} ;; #value used in the sum function
    filters: [d_customer.c_nation:"RUSSIA"]
    value_format_name: usd
  }
  measure: TotalGrossRevenue {
    label: "Total Gross Revenue (USD)"
    type: sum
    description: "Total price of completed sales (USD)"
    sql: ${l_extendedprice} ;;    #value used in the sum function
    filters: [l_orderstatus: "F"]  # assuming that "F" status is showing "Completed" orders"
    value_format_name: usd
  }
  measure: TotalCost {
    label: "Total Cost (USD)"
    type: sum
    description: "Total Cost of ordered items (USD)"
    sql: ${l_supplycost} ;;    #value used in the sum function
    value_format_name: usd
  }

  measure: GrossMargin {
    label: "Total Gross Margin Amount (USD)"
    type: number
    description: "Total Gross Margin Amount (USD) = Total Gross Revenue – Total Cost (USD)"
    sql: ${TotalGrossRevenue}-${TotalCost} ;;
    value_format_name: usd
  }

  measure: GrossMargin_percentage {
    label: "Total Gross Margin (%)"
    type: number
    description: "Total Gross Margin (%) = Total Gross Margin Amount / Total Gross Revenue"
    sql: ${GrossMargin}/NULLIF(${TotalGrossRevenue},0);; # error handling: if TotalGrossRevenue is 0 - we get null for this line
    value_format_name: percent_2
  }

  measure: ItemsReturned {
    label: "# Items Returned"
    type: sum
    description: "Number of items that were returned by dissatisfied customers"
    sql: ${l_quantity};;
    filters: [l_returnflag: "R"]
  }

  measure: TotalItemsSold{
    label: "# Total Items Sold"
    type: sum
    description: "Total Number of Items Sold  Number of items that were sold"
    sql: ${l_quantity};;
  }

  measure: TotalOrders_1911{
    label: "Total Orders - 1st January 1995"
    type: sum
    description: "Total number of Items ordered on the 1st January 1995"
    sql: ${l_quantity} ;; #value used in the sum function
    filters: [l_orderdatekey: "1911"]
  }

  measure: ReturnRate {
    label: "Items Return Rate"
    type: number
    description: "Item Return Rate = Number Of Items Returned / Total Number Of Items Sold"
    sql: ${ItemsReturned}/NULLIF(${TotalItemsSold},0);;
    value_format_name: percent_2
  }

  measure: CustomersCount {
    label: "# Customers"
    type: count_distinct
    description: "Number of Customers who made at least one purchase"
    sql: ${l_custkey};;
  }

  measure: AverageSpent_Customer{
    label: "Average Spend/Customer (USD)"
    type: number
    description: "Average Spend per Customer = Total Sales / Total Number of Customers"
    sql: ${TotalSales}/NULLIF(${CustomersCount},0);;
    value_format_name: percent_2
  }

















}
