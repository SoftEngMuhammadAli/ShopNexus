import React from "react";
import Link from "next/link";

const AboutPage = () => {
  const aboutData = {
    title: "About Us",
    description:
      "ShopNexus is built to create a smooth and modern e-commerce experience for everyone. Our goal is to help users discover products easily, shop with confidence, and enjoy a clean and user-friendly interface. We focus on simplicity, speed, and a better digital shopping journey.",
    address: "123 Main St, Anytown, USA",
    phone: "123-456-7890",
    email: "contact@shopnexus.com",
    facebook: "https://www.facebook.com/shopnexus",
    twitter: "https://twitter.com/shopnexus",
    instagram: "https://www.instagram.com/shopnexus",
    youtube: "https://www.youtube.com/shopnexus",
    linkedin: "https://www.linkedin.com/shopnexus",
    whatsapp: "https://www.whatsapp.com/",
    telegram: "https://web.telegram.org/",
  };

  const socialLinks = [
    { name: "Facebook", href: aboutData.facebook || "#" },

    {
      name: "YouTube",
      href: aboutData.youtube || "#",
    },
  ];

  return (
    <section className="min-h-screen bg-white px-4 py-12 md:px-8">
      <div className="mx-auto max-w-5xl space-y-10">
        <div className="space-y-4 text-center">
          <h1 className="text-4xl font-bold text-slate-900">
            {aboutData.title}
          </h1>
          <p className="mx-auto max-w-3xl text-sm leading-7 text-slate-600 md:text-base">
            {aboutData.description}
          </p>
        </div>

        <div className="grid gap-6 md:grid-cols-2">
          <div className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <h2 className="mb-4 text-2xl font-semibold text-slate-900">
              Contact Information
            </h2>

            <div className="space-y-3 text-sm text-slate-600">
              <p>
                <span className="font-medium text-slate-900">Address:</span>{" "}
                {aboutData.address}
              </p>
              <p>
                <span className="font-medium text-slate-900">Phone:</span>{" "}
                {aboutData.phone}
              </p>
              <p>
                <span className="font-medium text-slate-900">Email:</span>{" "}
                {aboutData.email}
              </p>
            </div>
          </div>

          <div className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <h2 className="mb-4 text-2xl font-semibold text-slate-900">
              Follow Us
            </h2>

            <div className="flex flex-wrap gap-3">
              {socialLinks.map((link) => (
                <Link
                  key={link.name}
                  href={link.href}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="rounded-full border border-slate-200 px-4 py-2 text-sm text-slate-700 transition hover:border-slate-900 hover:text-slate-900"
                >
                  <div className="flex items-center gap-2">
                    <span>{link.name}</span>
                    {/* {link.icon} */}
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default AboutPage;
