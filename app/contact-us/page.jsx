"use client";

import React, { useState } from "react";
import {
  MapPin,
  Phone,
  Mail,
  Facebook,
  Youtube,
  MessageCircle,
  Send,
} from "lucide-react";

const ContactUsPage = () => {
  const contactData = {
    title: "Contact Us",
    description:
      "Thank you for your interest in ShopNexus. We are here to help you with any questions or concerns you may have. Please fill out the form below to get in touch with us.",
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
    {
      name: "Facebook",
      href: contactData.facebook || "#",
      icon: <Facebook className="h-5 w-5" />,
    },
    {
      name: "YouTube",
      href: contactData.youtube || "#",
      icon: <Youtube className="h-5 w-5" />,
    },
    {
      name: "WhatsApp",
      href: contactData.whatsapp || "#",
      icon: <MessageCircle className="h-5 w-5" />,
    },
    {
      name: "Telegram",
      href: contactData.telegram || "#",
      icon: <Send className="h-5 w-5" />,
    },
  ];

  const [formData, setFormData] = useState({
    name: "",
    email: "",
    subject: "",
    message: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("Submitted Data:", formData);

    setFormData({
      name: "",
      email: "",
      subject: "",
      message: "",
    });
  };

  return (
    <div className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
      <div className="mx-auto max-w-7xl">
        <div className="mb-12 text-center">
          <h1 className="text-4xl font-bold text-gray-900 sm:text-5xl">
            {contactData.title}
          </h1>
          <p className="mx-auto mt-4 max-w-2xl text-lg text-gray-600">
            {contactData.description}
          </p>
        </div>

        <div className="grid gap-10 lg:grid-cols-2">
          {/* Left Section */}
          <div className="space-y-6 rounded-2xl bg-white p-8 shadow-md">
            <h2 className="text-2xl font-semibold text-gray-900">
              Get in Touch
            </h2>
            <p className="text-gray-600">
              Feel free to contact us through any of the following channels.
            </p>

            <div className="space-y-5">
              <div className="flex items-start gap-4">
                <div className="rounded-full bg-blue-100 p-3 text-blue-600">
                  <MapPin className="h-5 w-5" />
                </div>
                <div>
                  <h3 className="font-medium text-gray-900">Address</h3>
                  <p className="text-gray-600">{contactData.address}</p>
                </div>
              </div>

              <div className="flex items-start gap-4">
                <div className="rounded-full bg-green-100 p-3 text-green-600">
                  <Phone className="h-5 w-5" />
                </div>
                <div>
                  <h3 className="font-medium text-gray-900">Phone</h3>
                  <a
                    href={`tel:${contactData.phone}`}
                    className="text-gray-600 hover:text-blue-600"
                  >
                    {contactData.phone}
                  </a>
                </div>
              </div>

              <div className="flex items-start gap-4">
                <div className="rounded-full bg-red-100 p-3 text-red-600">
                  <Mail className="h-5 w-5" />
                </div>
                <div>
                  <h3 className="font-medium text-gray-900">Email</h3>
                  <a
                    href={`mailto:${contactData.email}`}
                    className="text-gray-600 hover:text-blue-600"
                  >
                    {contactData.email}
                  </a>
                </div>
              </div>
            </div>

            <div className="pt-4">
              <h3 className="mb-4 text-lg font-semibold text-gray-900">
                Follow Us
              </h3>
              <div className="flex flex-wrap gap-3">
                {socialLinks.map((social) => (
                  <a
                    key={social.name}
                    href={social.href}
                    target="_blank"
                    rel="noreferrer"
                    className="flex items-center gap-2 rounded-xl border border-gray-200 px-4 py-2 text-sm font-medium text-gray-700 transition hover:border-blue-500 hover:bg-blue-50 hover:text-blue-600"
                  >
                    {social.icon}
                    <span>{social.name}</span>
                  </a>
                ))}
              </div>
            </div>
          </div>

          {/* Right Section */}
          <div className="rounded-2xl bg-white p-8 shadow-md">
            <h2 className="mb-6 text-2xl font-semibold text-gray-900">
              Send Us a Message
            </h2>

            <form onSubmit={handleSubmit} className="space-y-5">
              <div>
                <label className="mb-2 block text-sm font-medium text-gray-700">
                  Full Name
                </label>
                <input
                  type="text"
                  name="name"
                  value={formData.name}
                  onChange={handleChange}
                  placeholder="Enter your full name"
                  className="w-full rounded-xl border border-gray-300 px-4 py-3 outline-none transition focus:border-blue-500 focus:ring-2 focus:ring-blue-200"
                  required
                />
              </div>

              <div>
                <label className="mb-2 block text-sm font-medium text-gray-700">
                  Email Address
                </label>
                <input
                  type="email"
                  name="email"
                  value={formData.email}
                  onChange={handleChange}
                  placeholder="Enter your email"
                  className="w-full rounded-xl border border-gray-300 px-4 py-3 outline-none transition focus:border-blue-500 focus:ring-2 focus:ring-blue-200"
                  required
                />
              </div>

              <div>
                <label className="mb-2 block text-sm font-medium text-gray-700">
                  Subject
                </label>
                <input
                  type="text"
                  name="subject"
                  value={formData.subject}
                  onChange={handleChange}
                  placeholder="Enter subject"
                  className="w-full rounded-xl border border-gray-300 px-4 py-3 outline-none transition focus:border-blue-500 focus:ring-2 focus:ring-blue-200"
                  required
                />
              </div>

              <div>
                <label className="mb-2 block text-sm font-medium text-gray-700">
                  Message
                </label>
                <textarea
                  name="message"
                  rows="5"
                  value={formData.message}
                  onChange={handleChange}
                  placeholder="Write your message..."
                  className="w-full rounded-xl border border-gray-300 px-4 py-3 outline-none transition focus:border-blue-500 focus:ring-2 focus:ring-blue-200"
                  required
                />
              </div>

              <button
                type="submit"
                className="w-full rounded-xl bg-blue-600 px-6 py-3 font-semibold text-white transition hover:bg-blue-700"
              >
                Send Message
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ContactUsPage;
