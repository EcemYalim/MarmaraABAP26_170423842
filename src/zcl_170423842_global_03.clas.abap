CLASS zcl_170423842_global_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_170423842_global_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    " Değişkenleri tanımlıyoruz
    DATA: carrier_id    TYPE /dmo/carrier_id,
          connection_id TYPE /dmo/connection_id,
          status        TYPE i,
          flight_date   TYPE dats.

    " Örnek nesne oluşturma (Artık status ve tarih istiyor)
    TRY.
        connection = NEW #( i_carrier_id    = 'IH'
                            i_connection_id = '0400'
                            i_status        = 1
                            i_flight_date   = '20260309' ).
        APPEND connection TO connections.
      CATCH cx_ABAP_INVALID_VALUE.
        out->write( 'Method call failed' ).
    ENDTRY.

    " Listeleme kısmı
    LOOP AT connections INTO connection.
      connection->get_attributes(
          IMPORTING
              e_carrier_id    = carrier_id
              e_connection_id = connection_id
              e_status        = status
              e_flight_date   = flight_date
      ).
      out->write( |Flight: { carrier_id } { connection_id }, Status: { status }, Date: { flight_date }| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
