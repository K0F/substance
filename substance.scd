"SC_JACK_DEFAULT_OUTPUTS".setenv("alsa_out");

s.boot();
(
s.waitForBoot({

p=ProxySpace.push(s);
~a.quant=2;
~a.fadeTime=3.02;
~a.play;
~a={
	var speed = LFNoise1.kr(1).range(1/32,16);
	var mod = LFSaw.kr(speed);
	var sig = [
	LFSaw.ar(50*[1,1.5,1.3333,2,4].choose),
	WhiteNoise.ar([1,0.25,0.1,0.2].choose),
	Pulse.ar([1,2,3,4,5,6,7,8].choose),
	WhiteNoise.ar((1..8).choose/10.0),
	LFNoise1.ar(400*(1..10).choose),
	SinOsc.ar(8000/[1,1.333,1.5,2,4,8].choose,mul:0.1),
	LFSaw.ar(16000/[1,1.5,1.33333,2,4].choose,mul:0.25)
].scramble;
	sig = Select.ar(mod*sig.size,sig);
	SendTrig.ar(Impulse.ar(speed),0, speed*2 );
	//sig = CombN.ar(sig,1/20*speed,1/21*speed,1);
	sig = LPF.ar(sig,800)+sig;
	sig = AllpassN.ar(sig,1/4,1/4,1);
	Splay.ar(sig,0.71,0.9,SinOsc.kr(speed));
};
Tdef(\mm,{loop{~a.rebuild;16.wait;}}).play();
m = NetAddr("127.0.0.1", 7000);
//o = OSCdef(\tr, { arg ...args;m.sendMsg("/trig",args[0][3]);},'/tr', s.addr);

OSCresponderNode(nil,'\tr',{|t,r,msg| m.sendMsg('/trig',msg[3]);}).add;



});
)
