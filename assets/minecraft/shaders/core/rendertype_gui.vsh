#version 150

// Modifications by Grahp :)

in vec3 Position;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out vec4 vertexColor;

// The gray color of the bar (not precise)
#define grayColor vec4(0.8, 0.8, 0.8, 1.0)

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexColor = Color;

    // Checks if its the right color (there's no colors close so it just checks if it's within 20%) 
    if (Position.x < 3 && Position.z == 50 && all(lessThan(abs(vertexColor - grayColor), vec4(0.2, 0.2, 0.2, 1.0)))) {
        vertexColor = vec4(0); // Remove Gray Bar
    }

}