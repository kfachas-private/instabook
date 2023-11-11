import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { AuthModule } from './modules/auth/auth.module';
import * as moment from 'moment-timezone';
import { ConversationModule } from './modules/conversation/conversation.module';
import { UserModule } from './modules/user/user.module';
import { PostModule } from './modules/post/post.module';
import { AuthMiddleware } from './middlewares/auth.middleware';

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const unAuthRoutes = ['auth/signup', 'auth/signin', 'auth/verify-email'];

const MomentProvider = {
  provide: 'MomentWrapper',
  useValue: moment,
};

@Module({
  imports: [AuthModule, UserModule, PostModule, ConversationModule],
  providers: [MomentProvider],
})
export class AppModule implements NestModule {
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  configure(consumer: MiddlewareConsumer): void {
    //consumer.apply(ContextMiddleware).forRoutes('*');
    consumer
      .apply(AuthMiddleware)
      .exclude(...unAuthRoutes)
      .forRoutes('*');
  }
}
