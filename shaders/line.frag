#define FP highp

varying vec2 viewPos;
varying vec3 modelPos;

uniform mat4 mvp;
uniform vec2 rvp;

uniform float hlw1;
uniform vec3 color;

void main()
{
//	float dis = length(mvp * vec4(pos - rPos, 0., 0.));
//	float dis = abs(length(texCoord)-radius);
//	vec4 o2 = mvp * vec4(0., 0., 0., -1.);

//	vec4 rp4 = mvp * vec4(modelPos, 1.);
//	vec4 rp4 = mvp * vec4(normalize(modelPos), 1.);

	FP vec4 rp4 = mvp * vec4(normalize(modelPos) * radius, 1.);
	FP vec2 dis2 = vec2(viewPos - rp4.xy)*rvp;
	gl_FragColor = vec4(color, 1.) * clamp(hlw1-length(dis2), 0., 1.);

//	gl_FragColor = vec4(texCoord, 0., 1.);
//	gl_FragColor = vec4(modelPos.xz*100., 0., 1.);
//	gl_FragColor = vec4((mvp*vec4(modelPos,1.)).xyz*100., 1.);
//	gl_FragColor = vec4((mvp*vec4(normalize(modelPos)*radius,1.)).xyz*100., 1.);
//	gl_FragColor = vec4(rp4.xy * 255., 0., 1.);
//	gl_FragColor = vec4(rp4.xy, 0., 1.);
//	if (hlw1<length(dis2)) gl_FragColor *= 0.;
//	gl_FragColor = vec4(rp4.xy, 0., 1.);
//	gl_FragColor = vec4(color, 1.);

	if (gl_FragColor.z == 0.) discard;
}
