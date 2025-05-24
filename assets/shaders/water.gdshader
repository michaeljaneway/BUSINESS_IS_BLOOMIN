shader_type canvas_item;

group_uniforms WaterShader;
uniform sampler2D noise: repeat_enable;
uniform sampler2D secNoise: repeat_enable;
uniform vec2 speed = vec2(0.05, 0.05);
uniform vec2 speedSecondNoise = vec2(-0.05, -0.05);
uniform float distortionStrength: hint_range(-1, 1) = 0.2;

group_uniforms Colors;
uniform vec4 toneColor: source_color;
uniform vec4 topColor: source_color;

group_uniforms Lights;
uniform float lightStart: hint_range(0.0, 1.0) = 0.275;
uniform float lightEnd: hint_range(0.0, 1.0) = 0.4;

group_uniforms ScreenTextures;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture;

group_uniforms PixelBlicks;
uniform float pixelSize = 2.0;

group_uniforms WaterReflects;

void fragment(){
	vec2 uv = UV;
	uv *= pixelSize;
	vec2 floorUv = floor(uv);
	floorUv /= pixelSize;
	float depth = texture(noise, floorUv + speed * TIME).x
	* texture(secNoise, floorUv + speedSecondNoise * TIME).x;
	vec4 screenColor = texture(SCREEN_TEXTURE, SCREEN_UV
	+ distortionStrength * vec2(depth));
	vec4 topLight = smoothstep(lightStart, lightEnd, depth) * topColor;
	COLOR = toneColor + topLight;
	COLOR.a = 1.0;
}