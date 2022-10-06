view: f_lineitems {
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  dimension: l_availqty {
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey {
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
  }

  dimension: l_custkey {
    label: "CustomerKey"
    description: "foreign_key_for_customers"
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
  }

  dimension: l_discount {
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: l_extendedprice {
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_linenumber {
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    label: "OrderDate"
    description: "foreign_key_for_dates"
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
  }

  dimension: l_orderkey {
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
  }

  dimension: l_orderpriority {
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    label: "PartKey"
    description: "foreign_key_for_parts"
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
  }

  dimension: l_quantity {
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
  }

  dimension: l_returnflag {
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
  }

  dimension: l_shipinstruct {
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    label: "SupplierKey"
    description: "foreign_key_for_suppliers"
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
  }

  dimension: l_supplycost {
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  dimension: l_tax {
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  dimension: l_totalprice {
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
  measure: TotalSalesPrice_Russia {
    label: "Total Sales of Russia"
    type: sum
    description: "Total sales to russian customers (USD)"
    sql: ${l_extendedprice} ;; #value used in the sum function
    filters: [l_shipmode: "AIR"]
    value_format_name: usd
  }































}
