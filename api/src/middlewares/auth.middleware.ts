import {
  Injectable,
  NestMiddleware,
  UnauthorizedException,
} from '@nestjs/common';
import { NextFunction, Request, Response } from 'express';
import axios from 'axios';

@Injectable()
export class AuthMiddleware implements NestMiddleware {
  constructor() {}

  async use(req: Request, res: Response, next: NextFunction): Promise<void> {
    //let additionalProperties: AdditionalProperties = null;
    const authorization = req.headers['authorization'];

    if (authorization != null && authorization.startsWith('Bearer ')) {
      const token = authorization.substring(7);
      const res = await axios.post(
        'http://localhost:9090/verify',
        {
          token,
        },
        {
          auth: {
            username: 'kfachas',
            password: 'root',
          },
        },
      );

      if (!res || !res.data || !res.data.success) {
        return next(new UnauthorizedException('errors.invalidToken'));
      }

      /*additionalProperties = {
        aud: decodedToken.aud,
        email: decodedToken.email,
        email_verified: decodedToken.email_verified,
        phone_number: decodedToken.phone_number,
        //claims
        name: decodedToken.name as string,
        admin: decodedToken.admin as boolean,
        user_id: decodedToken.user_id as string,
      } satisfies AdditionalProperties;*/
    }

    /*req.ctx = {
      ...req.ctx,
      additionalProperties,
    } satisfies IContext; */

    next();
  }
}
