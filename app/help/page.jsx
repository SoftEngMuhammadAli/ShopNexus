import React from "react";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";

const HelpPage = () => {
  const faqs = [
    {
      title: "What is ShopNexus?",
      description:
        "ShopNexus is an e-commerce platform that allows you to sell your products online.",
    },
    {
      title: "How do I create an account?",
      description:
        "To create an account, click on the 'Sign Up' button and follow the instructions.",
    },
    {
      title: "How do I make a purchase?",
      description:
        "To make a purchase, select the products you want, add them to your cart, and proceed to checkout.",
    },
    {
      title: "How do I return a product?",
      description:
        "To return a product, go to your order history and click on the 'Return' button.",
    },
    {
      title: "How do I cancel an order?",
      description:
        "To cancel an order, go to your order history and click on the 'Cancel' button.",
    },
    {
      title: "How do I track my order?",
      description:
        "To track your order, go to your order history and click on the 'Track' button.",
    },
    {
      title: "How do I change my order?",
      description:
        "To change your order, go to your order history and click on the 'Change' button.",
    },
  ];

  return (
    <section className="min-h-screen bg-white px-4 py-12 md:px-8">
      <div className="mx-auto max-w-4xl">
        <div className="mb-10 text-center">
          <h1 className="text-4xl font-bold text-slate-900">Help Center</h1>
          <p className="mt-3 text-sm text-slate-500 md:text-base">
            Find answers to the most common questions about ShopNexus.
          </p>
        </div>

        <div className="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm md:p-8">
          <Accordion type="single" collapsible className="w-full">
            {faqs.map((faq, index) => (
              <AccordionItem key={index} value={`item-${index}`}>
                <AccordionTrigger className="text-left text-base font-medium text-slate-800">
                  {faq.title}
                </AccordionTrigger>
                <AccordionContent className="text-sm leading-6 text-slate-600">
                  {faq.description}
                </AccordionContent>
              </AccordionItem>
            ))}
          </Accordion>
        </div>
      </div>
    </section>
  );
};

export default HelpPage;
