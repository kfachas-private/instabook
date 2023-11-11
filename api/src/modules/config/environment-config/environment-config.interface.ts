export interface EnvironmentConfig {
  getDatabaseHost(): string;
  getDatabasePort(): number;
  getDatabaseUser(): string;
  getDatabasePassword(): string;
  getDatabaseName(): string;

  getNotifierUrl(): string;
  getNotifierName(): string;
  getNotifierPassword(): string;
  getAwsS3Bucket(): string;

  getFirebaseDatabaseURL(): string;
  getFirebaseProjectId(): string;
  getFirebaseClientEmail(): string;
  getFirebasePrivateKey(): string;
}
