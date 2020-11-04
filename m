Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  4 Nov 2020 22:12:54 +0000
Message-Id: <20201104221254.4021888-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_userptr_blits: Explicitly check
 userptr termination
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

Check that everything works as expected with nohangcheck after a broken
app.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_userptr_blits.c | 148 +++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index dbc82fb0d..26e06d253 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -62,6 +62,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "intel_bufmgr.h"
 #include "sw_sync.h"
 
@@ -559,6 +560,142 @@ static int test_input_checking(int fd)
 	return 0;
 }
 
+static bool __enable_hangcheck(int dir, bool state)
+{
+	return igt_sysfs_set(dir, "enable_hangcheck", state ? "1" : "0");
+}
+
+static int __execbuf(int i915, struct drm_i915_gem_execbuffer2 *execbuf)
+{
+	int err;
+
+	err = 0;
+	if (ioctl(i915, DRM_IOCTL_I915_GEM_EXECBUFFER2_WR, execbuf)) {
+		err = -errno;
+		igt_assume(err);
+	}
+
+	errno = 0;
+	return err;
+}
+
+static void alarm_handler(int sig)
+{
+}
+
+static int fill_ring(int i915, struct drm_i915_gem_execbuffer2 *execbuf)
+{
+	struct sigaction old_sa, sa = { .sa_handler = alarm_handler };
+	int fence = execbuf->rsvd2 >> 32;
+	struct itimerval itv;
+	bool once = false;
+
+	sigaction(SIGALRM, &sa, &old_sa);
+	itv.it_interval.tv_sec = 0;
+	itv.it_interval.tv_usec = 1000;
+	itv.it_value.tv_sec = 0;
+	itv.it_value.tv_usec = 10000;
+	setitimer(ITIMER_REAL, &itv, NULL);
+
+	igt_assert(execbuf->flags & I915_EXEC_FENCE_OUT);
+	do {
+		int err = __execbuf(i915, execbuf);
+
+		if (err == 0) {
+			close(fence);
+			fence = execbuf->rsvd2 >> 32;
+			continue;
+		}
+
+		if (err == -EWOULDBLOCK || once)
+			break;
+
+		/* sleep until the next timer interrupt (woken on signal) */
+		pause();
+		once = true;
+	} while (1);
+
+	memset(&itv, 0, sizeof(itv));
+	setitimer(ITIMER_REAL, &itv, NULL);
+	sigaction(SIGALRM, &old_sa, NULL);
+
+	return fence;
+}
+
+static void test_nohangcheck_hostile(int i915)
+{
+	const struct intel_execution_engine2 *e;
+	igt_hang_t hang;
+	uint32_t ctx;
+	int fence = -1;
+	int err = 0;
+	int dir;
+
+	/*
+	 * Even if the user disables hangcheck, we must still recover.
+	 */
+
+	i915 = gem_reopen_driver(i915);
+
+	dir = igt_params_open(i915);
+	igt_require(dir != -1);
+
+	ctx = gem_context_create(i915);
+	hang = igt_allow_hang(i915, ctx, 0);
+	igt_require(__enable_hangcheck(dir, false));
+
+	____for_each_physical_engine(i915, ctx, e) {
+		igt_spin_t *spin;
+		int new;
+
+		/* Set a fast hang detection to speed up the test */
+		gem_engine_property_printf(i915, e->name,
+					   "preempt_timeout_ms", "%d", 50);
+
+		spin = __igt_spin_new(i915, ctx,
+				      .engine = e->flags,
+				      .flags = (IGT_SPIN_NO_PREEMPTION |
+						IGT_SPIN_USERPTR |
+						IGT_SPIN_FENCE_OUT));
+
+		new = fill_ring(i915, &spin->execbuf);
+		igt_assert(new != -1);
+		spin->out_fence = -1;
+
+		if (fence < 0) {
+			fence = new;
+		} else {
+			int tmp;
+
+			tmp = sync_fence_merge(fence, new);
+			close(fence);
+			close(new);
+
+			fence = tmp;
+		}
+	}
+	gem_context_destroy(i915, ctx);
+	igt_assert(fence != -1);
+
+	if (sync_fence_wait(fence, MSEC_PER_SEC)) { /* 640ms preempt-timeout */
+		igt_debugfs_dump(i915, "i915_engine_info");
+		err = -ETIME;
+	}
+
+	__enable_hangcheck(dir, true);
+	gem_quiescent_gpu(i915);
+	igt_disallow_hang(i915, hang);
+
+	igt_assert_f(err == 0,
+		     "Hostile unpreemptable userptr was not cancelled immediately upon closure\n");
+
+	igt_assert_eq(sync_fence_status(fence), -EIO);
+	close(fence);
+
+	close(dir);
+	close(i915);
+}
+
 static int test_access_control(int fd)
 {
 	/* CAP_SYS_ADMIN is needed for UNSYNCHRONIZED mappings. */
@@ -2382,6 +2519,17 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_stop_signal_helper();
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			gem_userptr_test_synchronized();
+			if (!has_userptr(fd))
+				gem_userptr_test_unsynchronized();
+			igt_require(has_userptr(fd));
+		}
+
+		igt_subtest("nohangcheck")
+			test_nohangcheck_hostile(fd);
+	}
 
 	igt_subtest("access-control")
 		test_access_control(fd);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
