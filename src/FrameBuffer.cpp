#include "ShdGame.h"
#include "FrameBuffer.h"

void FrameBuffer::delete_ressources() {
    rendered_tex->delete_ressources();
    glDeleteRenderbuffers(1, &depth_buf);
    glDeleteRenderbuffers(1, &fb_id);
}

void FrameBuffer::create(int w, int h) {
    // Create framebuffer
    glGenFramebuffers(1, &fb_id);
    glGenRenderbuffers(1, &depth_buf);
    
    
    glBindFramebuffer(GL_FRAMEBUFFER, fb_id);

    rendered_tex = new Image(w,h);
    
    // Poor filtering. Needed !
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    
    glFramebufferTexture2D(
        GL_FRAMEBUFFER,
        GL_COLOR_ATTACHMENT0,
        GL_TEXTURE_2D,
        rendered_tex->get_id(),0);
    
    GLenum DrawBuffers[1] = {GL_COLOR_ATTACHMENT0};
    glDrawBuffers(1, DrawBuffers);
    
    glBindRenderbuffer(GL_RENDERBUFFER, depth_buf);
    glRenderbufferStorage(GL_RENDERBUFFER,
                          GL_DEPTH_COMPONENT, w, h);
    
    glFramebufferRenderbuffer(
        GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depth_buf
        );
    
    if(glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) {
        cerr << "Framebuffer setup error" << endl;
    }
}

void FrameBuffer::resize(int w, int h) {
    delete_ressources();
    create(w, h);
    rendered_tex->resize(w, h);
}
