connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"

datagroup: lookml_melkonian_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lookml_melkonian_default_datagroup

explore: f_lineitems {
  label: "Order Analytics"
  view_label: "0_Ordered_Items"
  always_filter: {
    filters: [d_dates.year: "1995"] # filter added to limit the whole model to only show the year 1995
  }

  join:  d_part {
        view_label: "1_Parts details"
        type: left_outer
        sql_on: ${f_lineitems.l_partkey}=${d_part.p_partkey} ;;
        relationship: many_to_one
  }
  join:  d_customer {
    view_label: "2_Customers Details"
    type: left_outer
    sql_on: ${f_lineitems.l_custkey}=${d_customer.c_custkey};;
    relationship: many_to_one
}
  join: d_supplier {
    view_label: "3_Suppliers Details"
    type: left_outer
    sql_on: ${f_lineitems.l_suppkey}=${d_supplier.s_suppkey} ;;
    relationship: many_to_one
  }
  join: d_dates {
    view_label: "4_Order Dates"
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey}=${d_dates.datekey} ;;
    relationship: many_to_one
  }
        }


# QUESTIONS:
#1) Can we order views in explorer in specific order?
#.  Now its alphabetical, but might be nice to have it based on frequency of usage or importance of the view?
