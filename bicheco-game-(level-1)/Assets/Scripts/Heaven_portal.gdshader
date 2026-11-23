
shader_type canvas_item;

uniform vec4 portal_color : source_color = vec4(0.8, 0.95, 1.0, 1.0);
uniform float brightness : hint_range(0.5, 3.0) = 1.5;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);

    // Keep the original portal's shading and details.
    vec3 color = tex.rgb * portal_color.rgb * brightness;

    COLOR = vec4(color, tex.a);
}
