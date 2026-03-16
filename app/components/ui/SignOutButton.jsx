"use client";

import React from "react";
import { Button } from "@/components/ui/button";
import { signOut } from "@/lib/auth/authClient";
import { useRouter } from "next/navigation";

const SignOutButton = () => {
  const router = useRouter();

  const handleSignOut = async () => {
    try {
      const result = await signOut();

      if (result?.data || result?.success) {
        router.push("/login");
        router.refresh();
      } else {
        alert("Error signing out");
      }
    } catch (error) {
      console.error("Sign out failed:", error);
      alert("Error signing out");
    }
  };

  return (
    <Button
      onClick={handleSignOut}
      className="px-6 py-2 hover:cursor-pointer hover:bg-primary/80"
    >
      Logout
    </Button>
  );
};

export default SignOutButton;
