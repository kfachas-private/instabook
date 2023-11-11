import { Body, Controller, Post } from '@nestjs/common';
import { ConversationService } from './conversation.service';
import { SigninDto, SignupDto } from './conversation.dto';

@Controller('/conversation')
export class ConversationController {
  constructor(private readonly authService: ConversationService) {}

  @Post('/signin')
  async signin(@Body() body: SigninDto): Promise<string> {
    return await this.authService.signin(body);
  }

  @Post('/signup')
  signup(@Body() body: SignupDto): Promise<string> {
    return this.authService.signup(body);
  }
}
