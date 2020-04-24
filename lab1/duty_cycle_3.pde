#include <RH_ASK.h>
#include <stdlib.h>
#ifdef RH_HAVE_HARDWARE_SPI
#include <SPI.h> // Not actually used but needed to compile
#endif

#define TX_LIMIT 10
#define RX_LIMIT 90

RH_ASK driver(2000, 11, 12, HIGH);


void setup()
{
#ifdef RH_HAVE_SERIAL
    Serial.begin(9600);	  // Debugging only
#endif
    if (!driver.init())
#ifdef RH_HAVE_SERIAL
         Serial.println("init failed");
#else
	;
#endif
}


void send(char *msg){
  driver.send((uint8_t *)msg, strlen(msg));
  driver.waitPacketSent();

}

int receive(uint8_t* buf, uint8_t buflen){
  if (driver.recv(buf, &buflen)){
    int i;
    return 1;
  } else {
    return 0;
  }
}

void loop(){

  uint8_t* buf = (uint8_t*)calloc(RH_ASK_MAX_MESSAGE_LEN, sizeof(uint8_t));

  int medium_status = 0;
  do{
    int medium_status = receive(buf, RH_ASK_MAX_MESSAGE_LEN);
  }while(medium_status);

  while(1){

    unsigned long timer_start = millis();
    do{
      char *msg = "hello"; //...for now.
      send(msg);
    }while(millis() - timer_start < TX_LIMIT);
    Serial.println(millis() - timer_start);

    timer_start = millis();
    do {
      receive(buf, RH_ASK_MAX_MESSAGE_LEN);
      driver.printBuffer("Got:", buf, RH_ASK_MAX_MESSAGE_LEN);
    }while(timer_start - millis() < RX_LIMIT);
    Serial.println(millis() - timer_start);
  }

  free(buf);

}
