import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';

import { EnvironmentConfigService } from './environment-config.service';
import { validate } from './environment-config.validation';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      load: [],
      envFilePath: ['./env/.env.local', './env/.env'],
      ignoreEnvFile: !(
        process.env.NODE_ENV === 'local' || process.env.NODE_ENV === 'test'
      ),
      validate,
    }),
  ],
  providers: [EnvironmentConfigService],
  exports: [EnvironmentConfigService],
})
export class EnvironmentConfigModule {}
