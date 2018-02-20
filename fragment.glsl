#version 300 es

// Default fragment shader

precision highp float;

out vec4 color;

in vec2 UV;

uniform float time, ratio;

#define PI 3.1416
#define PI2 6.2832

vec3 light_color = vec3(1.0f,1.0f,1.0f);

void main(){
    vec2 p = UV - 0.5;
    p.x *= ratio;
    float fuzz = 0.03 * cos(p.x * 10.0 + 2.0 * time * PI2);

    p.y += fuzz;
    
    float f_orange = 0.5 *
        cos(p.y * 20.0 + 2.0 * time * PI2) + 0.3;
    float f_blue = 0.5 *
        cos(p.y * 16.0 + time * PI2 + 3.1) + 0.3;
    float f_white = 0.5 *
        cos(p.y * 10.0 + 2.0 * time * PI2 + 1.9) + 0.3;

    f_white = pow(f_white, 2.0);
    
    vec4 tp_orange = vec4(f_orange, 0.5 * f_orange, 0.0, 1.0);
    vec4 tp_blue = vec4(0.0, 0.0, 1.2 * f_blue, 1.0);
    vec4 tp_white = vec4(f_white, f_white, f_white, 1.0);
    
    color = tp_blue + tp_orange + tp_white;

    color *= 1.0 + 130.0 * fuzz;
    color *= 1.0 - pow(3.0 * length(p), 2.0);
}
