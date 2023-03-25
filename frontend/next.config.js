/** @type {import('next').NextConfig} */
const nextConfig = {
  async rewrites() {
    if (process.env.NODE_ENV !== "production") {
      return [
        {
          source: "/api/:path*",
          destination: "http://localhost:4000/:path*",
        },
      ];
    }
    return [];
  },
  experimental: {
    appDir: true,
  },
};

module.exports = nextConfig;
