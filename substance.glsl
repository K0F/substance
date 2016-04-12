// from http://glsl.heroku.com/e#5205.0
// modified(light-weighted) for raspberry-pi 

#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform float sa;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {
	vec2 p = ( gl_FragCoord.xy / resolution.xy ) * 6.0;
	float d = sin(p.x*(pow(sa,2.0)*1000.0)+time);
	d = d*sin(time*40.0*pow(sa,1.6));
	gl_FragColor = vec4(d,d,d,1.0);
}
