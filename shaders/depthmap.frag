//out vec4 gl_FragColor;

varying vec2 texCoord;
varying vec3 modelPos;

uniform sampler2D texture;
uniform sampler2D colormap;
uniform float radius;
uniform float rotation;

const float dd = 1.732/3.;
//const float dd = .1;

void main()
{
	if (length(modelPos)<radius) {
		float data = length(texture2D(texture, texCoord).rgb);
		float dxn = length(texture2D(texture, texCoord+
									 1e-3*vec2(-cos(rotation), -sin(rotation))).rgb);
		float dxp = length(texture2D(texture, texCoord+
									 1e-3*vec2(cos(rotation), -sin(rotation))).rgb);
		float dyn = length(texture2D(texture, texCoord+
									 1e-3*vec2(sin(rotation), -cos(rotation))).rgb);
		float dyp = length(texture2D(texture, texCoord+
									 1e-3*vec2(-sin(rotation), cos(rotation))).rgb);
		vec3 color = texture2D(colormap, vec2(data/1.732,.0)).rgb;

		float d = dxp-dxn-dyp+dyn;
		if (d>0.)
			d = dd/(d+dd*dd/d);
		else
			d = atan(d/dd);
		d = 1. + clamp(d*dd*20., -.5, .5);

		gl_FragColor = vec4(color * d, 1.);
	} else discard;
}
