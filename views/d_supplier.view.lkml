view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER"
    ;;

  dimension: s_acctbal {
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }

  dimension: s_address {
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
  }

  dimension: s_name {
    type: string
    sql: ${TABLE}."S_NAME" ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
    html: <b><center><font size="2" color="#173589" >{{value}}</font></center></b> ;;
  }

  dimension: s_nation {
    type: string
    sql: ${TABLE}."S_NATION" ;;
  }

  dimension: s_phone {
    type: string
    sql: ${TABLE}."S_PHONE" ;;
  }

  dimension: s_region {
    type: string
    sql: ${TABLE}."S_REGION" ;;
  }

  dimension: s_suppkey {
    primary_key: yes
    label: "SupplierKey"
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
  }

dimension: Supplier_Cohort{
    label: "Cohort of Suppliers"
    description: "Cohort of Suppliers, split based on the account Balance [<0;1—3000;3001—5000;5001—7000;7000<..]"
    type: tier
    style: integer
    tiers: [1,3001,5001,7001]
    sql: ${s_acctbal} ;;
}

  measure: count {
    type: count
    drill_fields: [s_name]
  }
}
