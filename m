Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  5 May 2020 11:27:02 +0100
Message-Id: <20200505102702.2607265-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_exec: Exploit resource
 contention to verify execbuf independence
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

Even if one client is blocked on a resource, that should not impact
another client.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_ctx_exec.c | 122 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index ad2f9e545..97a1e0d32 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -35,8 +35,9 @@
 #include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
+#include <sys/poll.h>
+#include <sys/stat.h>
 #include <sys/time.h>
 
 #include <drm.h>
@@ -331,6 +332,122 @@ static void nohangcheck_hostile(int i915)
 	close(i915);
 }
 
+static void kill_children(int sig)
+{
+	sighandler_t old;
+
+	old = signal(sig, SIG_IGN);
+	kill(-getpgrp(), sig);
+	signal(sig, old);
+}
+
+static bool has_persistence(int i915)
+{
+	struct drm_i915_gem_context_param p = {
+		.param = I915_CONTEXT_PARAM_PERSISTENCE,
+	};
+	uint64_t saved;
+
+	if (__gem_context_get_param(i915, &p))
+		return false;
+
+	saved = p.value;
+	p.value = 0;
+	if (__gem_context_set_param(i915, &p))
+		return false;
+
+	p.value = saved;
+	return __gem_context_set_param(i915, &p) == 0;
+}
+
+static void pi_active(int i915)
+{
+	igt_spin_t *spin = igt_spin_new(i915);
+	unsigned long count = 0;
+	bool blocked = false;
+	struct pollfd pfd;
+	int lnk[2];
+	int *done;
+
+	igt_require(gem_scheduler_enabled(i915));
+	igt_require(has_persistence(i915)); /* for graceful error recovery */
+
+	done = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(done != MAP_FAILED);
+
+	igt_assert(pipe(lnk) == 0);
+
+	igt_fork(child, 1) {
+		struct sigaction sa = { .sa_handler = alarm_handler };
+
+		sigaction(SIGHUP, &sa, NULL);
+
+		do {
+			uint32_t ctx;
+
+			if (__gem_context_clone(i915, 0,
+						I915_CONTEXT_CLONE_ENGINES |
+						I915_CONTEXT_CLONE_VM,
+						0, &ctx))
+				break;
+
+			gem_context_set_persistence(i915, ctx, false);
+			if (READ_ONCE(*done))
+				break;
+
+			spin->execbuf.rsvd1 = ctx;
+			if (__execbuf(i915, &spin->execbuf))
+				break;
+
+			count++;
+			write(lnk[1], &count, sizeof(count));
+		} while (1);
+	}
+
+	pfd.fd = lnk[0];
+	pfd.events = POLLIN;
+	close(lnk[1]);
+
+	igt_until_timeout(90) {
+		if (poll(&pfd, 1, 1000) == 0) {
+			igt_info("Child blocked after %lu active contexts\n",
+				 count);
+			blocked = true;
+			break;
+		}
+		read(pfd.fd, &count, sizeof(count));
+	}
+
+	if (blocked) {
+		struct sigaction old_sa, sa = { .sa_handler = alarm_handler };
+		struct itimerval itv;
+
+		sigaction(SIGALRM, &sa, &old_sa);
+		itv.it_value.tv_sec = 0;
+		itv.it_value.tv_usec = 250000; /* 250ms */
+		setitimer(ITIMER_REAL, &itv, NULL);
+
+		igt_assert_f(__execbuf(i915, &spin->execbuf) == 0,
+			     "Active execbuf blocked for more than 250ms by %lu child contexts\n",
+			     count);
+
+		memset(&itv, 0, sizeof(itv));
+		setitimer(ITIMER_REAL, &itv, NULL);
+		sigaction(SIGALRM, &old_sa, NULL);
+	} else {
+		igt_info("Not blocked after %lu active contexts\n",
+			 count);
+	}
+
+	*done = 1;
+	kill_children(SIGHUP);
+	igt_waitchildren();
+	gem_quiescent_gpu(i915);
+	close(lnk[0]);
+
+	munmap(done, 4096);
+}
+
 igt_main
 {
 	const uint32_t batch[2] = { 0, MI_BATCH_BUFFER_END };
@@ -369,6 +486,9 @@ igt_main
 	igt_subtest("eviction")
 		big_exec(fd, handle, 0);
 
+	igt_subtest("basic-pi-active")
+		pi_active(fd);
+
 	igt_subtest("basic-norecovery")
 		norecovery(fd);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
