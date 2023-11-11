import { BadRequestException, Injectable } from '@nestjs/common';
import { SigninDto, SignupDto } from './post.dto';
import axios from 'axios';

@Injectable()
export class PostService {
  constructor() {}

  async signup(body: SignupDto): Promise<string> {
    try {
      if (body.password !== body.confirmPassword)
        throw new BadRequestException('Passwords do not match');

      const res = await axios.post(
        'http://localhost:9090/signup',
        {
          email: body.email,
          password: body.password,
        },
        {
          auth: {
            username: 'kfachas',
            password: 'root',
          },
        },
      );

      return res.data;
    } catch (e) {
      console.error({ e });
      throw new BadRequestException(e.message || 'Invalid credentials');
    }
  }

  async signin(body: SigninDto): Promise<string> {
    try {
      const res = await axios.post(
        'http://localhost:9090/signin',
        {
          email: body.email,
          password: body.password,
        },
        {
          auth: {
            username: 'kfachas',
            password: 'root',
          },
        },
      );

      return res.data;
    } catch (e) {
      console.error(e.message);
      throw new BadRequestException(e.message || 'Invalid credentials');
    }
  }
}
