"use client";

import React from "react";
import Image from "next/image";
import Link from "next/link";
import { Button } from "../../../components/ui/button";
import { useSession } from "@/lib/auth/authClient";
import SignOutButton from "../ui/SignOutButton";

const navLinks = [
  { href: "/", label: "Home" },
  { href: "/products", label: "Products" },
  { href: "/cart", label: "Cart" },
  { href: "/about", label: "About" },
  { href: "/contact-us", label: "Contact" },
  { href: "/help", label: "Help" },
];

const NavBar = () => {
  const { data: session } = useSession();

  return (
    <header className="w-full border-b border-slate-200 bg-white">
      <nav className="mx-auto flex max-w-7xl items-center justify-between px-4 py-4 md:px-6">
        <Link href="/" className="flex items-center">
          <Image
            src="/vercel.svg"
            alt="ShopNexus"
            width={100}
            height={40}
            className="h-auto w-auto object-contain"
            priority
          />
        </Link>

        <div className="flex items-center gap-6">
          <ul className="flex items-center gap-4 md:gap-6">
            {navLinks.map((link) => (
              <li key={link.href}>
                <Link
                  href={link.href}
                  className="text-sm font-medium text-slate-700 transition-colors hover:cursor-pointer hover:text-black hover:underline hover:underline-offset-4"
                >
                  {link.label}
                </Link>
              </li>
            ))}
          </ul>

          {session?.user ? (
            <div className="flex items-center gap-2">
              <SignOutButton />
            </div>
          ) : (
            <div className="flex items-center gap-2">
              <Link href="/login">
                <Button className="px-6 py-2 hover:cursor-pointer hover:bg-primary/80">
                  Login
                </Button>
              </Link>
              <Link href="/register">
                <Button className="px-6 py-2 hover:cursor-pointer hover:bg-primary/80">
                  Register
                </Button>
              </Link>
            </div>
          )}
        </div>
      </nav>
    </header>
  );
};

export default NavBar;
