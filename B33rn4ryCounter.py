#!/usr/bin/python


import RPi.GPIO as GPIO
import serial
import time
import datetime
import os, syslog, io
import ConfigParser
import B33rn4ryDatabase, B33rn4ryExceptions, B33rn4ryReader

# Define GPIO mapping
LCD_RS = 25
LCD_E  = 24
LCD_D4 = 23
LCD_D5 = 17
LCD_D6 = 27
LCD_D7 = 22
LCD_LIGHT =  4
VALVE = 6         #vormals 7
FLOWSENSOR = 5    #vormals 8
 
# Define some device constants
LCD_WIDTH = 20    # Maximum characters per line
LCD_CHR = True
LCD_CMD = False
 
LCD_LINE_1 = 0x80 # LCD RAM address for the 1st line
LCD_LINE_2 = 0xC0 # LCD RAM address for the 2nd line
LCD_LINE_3 = 0x94 # LCD RAM address for the 3rd line
LCD_LINE_4 = 0xD4 # LCD RAM address for the 4th line
 
# Timing constants
E_PULSE = 0.0005
E_DELAY = 0.0005

# RFID start and end flags
RFID_START = "\x04"
RFID_END = "\x02"


class beerKeg:
  __pulses__ = 0

  def __init__(self):
    self.__pulses__ = 0

  def setPulses(self, pulses):
    self.__pulses__ = pulses

  # just to handle the "channel"-argument given by callback-function
  def newPulse(self, *args):
    if len(args) == 0:
      self.__pulses__ += 1
    else:
      self.__pulses__ += 1
    print self.getPulses()

  def getPulses(self):
    return self.__pulses__

def main():
  # Main program block

  IDtmp = ""
  IdPulsesStart = None
  currentEvent = None
  kegID = None
  oldKegID = kegID

  currentKeg = beerKeg()

  GPIO.setmode(GPIO.BCM)       # Use BCM GPIO numbers
  GPIO.setup(FLOWSENSOR, GPIO.IN)
  GPIO.add_event_detect(FLOWSENSOR, GPIO.RISING, callback=currentKeg.newPulse)

  GPIO.setup(LCD_E, GPIO.OUT)  # E
  GPIO.setup(LCD_RS, GPIO.OUT) # RS
  GPIO.setup(LCD_D4, GPIO.OUT) # DB4
  GPIO.setup(LCD_D5, GPIO.OUT) # DB5
  GPIO.setup(LCD_D6, GPIO.OUT) # DB6
  GPIO.setup(LCD_D7, GPIO.OUT) # DB7
  GPIO.setup(LCD_LIGHT, GPIO.OUT) # Backlight enable
  GPIO.setup(VALVE, GPIO.OUT)
 
  # Initialise display
  lcd_init()

  with open("config.ini") as f:
    b33rn4ry_config = f.read()
    config = ConfigParser.RawConfigParser(allow_no_value=True)
    config.readfp(io.BytesIO(b33rn4ry_config))

    dbhost = config.get('mysql', 'host')
    dbuser = config.get('mysql', 'user')
    dbpass = config.get('mysql', 'passwd')
    dbname = config.get('mysql', 'db')

    # Serial bitrate for RFID reader
    SERIAL_DEVICE = config.get('counter', 'comdevice')

  db = B33rn4ryDatabase.B33rn4ryDatabase(dbtype='MYSQL',host=dbhost, user=dbuser, passwd=dbpass, db=dbname)
  try:
    currentEvent = db.getActiveEvent()
  except B33rn4ryExceptions.B33rn4rySetupEventError as error:
    lcd_string("Event-setup wrong !!!!",LCD_LINE_2,1)
    time.sleep(2)
    

  reader = B33rn4ryReader.SerialRfid(SERIAL_DEVICE)
  reader.initialize()
#  lcd_backlight(True)
#  time.sleep(0.5)
#  lcd_string("Uncomressing kernel...",LCD_LINE_1,1)
#  time.sleep(1)
#  lcd_string("Starting ...",LCD_LINE_2,1)
#  time.sleep(1)
#  lcd_string("Starting ...    [OK]",LCD_LINE_2,1)
#  time.sleep(1)
#  lcd_string("B33rn4ry Counter",LCD_LINE_3,1)
#  lcd_string("ready!",LCD_LINE_4,1)
#  time.sleep(3)
#  lcd_backlight(False)

  syslog.syslog("B33rn4ry Counter starting")
 
  lcd_backlight(True)
  lcd_string("B33rn4ry Counter",LCD_LINE_1,1)
  lcd_string("                    ",LCD_LINE_2,1)
  lcd_string("     Welcome to     ",LCD_LINE_3,1)
  lcd_string(currentEvent[1].zfill(0),LCD_LINE_4,1)

  time.sleep(2)
  
  lcd_string("Idle",LCD_LINE_2,1)
  lcd_string("                    ",LCD_LINE_3,1)
  lcd_string("Waiting for Geeks",LCD_LINE_4,1)
  time.sleep(2)
  lcd_backlight(False)

  try:
    kegID = db.getCurrentKeg(currentEvent[0])
    currentKeg.setPulses(db.getKegPulses(kegID))
    oldKegID = kegID
  except B33rn4ryExceptions.B33rn4ryKegError as error:
    lcd_string("Keg-setup wrong !!!!",LCD_LINE_2,1)
    syslog.syslog(syslog.LOG_ERR, "Keg-setup wrong !!!!")
    time.sleep(2)

  syslog.syslog("B33rn4ry Counter ready")

  while True:
    
    # clear variables
    ID = ""
    pID = ""

    try:
      kegID = db.getCurrentKeg(currentEvent[0])
      if oldKegID != kegID:
        currentKeg.setPulses(db.getKegPulses(kegID))
	oldKegID = kegID
    except B33rn4ryExceptions.B33rn4ryKegError as error:
      lcd_string("Keg-setup wrong !!!!",LCD_LINE_2,1)
      syslog.syslog(syslog.LOG_ERR, "Keg-setup wrong !!!!")
      time.sleep(2)

    ID = reader.read_rfid()

    print("ID read:", ID)
    if ID:
      if ID != IDtmp:
#        pID = str(int(ID[2:], 16))
        pID = ID
        lcd_backlight(True)
#         lcd_string("Reading RFID tag ...",LCD_LINE_1,1)
#         lcd_string("ID:   "+ pID.zfill(10),LCD_LINE_2,1)
#        syslog.syslog(syslog.LOG_DEBUG, "read ID:"+ pID)
        result = db.checkUser('{:08X}'.format(ID))
        if result is not None:
          if (IdPulsesStart is None):
            IdPulsesStart = currentKeg.getPulses()
          lcd_string("User: "+str(result[0]),LCD_LINE_3,1)
          lcd_string("ACCESS GRANTED!",LCD_LINE_3,1)#
          lcd_string("Go ahead and draw a beer!",LCD_LINE_4,1)
          syslog.syslog("ACCESS GRANTED!")
          #os.system('mpg321 access_granted.mp3 2>&1 > /dev/null &')
          valve(True)
          IDtmp = ID
	  print "drafting: Event: %d; keg: %d" % (currentEvent[0], kegID)
        else:
          if (IdPulsesStart is not None):
            db.storeDraft(IDtmp, currentKeg.getPulses() - IdPulsesStart)
            db.setKegPulses(kegID, currentKeg.getPulses())
          IdPulsesStart = None
          lcd_string("ACCESS DENIED!",LCD_LINE_3,1)
          lcd_string("                    ",LCD_LINE_4,1)
          syslog.syslog("ACCESS DENIED!")
          #os.system('mpg321 sadtrombone.mp3')

    else:
      valve(False)
      if (IdPulsesStart is not None):
        db.storeDraft(IDtmp, currentKeg.getPulses() - IdPulsesStart)
        db.setKegPulses(kegID, currentKeg.getPulses())
      IdPulsesStart = None
      lcd_backlight(False)
      lcd_string("B33rn4ry Counter",LCD_LINE_1,1)
      lcd_string("Idle",LCD_LINE_2,1)
      lcd_string("                    ",LCD_LINE_3,1)
      lcd_string("Waiting for Geeks",LCD_LINE_4,1)
      IDtmp = ""

def lcd_init():
  # Initialise display
  lcd_byte(0x33,LCD_CMD) # 110011 Initialise
  lcd_byte(0x32,LCD_CMD) # 110010 Initialise
  lcd_byte(0x06,LCD_CMD) # 000110 Cursor move direction
  lcd_byte(0x0C,LCD_CMD) # 001100 Display On,Cursor Off, Blink Off
  lcd_byte(0x28,LCD_CMD) # 101000 Data length, number of lines, font size
  lcd_byte(0x01,LCD_CMD) # 000001 Clear display
  time.sleep(E_DELAY)
 
def lcd_byte(bits, mode):
  # Send byte to data pins
  # bits = data
  # mode = True  for character
  #        False for command
 
  GPIO.output(LCD_RS, mode) # RS
 
  # High bits
  GPIO.output(LCD_D4, False)
  GPIO.output(LCD_D5, False)
  GPIO.output(LCD_D6, False)
  GPIO.output(LCD_D7, False)
  if bits&0x10==0x10:
    GPIO.output(LCD_D4, True)
  if bits&0x20==0x20:
    GPIO.output(LCD_D5, True)
  if bits&0x40==0x40:
    GPIO.output(LCD_D6, True)
  if bits&0x80==0x80:
    GPIO.output(LCD_D7, True)
 
  # Toggle 'Enable' pin
  lcd_toggle_enable()
 
  # Low bits
  GPIO.output(LCD_D4, False)
  GPIO.output(LCD_D5, False)
  GPIO.output(LCD_D6, False)
  GPIO.output(LCD_D7, False)
  if bits&0x01==0x01:
    GPIO.output(LCD_D4, True)
  if bits&0x02==0x02:
    GPIO.output(LCD_D5, True)
  if bits&0x04==0x04:
    GPIO.output(LCD_D6, True)
  if bits&0x08==0x08:
    GPIO.output(LCD_D7, True)
 
  # Toggle 'Enable' pin
  lcd_toggle_enable()
 
def lcd_toggle_enable():
  # Toggle enable
  time.sleep(E_DELAY)
  GPIO.output(LCD_E, True)
  time.sleep(E_PULSE)
  GPIO.output(LCD_E, False)
  time.sleep(E_DELAY)
 
def lcd_string(message,line,style):
  # Send string to display
  # style=1 Left justified
  # style=2 Centred
  # style=3 Right justified
 
  if style==1:
    message = message.ljust(LCD_WIDTH," ")
  elif style==2:
    message = message.center(LCD_WIDTH," ")
  elif style==3:
    message = message.rjust(LCD_WIDTH," ")
 
  lcd_byte(line, LCD_CMD)
 
  for i in range(LCD_WIDTH):
    lcd_byte(ord(message[i]),LCD_CHR)
 
def lcd_backlight(flag):
  # Toggle backlight on-off-on
  GPIO.output(LCD_LIGHT, flag)

def valve(flag):
  GPIO.output(VALVE, flag)

if __name__ == '__main__':
 
  try:
    main()
  except KeyboardInterrupt:
    lcd_byte(0x01, LCD_CMD)
    lcd_string("Goodbye!",LCD_LINE_1,2)
    syslog.syslog("Goodbye!")
  else:
    raise
  finally:
    GPIO.cleanup()
