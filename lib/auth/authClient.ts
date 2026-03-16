import { createAuthClient } from "better-auth/react";
const baseURL =
  process.env.NEXT_PUBLIC_BETTER_AUTH_URL ||
  process.env.NEXT_PUBLIC_BASE_URL ||
  process.env.BETTER_AUTH_URL ||
  "";

export const authClient = createAuthClient({
  baseURL,
});

export const { signIn, signUp, signOut, useSession } = authClient;
