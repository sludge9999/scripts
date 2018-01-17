    #include <p16f877a.inc>
    __config b'11110100011000'
    org 0x0000
    
    CLRF STATUS

    CLRF PORTB
    CLRF PORTD

    BANKSEL TRISB
    MOVLW 0XFF
    MOVWF TRISB

    BANKSEL TRISD
    MOVLW 0X00
    MOVWF TRISD

    BANKSEL OPTION_REG
    MOVLW 0X7F
    MOVWF OPTION_REG

    BANKSEL PORTD

CHECKB1
    BTFSC PORTB,RB0;SKIP IF ZERO
    GOTO  ENABLEPORTD
    GOTO  CHECKB1

ENABLEPORTD
    MOVLW 0XFF
    MOVWF PORTD
    GOTO  CHECKB2B3

CHECKB2B3
    BTFSS PORTB,RB1;SKIP IF SET, WORKS WHEN PORT IS PRESSED, BECAUSE PORT HAS INVERTED VALUE
    INCF  PORTD,1
    BTFSS PORTB,RB2;SKIP IF SET, WORKS WHEN PORT IS PRESSED, BECAUSE PORT HAS INVERTED VALUE
    DECF  PORTD,1
    GOTO CHECKB2B3

    end