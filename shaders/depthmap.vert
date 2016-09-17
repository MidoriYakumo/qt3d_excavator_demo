#define FP highp

attribute vec3 vertexPosition;
attribute vec2 vertexTexCoord;

varying vec2 texCoord;
varying vec3 modelPos;

uniform mat4 mvp;
uniform sampler2D texture;
uniform float radius;


void main()
{
	texCoord = vertexTexCoord;
	modelPos = vertexPosition;
//	if (length(modelPos)<radius)
		modelPos.y += length(texture2D(texture, texCoord))*5e-2;
	gl_Position = mvp  *  vec4(modelPos, 1.0 );
}
