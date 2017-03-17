#ifdef GL_ES
    precision mediump float;
#endif

varying vec4 v_color;
varying vec2 v_texCoords;
uniform sampler2D u_paletteTexture;
uniform vec3 u_color0;
uniform vec3 u_color1;
uniform vec3 u_color2;
uniform vec3 u_color3;
uniform sampler2D u_texture;
uniform mat4 u_projTrans;

void main() {
    vec4 currentPixelColor = texture2D(u_texture, v_texCoords).rgba;
    float pixel = currentPixelColor.r;
    float attr = currentPixelColor.g;
    float offset = currentPixelColor.b;
    vec2 paletteTextureCoords = vec2(attr + pixel + offset, .5);
    vec3 outputPixelColor = texture2D(u_paletteTexture, paletteTextureCoords).rgb;
    gl_FragColor = vec4(outputPixelColor, currentPixelColor.a);
}