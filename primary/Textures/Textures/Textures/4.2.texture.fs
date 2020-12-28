
#version 330 core

out vec4 FragColor;

in vec3 ourColors;
in vec2 TexCoord;

// texture sampler
uniform sampler2D ourTexture1;
uniform sampler2D ourTexture2;

void main()
{
//    FragColor = mix(texture(ourTexture1, TexCoord), texture(ourTexture2, TexCoord), 0.2);
    FragColor = mix(texture(ourTexture1, TexCoord), texture(ourTexture2, vec2(1.0 - TexCoord.x, TexCoord.y)), 0.2);

}
