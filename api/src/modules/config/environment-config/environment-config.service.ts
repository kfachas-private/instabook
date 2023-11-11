import { Inject } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { address } from 'ip';

import { Environment } from './environment-config.validation';
import { EnvironmentConfig } from './environment-config.interface';

const isLocal = (): boolean => process.env.NODE_ENV === Environment.Local;
const isTest = (): boolean => process.env.NODE_ENV === Environment.Test;

export class EnvironmentConfigService implements EnvironmentConfig {
  constructor(
    @Inject(ConfigService)
    private readonly configService: ConfigService,
  ) {}

  getDatabasePort(): number {
    return this.retrieveNumberParam('DATABASE_PORT');
  }

  getDatabaseUser(): string {
    return this.retrieveStringParam('DATABASE_USER');
  }

  getDatabaseHost(): string {
    if (isLocal() || isTest()) {
      const envParam = this.configService.get<string | undefined>(
        'DATABASE_HOST',
      );

      if (envParam === undefined) {
        const currentIPAddress: string = address();
        console.log(
          'EnvironmentConfigService',
          `Automatic resolution of ip address: ${currentIPAddress}`,
        );

        return currentIPAddress;
      }

      return envParam;
    }

    return this.retrieveStringParam('DATABASE_HOST');
  }

  getDatabasePassword(): string {
    return this.retrieveStringParam('DATABASE_PASSWORD');
  }

  getDatabaseName(): string {
    return this.retrieveStringParam('DATABASE_NAME');
  }

  getNotifierUrl(): string {
    return this.retrieveStringParam('API_NOTIFIER_URL');
  }

  getNotifierName(): string {
    return this.retrieveStringParam('API_NOTIFIER_BASIC_AUTH_USERNAME');
  }

  getNotifierPassword(): string {
    return this.retrieveStringParam('API_NOTIFIER_BASIC_AUTH_PASSWORD');
  }

  getAwsS3Bucket(): string {
    return this.retrieveStringParam('AWS_S3_BUCKET');
  }

  getFirebaseClientEmail(): string {
    return this.retrieveStringParam('FIREBASE_CLIENT_EMAIL');
  }

  getFirebaseDatabaseURL(): string {
    return this.retrieveStringParam('FIREBASE_DATABASE_URL');
  }

  getFirebaseProjectId(): string {
    return this.retrieveStringParam('FIREBASE_PROJECT_ID');
  }

  getGoogleMapsApiKey(): string {
    return this.retrieveStringParam('GOOGLE_MAPS_API_KEY');
  }

  getOpenDataSoftApiKey(): string {
    return this.retrieveStringParam('OPENDATASOFT_API_KEY');
  }

  getFirebasePrivateKey(): string {
    return this.retrieveStringParam('FIREBASE_PRIVATE_KEY').replace(
      /\\n/g,
      '\n',
    );
  }

  getDatabaseFullUrl(): string {
    return `postgresql://${this.getDatabaseUser()}:${this.getDatabasePassword()}@${this.getDatabaseHost()}:${this.getDatabasePort()}/${this.getDatabaseName()}`;
  }

  private retrieveStringParam(param: string): string {
    if (isLocal() || isTest()) {
      const envParam = this.configService.get<string>(param);

      if (envParam) {
        return envParam;
      } else {
        console.log(
          'EnvironmentConfigService',
          `Retrieve from configService failed. Param ${param} not found`,
        );
      }
    }

    console.log(
      'EnvironmentConfigService',
      `Param ${param} not found. Retrieve from param store...`,
    );

    //return this.paramStoreService.get(param);
  }

  private retrieveNumberParam(param: string): number {
    if (isLocal() || isTest()) {
      const envParam = this.configService.get<number>(param);

      if (envParam !== undefined) {
        return envParam;
      }
    }

    // return this.paramStoreService.getAsNumber(param);
  }
}
