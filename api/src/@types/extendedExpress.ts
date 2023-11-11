export interface IContext {
  correlationId?: string;
  role?: boolean;
  name?: string;
  userId?: string;
}

declare global {
  // eslint-disable-next-line @typescript-eslint/no-namespace
  namespace Express {
    interface Request {
      ctx?: IContext;
    }
  }
}

export {};
