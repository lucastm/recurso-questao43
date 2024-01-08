import java.util.concurrent.Semaphore;

public class Compute implements Runnable {
    static int shared = 0;
    Semaphore semaphore; int id=0;

    public Compute(Semaphore semaphore) {
        this.semaphore = semaphore; this.id = ++Compute.shared;
    }
    public void run() {
        try {
            if (id % 2 == 0) {
                semaphore.acquire();
                for (int i = 0; i < 2; i++) {
                    System.out.print(Integer.toString(id) + (++Compute.shared));
                    Thread.sleep(10);
                }
                semaphore.release();
            } else {
                semaphore.acquire();
                for (int i = 0; i < 2; i++) {
                    System.out.print(Integer.toString(id) + (--Compute.shared));
                    Thread.sleep(10);
                }
                semaphore.release();
            }
        }catch(InterruptedException e) { e.printStackTrace();}
    }
    public static void main(String args[]) throws InterruptedException {
        Semaphore semaphore = new Semaphore(1);
        Thread dt1 = new Thread(new Compute(semaphore));
        Thread dt2 = new Thread(new Compute(semaphore));
        dt1.start(); dt2.start();
        dt1.join(); dt2.join();
    }
}
