"use client";

import { Button } from "@/components/ui/button";
import { useRouter } from "next/navigation";

export default function Home() {
  const router = useRouter();
  return (
    <div className="relative min-h-screen overflow-hidden bg-slate-950 text-white">
      {/* Background Glow */}
      <div className="absolute inset-0 -z-10 overflow-hidden">
        <div className="absolute left-10 top-16 h-72 w-72 rounded-full bg-cyan-500/20 blur-3xl" />
        <div className="absolute bottom-10 right-10 h-72 w-72 rounded-full bg-emerald-500/20 blur-3xl" />
        <div className="absolute left-1/2 top-1/3 h-80 w-80 -translate-x-1/2 rounded-full bg-violet-500/10 blur-3xl" />
      </div>

      {/* Navbar */}
      <header className="border-b border-white/10 bg-white/5 backdrop-blur-xl">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">
          <div>
            <h1 className="text-2xl font-bold tracking-tight">
              ShopNexus<span className="text-cyan-400">.</span>
            </h1>
            <p className="text-xs text-slate-400">
              Smart commerce dashboard experience
            </p>
          </div>

          <div className="flex items-center gap-3">
            <Button
              onClick={() => {
                router.push("/login");
              }}
              className="rounded-xl border border-white/10 bg-white/5 px-4 py-2 text-sm font-medium text-slate-200 transition hover:bg-white/10"
            >
              Login
            </Button>
            <Button
              onClick={() => {
                router.push("/register");
              }}
              className="rounded-xl bg-cyan-500 px-4 py-2 text-sm font-semibold text-slate-950 transition hover:bg-cyan-400"
            >
              Sign Up
            </Button>
          </div>
        </div>
      </header>

      {/* Hero */}
      <section className="mx-auto grid max-w-7xl grid-cols-1 gap-12 px-6 py-14 lg:grid-cols-2 lg:items-center">
        {/* Left Content */}
        <div>
          <span className="inline-flex rounded-full border border-cyan-400/20 bg-cyan-400/10 px-3 py-1 text-xs font-medium text-cyan-300">
            Ecommerce Admin Dashboard
          </span>

          <h2 className="mt-6 text-4xl font-bold leading-tight md:text-5xl lg:text-6xl">
            Power your online store with smarter sales, inventory, and order
            management
          </h2>

          <p className="mt-5 max-w-2xl text-base leading-7 text-slate-400 md:text-lg">
            ShopNexus helps brands, sellers, and store managers track revenue,
            monitor customer activity, manage products, and stay on top of
            orders from one beautiful dashboard.
          </p>

          <div className="mt-8 flex flex-wrap gap-4">
            <button className="rounded-2xl bg-cyan-500 px-6 py-3 font-semibold text-slate-950 transition hover:bg-cyan-400">
              Start Selling
            </button>
            <button className="rounded-2xl border border-white/10 bg-white/5 px-6 py-3 font-semibold text-white transition hover:bg-white/10">
              Explore Dashboard
            </button>
          </div>

          {/* Quick Stats */}
          <div className="mt-10 grid grid-cols-2 gap-4 sm:grid-cols-4">
            <div className="rounded-2xl border border-white/10 bg-white/5 p-4 backdrop-blur-md">
              <h3 className="text-2xl font-bold">$84.2K</h3>
              <p className="mt-1 text-sm text-slate-400">Monthly Revenue</p>
            </div>

            <div className="rounded-2xl border border-white/10 bg-white/5 p-4 backdrop-blur-md">
              <h3 className="text-2xl font-bold">2.4K</h3>
              <p className="mt-1 text-sm text-slate-400">Orders</p>
            </div>

            <div className="rounded-2xl border border-white/10 bg-white/5 p-4 backdrop-blur-md">
              <h3 className="text-2xl font-bold">18.6K</h3>
              <p className="mt-1 text-sm text-slate-400">Customers</p>
            </div>

            <div className="rounded-2xl border border-white/10 bg-white/5 p-4 backdrop-blur-md">
              <h3 className="text-2xl font-bold">320</h3>
              <p className="mt-1 text-sm text-slate-400">Products</p>
            </div>
          </div>
        </div>

        {/* Right Dashboard Preview */}
        <div className="rounded-[28px] border border-white/10 bg-white/5 p-4 shadow-2xl backdrop-blur-xl">
          <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
            {/* Revenue Card */}
            <div className="rounded-2xl border border-white/10 bg-slate-900/80 p-5">
              <p className="text-sm text-slate-400">Total Sales</p>
              <h3 className="mt-2 text-3xl font-bold">$48,920</h3>
              <p className="mt-2 text-sm text-emerald-400">
                +12.8% from last month
              </p>
            </div>

            {/* Orders Card */}
            <div className="rounded-2xl border border-white/10 bg-slate-900/80 p-5">
              <p className="text-sm text-slate-400">Orders Today</p>
              <h3 className="mt-2 text-3xl font-bold">186</h3>
              <p className="mt-2 text-sm text-cyan-400">+8.2% from yesterday</p>
            </div>

            {/* Store Performance */}
            <div className="rounded-2xl border border-white/10 bg-slate-900/80 p-5 md:col-span-2">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm text-slate-400">Store Performance</p>
                  <h3 className="mt-1 text-xl font-semibold">
                    Weekly Ecommerce Overview
                  </h3>
                </div>
                <span className="rounded-full bg-emerald-500/10 px-3 py-1 text-xs font-medium text-emerald-400">
                  Live
                </span>
              </div>

              <div className="mt-6 space-y-4">
                <div>
                  <div className="mb-2 flex justify-between text-sm">
                    <span className="text-slate-300">Sales Goal</span>
                    <span className="text-slate-400">82%</span>
                  </div>
                  <div className="h-3 rounded-full bg-white/10">
                    <div className="h-3 w-[82%] rounded-full bg-cyan-500" />
                  </div>
                </div>

                <div>
                  <div className="mb-2 flex justify-between text-sm">
                    <span className="text-slate-300">Inventory Filled</span>
                    <span className="text-slate-400">74%</span>
                  </div>
                  <div className="h-3 rounded-full bg-white/10">
                    <div className="h-3 w-[74%] rounded-full bg-violet-500" />
                  </div>
                </div>

                <div>
                  <div className="mb-2 flex justify-between text-sm">
                    <span className="text-slate-300">Customer Retention</span>
                    <span className="text-slate-400">91%</span>
                  </div>
                  <div className="h-3 rounded-full bg-white/10">
                    <div className="h-3 w-[91%] rounded-full bg-emerald-500" />
                  </div>
                </div>
              </div>
            </div>

            {/* Recent Orders / Activity */}
            <div className="rounded-2xl border border-white/10 bg-slate-900/80 p-5 md:col-span-2">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm text-slate-400">Recent Orders</p>
                  <h3 className="mt-1 text-xl font-semibold">
                    Latest Activity
                  </h3>
                </div>
                <button className="text-sm text-cyan-400 hover:text-cyan-300">
                  View All
                </button>
              </div>

              <div className="mt-5 space-y-4">
                <div className="flex items-center justify-between rounded-xl bg-white/5 p-3">
                  <div>
                    <p className="font-medium">New order placed</p>
                    <p className="text-sm text-slate-400">
                      Order #SNX-2048 for Wireless Headphones
                    </p>
                  </div>
                  <span className="text-xs text-slate-500">2m ago</span>
                </div>

                <div className="flex items-center justify-between rounded-xl bg-white/5 p-3">
                  <div>
                    <p className="font-medium">Inventory updated</p>
                    <p className="text-sm text-slate-400">
                      Sneakers collection stock increased by 48 units
                    </p>
                  </div>
                  <span className="text-xs text-slate-500">18m ago</span>
                </div>

                <div className="flex items-center justify-between rounded-xl bg-white/5 p-3">
                  <div>
                    <p className="font-medium">Payment received</p>
                    <p className="text-sm text-slate-400">
                      $1,240 received from customer checkout batch
                    </p>
                  </div>
                  <span className="text-xs text-slate-500">1h ago</span>
                </div>

                <div className="flex items-center justify-between rounded-xl bg-white/5 p-3">
                  <div>
                    <p className="font-medium">Product review submitted</p>
                    <p className="text-sm text-slate-400">
                      New 5-star review added for Premium Smart Watch
                    </p>
                  </div>
                  <span className="text-xs text-slate-500">3h ago</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
