import { Body, Controller, Post } from '@nestjs/common';
import { UserService } from './user.service';
import { SigninDto, SignupDto } from './user.dto';

@Controller('/user')
export class UserController {
  constructor(private readonly authService: UserService) {}

  @Post('/signin')
  async signin(@Body() body: SigninDto): Promise<string> {
    return await this.authService.signin(body);
  }

  @Post('/signup')
  signup(@Body() body: SignupDto): Promise<string> {
    return this.authService.signup(body);
  }
}
