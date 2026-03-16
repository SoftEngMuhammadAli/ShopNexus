"use client";

import React from "react";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Button } from "@/components/ui/button";
import Link from "next/link";
import { useRouter } from "next/navigation";

const LoginPage = () => {
  const router = useRouter();

  const handleLogin = (e) => {
    e.preventDefault();
    router.push("/dashboard");
  };

  return (
    <div className="min-h-screen grid grid-cols-1 md:grid-cols-2">
      {/* Left Section */}
      <div className="hidden md:flex flex-col justify-center bg-red-500 p-10 text-white">
        <div className="mx-auto max-w-md space-y-4">
          <h1 className="text-4xl font-bold">Welcome to ShopBiz</h1>
          <p className="text-sm leading-6 text-white/90">
            Discover great products, manage your cart easily, and enjoy a clean
            shopping experience built for learning and growth.
          </p>
        </div>
      </div>

      {/* Right Section */}
      <div className="flex items-center justify-center bg-white px-6 py-10">
        <div className="w-full max-w-md space-y-6 rounded-2xl border border-slate-200 bg-white p-8 shadow-sm">
          <div className="space-y-2 text-center">
            <h2 className="text-3xl font-bold text-slate-900">Login</h2>
            <p className="text-sm text-slate-500">
              Enter your email and password to access your account
            </p>
          </div>

          <form onSubmit={handleLogin} className="space-y-5">
            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <Input
                id="email"
                type="email"
                placeholder="Enter your email"
                className="h-11"
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="password">Password</Label>
              <Input
                id="password"
                type="password"
                placeholder="Enter your password"
                className="h-11"
              />
            </div>

            <div className="text-right text-sm">
              <Link
                href="/forgot-password"
                className="text-red-500 hover:text-red-600"
              >
                Forgot your password?
              </Link>
            </div>

            <Button type="submit" className="w-full h-11">
              Login
            </Button>
          </form>

          <div className="text-center text-sm text-slate-600">
            <p>
              Don&apos;t have an account?{" "}
              <Link
                href="/register"
                className="font-medium text-red-500 hover:text-red-600"
              >
                Register
              </Link>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default LoginPage;
