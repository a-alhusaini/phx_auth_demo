import Link from "next/link";
export default function Navbar() {
  return (
    <nav>
      <h1>Hello Hello Hello!</h1>
      <Link href={"/hello"} />
    </nav>
  );
}
