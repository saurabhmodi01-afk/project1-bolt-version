import Navbar from '@/components/Navbar';
import Hero from '@/components/Hero';
import About from '@/components/About';
import Tracks from '@/components/Tracks';
import Schedule from '@/components/Schedule';
import Prizes from '@/components/Prizes';
import Sponsors from '@/components/Sponsors';
import Register from '@/components/Register';
import Footer from '@/components/Footer';

function App() {
  return (
    <div className="relative min-h-screen bg-marvel-ink text-marvel-bone overflow-x-hidden">
      <Navbar />
      <main>
        <Hero />
        <About />
        <Tracks />
        <Schedule />
        <Prizes />
        <Sponsors />
        <Register />
      </main>
      <Footer />
    </div>
  );
}

export default App;
