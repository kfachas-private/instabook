import { Module } from '@nestjs/common';
import { HttpModule } from '@nestjs/axios';
import { ConversationService } from './conversation.service';
import { ConversationController } from './conversation.controller';

@Module({
  imports: [HttpModule],
  controllers: [ConversationController],
  providers: [ConversationService],
})
export class ConversationModule {}
