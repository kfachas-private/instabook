import {
  INestApplication,
  Inject,
  Injectable,
  OnModuleDestroy,
  OnModuleInit,
} from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

import { EnvironmentConfigService } from '../config/environment-config/environment-config.service';

@Injectable()
export class PrismaService
  extends PrismaClient
  implements OnModuleInit, OnModuleDestroy
{
  constructor(
    @Inject(EnvironmentConfigService)
    private readonly config: EnvironmentConfigService,
  ) {
    super({
      datasourceUrl: config.getDatabaseFullUrl(),
      log: ['info', 'warn', 'error'],
    });
  }

  async onModuleInit(): Promise<void> {
    await this.$connect();
  }

  async onModuleDestroy(): Promise<void> {
    await this.$disconnect();
  }

  enableShutdownHooks(app: INestApplication): void {
    process.on('beforeExit', async () => {
      await app.close();
    });
  }
}
