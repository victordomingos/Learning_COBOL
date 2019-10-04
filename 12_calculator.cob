      ******************************************************************
      * Author: Victor Domingos
      * Date:   2019-09-17
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATOR.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       77  menu-input pic x(1) value space.
       77  N1 PIC S9(22)V99.
       77  N2 PIC S9(22)V99.
       77  NT PIC S9(22)V99.
       77  MASK PIC -Z(18)9.99.
       77  ESTADO  PIC 9.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           INICIO.
           MOVE 0 TO ESTADO.
           DISPLAY SPACE ERASE EOS.

           DISPLAY " ---------------------------- " AT 0625
           DISPLAY "|                            |" AT 0725
           DISPLAY "|                            |" AT 0825
           DISPLAY "|                            |" AT 0925
           DISPLAY " ---------------------------- " AT 1025

           ACCEPT MASK AT 0926.
               MOVE MASK TO N1.
               DISPLAY MASK AT 0728.
               DISPLAY "                            " AT 0926.
           IF N1=0 THEN
               GO TO INICIO
           END-IF.


           OPCAO.
           PERFORM MENU-PROCEDURE.
           IF ESTADO = 1
               PERFORM MOVEUP-PROCEDURE
           END-IF.

           ACCEPT menu-input AT 0926.

           EVALUATE menu-input
               WHEN "S"
                   GO TO SAIDA
               WHEN "s"
                   GO TO SAIDA
               WHEN "C"
                   PERFORM CLEAR-SCREEN-PROCEDURE
               WHEN "c"
                   PERFORM CLEAR-SCREEN-PROCEDURE
           END-EVALUATE.


           DISPLAY menu-input at 0826.


           INICIO2.
           PERFORM CLEAR-MENU-PROCEDURE.
           ACCEPT MASK AT 0926.
               MOVE MASK TO N2.
               DISPLAY MASK AT 0828.
               DISPLAY "                            " AT 0926.
           IF N2=0 THEN
               GO TO INICIO2
           END-IF.



           EVALUATE menu-input
               WHEN "S"
                   GO TO SAIDA
               WHEN "s"
                   GO TO SAIDA
               WHEN "C"
                   PERFORM CLEAR-SCREEN-PROCEDURE
               WHEN "c"
                   PERFORM CLEAR-SCREEN-PROCEDURE
               WHEN "+"
                   PERFORM COMPUTE-PROCEDURE
               WHEN "-"
                   PERFORM COMPUTE-PROCEDURE
               WHEN "/"
                   PERFORM COMPUTE-PROCEDURE
               WHEN "*"
                   PERFORM COMPUTE-PROCEDURE
               WHEN OTHER
                   go to OPCAO
           END-EVALUATE.



           SAIDA.
           DISPLAY SPACE ERASE EOS.
           DISPLAY "Bye!" AT 1108
           ACCEPT menu-input AT 1208
           STOP RUN.



       COMPUTE-PROCEDURE.
           MOVE 1 TO ESTADO.
           EVALUATE menu-input
               WHEN "+"
                   ADD N1 N2 GIVING NT
                   MOVE NT TO MASK
                   DISPLAY MASK AT 0928
               WHEN "-"
                   SUBTRACT N2 FROM N1 GIVING NT
                   MOVE NT TO MASK
                   DISPLAY MASK AT 0928
               WHEN "/"
                   COMPUTE NT = (N1/N2)
                   MOVE NT TO MASK
                   DISPLAY MASK AT 0928
               WHEN "*"
                   MULTIPLY N1 BY N2 GIVING NT
                   MOVE NT TO MASK
                   DISPLAY MASK AT 0928
           END-EVALUATE.

           GO TO OPCAO.
           STOP RUN.



       CLEAR-SCREEN-PROCEDURE.
           GO TO INICIO.


       MOVEUP-PROCEDURE.
           DISPLAY "                          " AT 0728.
           DISPLAY "                          " AT 0828.
           DISPLAY "                            " AT 0926.

           MOVE N2 TO MASK.
           DISPLAY MASK AT 0728.

           MOVE NT TO N1.
           MOVE NT TO MASK.
           DISPLAY MASK AT 0828.


       DEBUG-PROCEDURE.
           DISPLAY "                               " AT 1400.
           DISPLAY "                               " AT 1500.
           DISPLAY "                               " AT 1600.
           DISPLAY "                               " AT 1700.
           DISPLAY "                               " AT 1800.
           DISPLAY N1 AT 1400.
           DISPLAY N2 AT 1500.
           DISPLAY NT AT 1600.
           DISPLAY MASK AT 1700.
           DISPLAY ESTADO AT 1800.


       MENU-PROCEDURE.
           DISPLAY "Selecionar operador:" AT 1227.
           DISPLAY "+ ---> SOMAR" AT 1330.
           DISPLAY "- ---> SUBTRAIR" AT 1330.
           DISPLAY "/ ---> DIVIDIR" AT 1430.
           DISPLAY "* ---> MULTIPLICAR" AT 1530.
           DISPLAY "C ---> LIMPAR" AT 1630.
           DISPLAY "S ---> SAIR" AT 1730.

       CLEAR-MENU-PROCEDURE.
           DISPLAY "                    " AT 1227.
           DISPLAY "                    " AT 1330.
           DISPLAY "                    " AT 1330.
           DISPLAY "                    " AT 1430.
           DISPLAY "                    " AT 1530.
           DISPLAY "                    " AT 1630.
           DISPLAY "                    " AT 1730.
       END PROGRAM CALCULATOR.
