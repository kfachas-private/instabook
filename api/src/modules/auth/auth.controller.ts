import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { SigninDto, SignupDto } from './auth.dto';

@Controller('/auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('/signin')
  async signin(@Body() body: SigninDto): Promise<string> {
    return await this.authService.signin(body);
  }

  @Post('/signup')
  signup(@Body() body: SignupDto): Promise<string> {
    return this.authService.signup(body);
  }
}
