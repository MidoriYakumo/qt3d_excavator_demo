
#define FP highp

attribute vec3 vertexPosition;

varying vec2 texCoord;
varying vec2 viewPos;
varying vec3 modelPos;

uniform mat4 mvp;


void main()
{
	modelPos = vertexPosition;
	FP vec4 vp4 = mvp * vec4( vertexPosition, 1.0 );
	viewPos = vp4.xy;
	gl_Position = mvp  *  vec4( vertexPosition, 1.0 );
}
