#define FP highp

varying vec2 viewPos;
varying vec3 modelPos;

uniform mat4 mvp;
uniform vec2 rsv;

uniform float radius;
uniform float hlw1;
uniform vec3 color;

//FP vec2 vp0 = vec2(mvp[3][0], mvp[3][1]);

void main()
{
	FP vec4 rp4 = mvp * vec4(normalize(modelPos) * radius, 1.);
	FP vec2 dis2 = vec2(viewPos - rp4.xy)*rsv;

	gl_FragColor = vec4(color, 1.) * clamp(hlw1-length(dis2), 0., 1.);

//	if (gl_FragColor.z==0.) gl_FragColor = vec4(color/2., .5);
//	if (gl_FragColor.z==0.) gl_FragColor = vec4(r, 0., .5);

	if (gl_FragColor.z == 0.) discard;
}
