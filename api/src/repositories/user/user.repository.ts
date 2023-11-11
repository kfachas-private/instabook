import { Inject, Injectable } from '@nestjs/common';
import { PrismaService } from '../../modules/prisma/prisma.service';
import { Prisma, User } from '@prisma/client';

@Injectable()
export class DatabaseUserRepository {
  constructor(
    @Inject(PrismaService)
    private readonly prisma: PrismaService,
  ) {}

  createUser(data: Prisma.UserCreateInput): void {
    this.prisma.user.create({ data });

    return;
  }

  async getUserById(args: Prisma.UserFindUniqueArgs): Promise<User> {
    return this.prisma.user.findUnique(args);
  }
}
