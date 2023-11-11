import * as process from 'process';

import { Seeder } from 'nestjs-seeder';

export abstract class OmedoSeeder implements Seeder {
  name: string = this.constructor.name;
  maxFake: number;

  abstract drop(): Promise<any>;

  abstract seed(): Promise<any>;

  log(index: number): void {
    const percentage = (index / this.maxFake) * 100;
    const isFinished = (index / (this.maxFake - 1)) * 100 === 100;
    percentage % 5 === 0 && printProgress(this.name, percentage, isFinished);
  }
}

function printProgress(name: string, progress: number, isFinished: boolean): void {
  process.stdout.clearLine(-1);
  process.stdout.cursorTo(0);
  process.stdout.write(`${name} => Progress ${progress}% ${isFinished ? '\n' : ''}`);
}
