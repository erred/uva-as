package main

import (
	"bufio"
	"log"
	"os"

	ais "github.com/BertoldVdb/go-ais"
	"github.com/BertoldVdb/go-ais/aisnmea"
	"github.com/davecgh/go-spew/spew"
)

func main() {
	f, err := os.Open("../ais.log")
	if err != nil {
		log.Fatal(err)
	}
	// c := ais.CodecNew(false, false)
	// c.DropSpace = true
	nm := aisnmea.NMEACodecNew(ais.CodecNew(false, false))
	s := bufio.NewScanner(f)
	var i int
	for s.Scan() {
		i++
		if i < 32 {
			continue
		}
		decoded, err := nm.ParseSentence(s.Text())
		if err != nil {
			log.Println(err)
			continue
		}
		// r := c.DecodePacket(decoded.Payload)
		spew.Dump(decoded)
		// out, _ := json.MarshalIndent(decoded, "", "  ")
		// fmt.Printf("%T: %s\n", decoded, out)
	}
}
