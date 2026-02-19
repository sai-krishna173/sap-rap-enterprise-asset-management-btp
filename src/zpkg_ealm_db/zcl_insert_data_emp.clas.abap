CLASS zcl_insert_data_emp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_emp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  daTA : lt_data tyPE stANDARD TABLE OF zealm_employee.

  lt_data = value #( ( emp_id = 'EMP01' emp_name = 'SAI' e_mail = 'sai@gmail.com' role = 'Technision' )
                     ( emp_id = 'EMP02' emp_name = 'Krishna' e_mail = 'krishna@gmail.com' role = 'Exceutive' )
                     ( emp_id = 'EMP03' emp_name = 'Rama' e_mail = 'Rama@gmail.com' role = 'Technision' )
                     ( emp_id = 'EMP04' emp_name = 'Kumar' e_mail = 'Kumar@gmail.com' role = 'maintenance' ) ).

  modify zealm_employee from table @lt_data.


  ENDMETHOD.
ENDCLASS.
