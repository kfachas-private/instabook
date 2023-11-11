import { Body, Controller, Post } from '@nestjs/common';
import { PostService } from './post.service';
import { SigninDto, SignupDto } from './post.dto';

@Controller('/post')
export class PostController {
  constructor(private readonly authService: PostService) {}

  @Post('/create')
  async signin(@Body() body: SigninDto): Promise<string> {
    return await this.authService.signin(body);
  }

  @Post('/:postId/update')
  async sign4in(@Body() body: SigninDto): Promise<string> {
    return await this.authService.signin(body);
  }

  @Post('/:postId/delete')
  async sign3in(@Body() body: SigninDto): Promise<string> {
    return await this.authService.signin(body);
  }

  @Post('/:postId/comment')
  signup(@Body() body: SignupDto): Promise<string> {
    return this.authService.signup(body);
  }

  @Post('/:postId/comment/:commentId/update')
  async sig3n3in(@Body() body: SigninDto): Promise<string> {
    return await this.authService.signin(body);
  }

  @Post('/:postId/comment/:commentId/delete')
  async s4ign3in(@Body() body: SigninDto): Promise<string> {
    return await this.authService.signin(body);
  }
}
