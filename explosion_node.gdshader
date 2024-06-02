shader_type spatial;

uniform sampler2D color_ramp;
uniform float particle_lifetime = 1.0;

void fragment() {
    // Assuming particle time is passed in some way, for example through VERTEX.z
    float lifetime_factor = VERTEX.z ;
    // Sample the color from the color ramp
    vec4 color = texture(color_ramp, vec2(lifetime_factor, 0.1));
    
    // Set the final color
    ALBEDO = color.rgb;
    
    // Alpha decreases with time
    ALPHA = 0.9;
	
    // Emission can be based on color or some other factor
    EMISSION = color.rgb * 1.0;
}

void vertex() {
    // Called for every vertex the material is visible on.
}
