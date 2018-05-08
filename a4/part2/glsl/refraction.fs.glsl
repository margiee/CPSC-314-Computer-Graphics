// UNIFORMS
uniform samplerCube skybox;

varying vec3 Normal_V;
varying vec3 Position_V;
varying vec3 cameraPos;
varying vec3 texCoords;
varying mat4 viewM;

void main() {
	vec3 normalVec = normalize(Normal_V);
	vec3 positionVec = normalize(-Position_V);
	
	// light ray goes from air to glass
	float ratio = 1.00 / 1.52;
	vec3 I = normalize(positionVec - cameraPos);
	vec3 R = refract(I, normalVec, ratio); 

	vec4 texColor = textureCube(skybox, R);
	
	gl_FragColor = vec4(texColor.r, texColor.g, texColor.b, 1.0);
}