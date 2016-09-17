import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
	id: root

	property real radius: 1.
	property real linewidth: 2.
	property color color: "#232323"
	property Transform transform

	PlaneMesh {
		id: mesh
		height: root.radius * 3
		width: root.radius * 3
		meshResolution: Qt.size(2, 2)
//			primitiveType: GeometryRenderer.LineLoop
	}

	Material {
		id: material

		effect: Effect {

			FilterKey {
				id: forward
				name: "renderingStyle"
				value: "forward"
			}

			techniques:
				Technique {
					renderPasses: RenderPass {
						filterKeys: FilterKey { name: "pass"; value: "frameline" }
						renderStates: CullFace { mode: CullFace.NoCulling }
						shaderProgram: ShaderProgram {
							vertexShaderCode: loadSource("file:./shaders/line.vert")
							fragmentShaderCode: loadSource("file:./shaders/halfcircle.frag")
						}
					}

					parameters: [
						Parameter {
							name: "rsv" // screen.dim/viewport.dim
							value: Qt.vector2d(app.sceneWidth/2., app.sceneHeight/2.)
						},
						Parameter {
							name: "radius"
							value: root.radius
						},
						Parameter {
							name: "hlw1"
							value: root.linewidth/2. + .5
						},
						Parameter {
							name: "color"
							value: root.color
						}
					]
				}
		}
	}


	components: [mesh, material, transform]
}
