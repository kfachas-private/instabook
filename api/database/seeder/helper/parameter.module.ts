import * as process from 'process';

import { Injectable, Module } from '@nestjs/common';

enum AllowedParameters {
  DROP = '--drop',
  FAKER = '--faker',
}

@Injectable()
export class ParametersService {
  isDrop(): boolean {
    return process.argv.includes(AllowedParameters.DROP);
  }

  isFaker(): boolean {
    return process.argv.includes(AllowedParameters.FAKER);
  }
}

@Module({
  providers: [ParametersService],
  exports: [ParametersService],
})
export class ParametersModule {}
