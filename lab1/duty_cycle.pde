#include <RH_ASK.h>
#include <stdlib.h>
#include <time.h>
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

void loop(){
  uint8_t* buf = (uint8_t*)calloc(RH_ASK_MAX_MESSAGE_LEN, sizeof(uint8_t));

  while(driver.recv(buf, RH_ASK_MAX_MESSAGE_LEN)){}

  while(1){
    t0 = millis();

    do{
      char *msg = "hello"; //...for now.
      send(msg);
    }while(millis()-t0 < TX_LIMIT);

    t0 = millis();
    do {
      if (receive(buf, RH_ASK_MAX_MESSAGE_LEN)) driver.printBuffer("Got:", buf, buflen);
    }while(millis()-t0 < RX_LIMIT);
  }

  free(buf);

}
