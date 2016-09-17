import Qt3D.Core 2.0
import Qt3D.Render 2.0

Material {
	id: material

	property real radius: 1.
	property real rotation: 0.

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
						FilterKey { name: "pass"; value: "surface" },
						FilterKey { name: "pass"; value: "color&surface" }
					]
//					renderStates: CullFace { mode: CullFace.NoCulling }
					shaderProgram: ShaderProgram {
						vertexShaderCode: loadSource("file:./shaders/depthmap.vert")
						fragmentShaderCode: loadSource("file:./shaders/depthmap.frag")
					}
				}

				parameters: [
					Parameter {
						name: "texture"
						value: Texture2D {
							minificationFilter: Texture.Linear
							magnificationFilter: Texture.Linear
							wrapMode {
								x: WrapMode.ClampToEdge
								y: WrapMode.ClampToEdge
							}
							TextureImage {
								source: "textures/heightmap.png"
							}
						}
					},
					Parameter {
						name: "colormap"
						value: Texture2D {
							minificationFilter: Texture.Nearest
							magnificationFilter: Texture.Nearest
							wrapMode {
								x: WrapMode.ClampToEdge
								y: WrapMode.ClampToEdge
							}
							TextureImage {
								source: "textures/colormap.png"
							}
						}
					},
					Parameter {
						name: "radius"
						value: root.radius
					},
					Parameter {
						name: "rotation"
						value: root.rotation * Math.PI / 180
					}
				]
		}
	}
}

