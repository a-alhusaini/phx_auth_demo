import Link from "next/link";
export default function Navbar() {
  return (
    <nav className="flex gap-2 text-2xl pt-2 mb-6">
      <Link href={"/signup"}>Sign Up</Link>
      <Link href={"/signin"}>Sign In</Link>
      <Link href={"/profile"}>Profile</Link>
      <Link href={"/admin"}>Admin</Link>
    </nav>
  );
}
