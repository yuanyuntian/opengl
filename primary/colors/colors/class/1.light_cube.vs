//
//  1.light_cube.vs
//  colors
//
//  Created by Fei Yuan on 2021/1/8.
//

#version 330 core
layout (location = 0) in vec3 aPos;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0);
}


