.pragma library

function copyArray(src, dst) { // copy js list/array to gl.xxxArray
	for (var i in src) {
		dst[i] = src[i]
	}
}

function mix(a, b, u) {
	return a*(1.-u)+b*u
}

function addComponentToEntity(entity, component) {
	var entityComponents = []
	for (var i = 0; i < entity.components.length; i++)
		entityComponents.push(entity.components[i])
	entityComponents.push(component)
	entity.components = entityComponents
}

function removeComponentFromEntity(entity, component) {
	var entityComponents = []
	for (var i = 0; i < entity.components.length; i++) {
		if (entity.components[i] !== component)
			entityComponents.push(entity.components[i])
	}
	entity.components = entityComponents
}
