//Code to make the photon blink the RGP led
boolean blinking = false;

void setup() {
    RGB.control(true);
    Spark.function("blink", ledBlink);
}

void loop() {
    if(blinking) {
        RGB.color(255,0,0);
        delay(200);
        RGB.color(0,255,0);
        delay(200);
        RGB.color(0,0,255);
        delay(200);
    }
    RGB.color(0,0,0);

}

int ledBlink(String command) {

    if (command.equalsIgnoreCase("on")) {
        blinking = true;
        return 1;
    }
    else if (command.equalsIgnoreCase("off")) {
        blinking = false;
        return 1;
    }
    else if(command.equalsIgnoreCase("test")){
        blinking = true;
        return 1;
    }
    return -1;
    //Device ID=4a0022000151353532373238
    //Access Token=82c4fd6eafd0588fe9062a8d0e7b5de12881f947
}
