Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 30 Jun 2020 22:25:15 +0100
Message-Id: <20200630212515.1132791-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_close_race: Mix in a contexts and
 a small delay to closure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Keep the old handles in a small ring so that we build up a small amount
of pressure for i915_gem_close_object() and throw in a few concurrent
contexts so we have to process an obj->lut_list containing more than one
element. And to make sure the list is truly long enough to schedule,
start leaking the contexts.

Note that the only correctness check is that the selfcopy doesn't
explode; the challenge would be to prove that the old handles are no
longer accessible via the execbuf lut. However, this is sufficient to
make sure we at least hit the interruptible spinlock used by
close-objects.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 tests/i915/gem_close_race.c | 68 +++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 15 deletions(-)

diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index db570e8fd..4b72d353c 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -55,7 +55,7 @@ static bool has_64bit_relocations;
 
 #define sigev_notify_thread_id _sigev_un._tid
 
-static void selfcopy(int fd, uint32_t handle, int loops)
+static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
 {
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 gem_exec[2];
@@ -113,6 +113,7 @@ static void selfcopy(int fd, uint32_t handle, int loops)
 	execbuf.batch_len = (b - buf) * sizeof(*b);
 	if (HAS_BLT_RING(devid))
 		execbuf.flags |= I915_EXEC_BLT;
+	execbuf.rsvd1 = ctx;
 
 	memset(&gem_pwrite, 0, sizeof(gem_pwrite));
 	gem_pwrite.handle = create.handle;
@@ -135,7 +136,7 @@ static uint32_t load(int fd)
 	if (handle == 0)
 		return 0;
 
-	selfcopy(fd, handle, 100);
+	selfcopy(fd, 0, handle, 100);
 	return handle;
 }
 
@@ -165,14 +166,19 @@ static void crashme_now(int sig)
 #define usec(x) (1000*(x))
 #define msec(x) usec(1000*(x))
 
-static void threads(int timeout)
+static void thread(int fd, struct drm_gem_open name,
+		   int timeout, unsigned int flags)
+#define CONTEXTS 0x1
 {
 	struct sigevent sev;
 	struct sigaction act;
-	struct drm_gem_open name;
 	struct itimerspec its;
+	uint32_t *history;
+#define N_HISTORY (256)
 	timer_t timer;
-	int fd;
+
+	history = malloc(sizeof(*history) * N_HISTORY);
+	igt_assert(history);
 
 	memset(&act, 0, sizeof(act));
 	act.sa_handler = crashme_now;
@@ -184,28 +190,57 @@ static void threads(int timeout)
 	sev.sigev_signo = SIGRTMIN;
 	igt_assert(timer_create(CLOCK_MONOTONIC, &sev, &timer) == 0);
 
-	fd = drm_open_driver(DRIVER_INTEL);
-	name.name = gem_flink(fd, gem_create(fd, OBJECT_SIZE));
-
 	igt_until_timeout(timeout) {
-		crashme.fd = drm_open_driver(DRIVER_INTEL);
+		unsigned int n = 0;
+
+		memset(history, 0, sizeof(*history) * N_HISTORY);
+
+		crashme.fd = gem_reopen_driver(fd);
 
 		memset(&its, 0, sizeof(its));
-		its.it_value.tv_nsec = msec(1) + (rand() % msec(10));
+		its.it_value.tv_nsec = msec(1) + (rand() % msec(150));
 		igt_assert(timer_settime(timer, 0, &its, NULL) == 0);
 
 		do {
-			if (drmIoctl(crashme.fd, DRM_IOCTL_GEM_OPEN, &name))
+			uint32_t ctx = 0;
+
+			if (drmIoctl(crashme.fd,
+				     DRM_IOCTL_GEM_OPEN,
+				     &name))
 				break;
 
-			selfcopy(crashme.fd, name.handle, 100);
-			drmIoctl(crashme.fd, DRM_IOCTL_GEM_CLOSE, &name.handle);
+			if (flags & CONTEXTS)
+				__gem_context_create(crashme.fd, &ctx);
+
+			selfcopy(crashme.fd, ctx, name.handle, 1);
+
+			ctx = history[n % N_HISTORY];
+			if (ctx)
+				drmIoctl(crashme.fd,
+					 DRM_IOCTL_GEM_CLOSE,
+					 &ctx);
+			history[n % N_HISTORY] = name.handle;
+			n++;
 		} while (1);
 
 		close(crashme.fd);
 	}
 
 	timer_delete(timer);
+	free(history);
+}
+
+static void threads(int timeout, unsigned int flags)
+{
+	struct drm_gem_open name;
+	int fd;
+
+	fd = drm_open_driver(DRIVER_INTEL);
+	name.name = gem_flink(fd, gem_create(fd, OBJECT_SIZE));
+
+	igt_fork(child, sysconf(_SC_NPROCESSORS_ONLN))
+		thread(fd, name, timeout, flags);
+	igt_waitchildren();
 
 	gem_quiescent_gpu(fd);
 	close(fd);
@@ -233,7 +268,7 @@ igt_main
 	}
 
 	igt_subtest("basic-threads")
-		threads(1);
+		threads(1, 0);
 
 	igt_subtest("process-exit") {
 		igt_fork(child, 768)
@@ -241,8 +276,11 @@ igt_main
 		igt_waitchildren();
 	}
 
+	igt_subtest("contexts")
+		threads(30, CONTEXTS);
+
 	igt_subtest("gem-close-race")
-		threads(150);
+		threads(150, 0);
 
 	igt_fixture
 	    igt_stop_hang_detector();
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
