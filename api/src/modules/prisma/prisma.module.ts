import { Module } from '@nestjs/common';

import { PrismaService } from './prisma.service';
import { EnvironmentConfigModule } from '../config/environment-config/environment-config.module';

@Module({
  imports: [EnvironmentConfigModule],
  providers: [PrismaService],
  exports: [PrismaService],
})
export class PrismaModule {}
