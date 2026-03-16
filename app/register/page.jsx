import React from "react";
import Link from "next/link";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Button } from "@/components/ui/button";

const RegisterPage = () => {
  return (
    <div className="min-h-screen grid grid-cols-1 md:grid-cols-2">
      {/* Left Section */}
      <div className="hidden md:flex flex-col justify-center bg-red-500 p-10 text-white">
        <div className="mx-auto max-w-md space-y-4">
          <h1 className="text-4xl font-bold">Join ShopBiz</h1>
          <p className="text-sm leading-6 text-white/90">
            Create your account to start shopping, save your favorite products,
            and manage your orders in one place.
          </p>
        </div>
      </div>

      {/* Right Section */}
      <div className="flex items-center justify-center bg-white px-6 py-10">
        <div className="w-full max-w-md space-y-6 rounded-2xl border border-slate-200 bg-white p-8 shadow-sm">
          <div className="space-y-2 text-center">
            <h2 className="text-3xl font-bold text-slate-900">Register</h2>
            <p className="text-sm text-slate-500">
              Fill in your details to create a new account
            </p>
          </div>

          <form className="space-y-5">
            <div className="space-y-2">
              <Label htmlFor="name">Full Name</Label>
              <Input
                className="p-5"
                id="name"
                type="text"
                placeholder="Enter your full name"
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <Input
                className="p-5"
                id="email"
                type="email"
                placeholder="Enter your email"
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="password">Password</Label>
              <Input
                className="p-5"
                id="password"
                type="password"
                placeholder="Enter your password"
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="confirmPassword">Confirm Password</Label>
              <Input
                className="p-5"
                id="confirmPassword"
                type="password"
                placeholder="Confirm your password"
              />
            </div>

            <Button className="w-full p-5">Create Account</Button>
          </form>

          <p className="text-center text-sm text-slate-500">
            Already have an account?{" "}
            <Link
              href="/login"
              className="font-medium text-red-500 hover:text-red-600"
            >
              Login
            </Link>
          </p>
        </div>
      </div>
    </div>
  );
};

export default RegisterPage;
