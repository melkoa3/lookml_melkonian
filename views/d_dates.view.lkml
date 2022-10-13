view: d_dates {
  label: "date_dim"
  view_label: "date_dim"
  sql_table_name: "DATA_MART"."D_DATES" ;;

  dimension_group: value {
    label: "Date_group"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
  }

  dimension: date_val {
    label: "date"
    type: date
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
  }

  dimension: datekey {
    label: "date_key"
    primary_key:  yes
    type: number
    sql: ${TABLE}."DATEKEY" ;;
  }

  dimension: day_of_week {
    label: "date_day_of_week"
    type: number
    sql: ${TABLE}."DAY_OF_WEEK" ;;
  }

  dimension: dayname_of_week {
    label: "date_dayname_of_week"
    type: string
    sql: ${TABLE}."DAYNAME_OF_WEEK" ;;
  }

  dimension: month_name {
    label: "date_month_name"
    type: string
    sql: ${TABLE}."MONTH_NAME" ;;
  }

  dimension: month_num {
    label: "date_month_num"
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: quarter {
    label: "date_quarter"
    type: number
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: year {
    label: "date_year"
    type: number
    sql: ${TABLE}."YEAR" ;;
  }
}
