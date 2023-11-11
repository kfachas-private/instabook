import { registerAs } from '@nestjs/config';

export default registerAs('param-store', () => ({
  awsRegion: process.env.AWS_REGION,
  awsParamStorePath: process.env.AWS_PARAM_STORE_PATH,
}));
