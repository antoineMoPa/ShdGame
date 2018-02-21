#ifndef FRAMEBUFFER
#define FRAMEBUFFER

/*
  Contains data about an opengl framebuffer
  And the texture it gets rendered to
*/
class FrameBuffer{
public:
    Image * rendered_tex;
    GLuint fb_id;
    GLuint depth_buf;
    
    void delete_ressources();
    
    void create(int w, int h);
    
    void resize(int w, int h);
};

#endif
