#define FP highp

varying vec2 texCoord;
varying vec2 viewPos;
varying vec3 modelPos;

uniform vec4 linewidth;

uniform vec3 color;
uniform vec3 linecolor;

void main()
{
	vec4 border = linewidth;
	bool f = texCoord.x<border.x ||
			texCoord.y<border.y ||
			texCoord.x+border.z>1. ||
			texCoord.y+border.w>1.;
	gl_FragColor = f?
				vec4(linecolor,1.):
				vec4(color, 1.);
}
