import Qt3D.Core 2.0
import Qt3D.Render 2.0

Material {
	id: material

	property vector4d linewidth: Qt.vector4d(2., 2., 2., 2.)
	property color color: "yellow"
	property color linecolor: "#232323"

	effect: Effect {

		FilterKey {
			id: forward
			name: "renderingStyle"
			value: "forward"
		}

		techniques:
			Technique {
				renderPasses: RenderPass {
					filterKeys: [
						FilterKey { name: "pass"; value: "color" },
						FilterKey { name: "pass"; value: "color&surface" }
					]
					renderStates: CullFace { mode: CullFace.NoCulling }
					shaderProgram: ShaderProgram {
						vertexShaderCode: loadSource("file:./shaders/passthrough.vert")
						fragmentShaderCode: loadSource("file:./shaders/colorframe.frag")
					}
				}

				parameters: [
					Parameter {
						name: "rsv" // screen.dim/viewport.dim
						value: Qt.vector2d(app.sceneWidth/2., app.sceneHeight/2.)
					},
					Parameter {
						name: "color"
						value: material.color
					},
					Parameter {
						name: "linecolor"
						value: material.linecolor
					},
					Parameter {
						name: "linewidth"
						value: material.linewidth
					}
				]
		}
	}
}

