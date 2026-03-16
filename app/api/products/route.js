import { NextResponse } from "next/server";
import { connectDB } from "@/lib/db";
import Product from "@/models/Product";

export async function GET() {
  try {
    await connectDB();

    const products = await Product.find({}).sort({ createdAt: -1 });

    return NextResponse.json(
      {
        success: true,
        message: "Products fetched successfully",
        products,
      },
      { status: 200 },
    );
  } catch (error) {
    return NextResponse.json(
      {
        success: false,
        message: "Failed to fetch products",
        error: error.message,
      },
      { status: 500 },
    );
  }
}

export async function POST(req) {
  try {
    await connectDB();

    const body = await req.json();
    const { name, slug, description, price, category, image, stock, brand } =
      body;

    if (!name || !slug || !description || !price || !category) {
      return NextResponse.json(
        {
          success: false,
          message: "Name, slug, description, price, and category are required",
        },
        { status: 400 },
      );
    }

    const existingProduct = await Product.findOne({ slug });

    if (existingProduct) {
      return NextResponse.json(
        {
          success: false,
          message: "Product with this slug already exists",
        },
        { status: 409 },
      );
    }

    const product = await Product.create({
      name,
      slug,
      description,
      price,
      category,
      image,
      stock,
      brand,
    });

    return NextResponse.json(
      {
        success: true,
        message: "Product created successfully",
        product,
      },
      { status: 201 },
    );
  } catch (error) {
    return NextResponse.json(
      {
        success: false,
        message: "Failed to create product",
        error: error.message,
      },
      { status: 500 },
    );
  }
}
