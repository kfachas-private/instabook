import { fakerFR as faker } from '@faker-js/faker';
import { ConfigModule } from '@nestjs/config';

import { seeder } from 'nestjs-seeder';

import { ParametersModule, ParametersService } from './helper/parameter.module';
import { validate } from 'src/modules/config/environment-config/environment-config.validation';
import { EnvironmentConfigModule } from '../../src/modules/config/environment-config/environment-config.module';
import { PrismaService } from '../../src/modules/prisma/prisma.service';
faker.seed(123); //To have consistent result

const configSeeder = [];
const publicSeeder = [];
seeder({
  imports: [
    EnvironmentConfigModule,
    ParametersModule,
    ConfigModule.forRoot({
      isGlobal: true,
      //load: [configServiceParamStoreConfiguration],
      envFilePath: ['./env/.env.local', './env/.env'],
      ignoreEnvFile: !(
        process.env.NODE_ENV === 'local' || process.env.NODE_ENV === 'test'
      ),
      validate,
    }),
    //ParamStoreModule.registerAsync({
    //import: ConfigModule,
    //  useClass: ConfigService,
    //}),
  ],
  providers: [ParametersService, PrismaService],
}).run([...configSeeder, ...publicSeeder]);
