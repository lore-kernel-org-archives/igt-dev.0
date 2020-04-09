Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63836EC0A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2020 16:14:09 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id m19so34124lfq.13
 for <igt-dev@lists.freedesktop.org>; Thu, 09 Apr 2020 09:14:09 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu,  9 Apr 2020 19:13:44 +0300
Message-Id: <20200409161344.31934-9-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200409161344.31934-1-juhapekka.heikkila@gmail.com>
References: <20200409161344.31934-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 8/8] RFC tests/gem_eio: switch to using
 igt_params_set()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Based on patch from Jani Nikula.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/gem_eio.c | 57 +++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 33 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 1ec60941..ad59f83a 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -52,20 +52,11 @@
 
 IGT_TEST_DESCRIPTION("Test that specific ioctls report a wedged GPU (EIO).");
 
-static bool i915_reset_control(bool enable)
+static bool i915_reset_control(int fd, bool enable)
 {
-	const char *path = "/sys/module/i915/parameters/reset";
-	int fd, ret;
-
 	igt_debug("%s GPU reset\n", enable ? "Enabling" : "Disabling");
 
-	fd = open(path, O_RDWR);
-	igt_require(fd >= 0);
-
-	ret = write(fd, &"01"[enable], 1) == 1;
-	close(fd);
-
-	return ret;
+	return igt_params_set(fd, "reset", "%d", enable);
 }
 
 static void trigger_reset(int fd)
@@ -106,9 +97,9 @@ static void wedge_gpu(int fd)
 	/* First idle the GPU then disable GPU resets before injecting a hang */
 	gem_quiescent_gpu(fd);
 
-	igt_require(i915_reset_control(false));
+	igt_require(i915_reset_control(fd, false));
 	manual_hang(fd);
-	igt_assert(i915_reset_control(true));
+	igt_assert(i915_reset_control(fd, true));
 }
 
 static int __gem_throttle(int fd)
@@ -346,7 +337,7 @@ static void __test_banned(int fd)
 	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 
 	gem_quiescent_gpu(fd);
-	igt_require(i915_reset_control(true));
+	igt_require(i915_reset_control(fd, true));
 
 	igt_until_timeout(5) {
 		igt_spin_t *hang;
@@ -404,9 +395,9 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
 	 */
 
 	if (flags & TEST_WEDGE)
-		igt_require(i915_reset_control(false));
+		igt_require(i915_reset_control(fd, false));
 	else
-		igt_require(i915_reset_control(true));
+		igt_require(i915_reset_control(fd, true));
 
 	hang = spin_sync(fd, 0, I915_EXEC_DEFAULT);
 
@@ -415,7 +406,7 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
 
 	igt_spin_free(fd, hang);
 
-	igt_require(i915_reset_control(true));
+	igt_require(i915_reset_control(fd, true));
 
 	trigger_reset(fd);
 	close(fd);
@@ -430,12 +421,12 @@ static void test_suspend(int fd, int state)
 	igt_system_suspend_autoresume(state, SUSPEND_TEST_DEVICES);
 
 	/* Check we can suspend when the driver is already wedged */
-	igt_require(i915_reset_control(false));
+	igt_require(i915_reset_control(fd, false));
 	manual_hang(fd);
 
 	igt_system_suspend_autoresume(state, SUSPEND_TEST_DEVICES);
 
-	igt_require(i915_reset_control(true));
+	igt_require(i915_reset_control(fd, true));
 	trigger_reset(fd);
 	close(fd);
 }
@@ -470,7 +461,7 @@ static void test_inflight(int fd, unsigned int wait)
 
 		gem_quiescent_gpu(fd);
 		igt_debug("Starting %s on engine '%s'\n", __func__, e->name);
-		igt_require(i915_reset_control(false));
+		igt_require(i915_reset_control(fd, false));
 
 		hang = spin_sync(fd, 0, eb_ring(e));
 		obj[0].handle = hang->handle;
@@ -495,7 +486,7 @@ static void test_inflight(int fd, unsigned int wait)
 		}
 		igt_spin_free(fd, hang);
 
-		igt_assert(i915_reset_control(true));
+		igt_assert(i915_reset_control(fd, true));
 		trigger_reset(fd);
 
 		gem_close(fd, obj[1].handle);
@@ -520,7 +511,7 @@ static void test_inflight_suspend(int fd)
 	fd = gem_reopen_driver(fd);
 	igt_require_gem(fd);
 	igt_require(gem_has_exec_fence(fd));
-	igt_require(i915_reset_control(false));
+	igt_require(i915_reset_control(fd, false));
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].flags = EXEC_OBJECT_WRITE;
@@ -553,7 +544,7 @@ static void test_inflight_suspend(int fd)
 	}
 	igt_spin_free(fd, hang);
 
-	igt_assert(i915_reset_control(true));
+	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
 	close(fd);
 }
@@ -601,7 +592,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		gem_quiescent_gpu(fd);
 
 		igt_debug("Starting %s on engine '%s'\n", __func__, e->name);
-		igt_require(i915_reset_control(false));
+		igt_require(i915_reset_control(fd, false));
 
 		memset(obj, 0, sizeof(obj));
 		obj[0].flags = EXEC_OBJECT_WRITE;
@@ -636,7 +627,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		igt_spin_free(fd, hang);
 		gem_close(fd, obj[1].handle);
 
-		igt_assert(i915_reset_control(true));
+		igt_assert(i915_reset_control(fd, true));
 		trigger_reset(fd);
 
 		for (unsigned int n = 0; n < ARRAY_SIZE(ctx); n++)
@@ -663,7 +654,7 @@ static void test_inflight_external(int fd)
 
 	fence = igt_cork_plug(&cork, fd);
 
-	igt_require(i915_reset_control(false));
+	igt_require(i915_reset_control(fd, false));
 	hang = __spin_poll(fd, 0, 0);
 
 	memset(&obj, 0, sizeof(obj));
@@ -695,7 +686,7 @@ static void test_inflight_external(int fd)
 	close(fence);
 
 	igt_spin_free(fd, hang);
-	igt_assert(i915_reset_control(true));
+	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
 	close(fd);
 }
@@ -714,7 +705,7 @@ static void test_inflight_internal(int fd, unsigned int wait)
 	fd = gem_reopen_driver(fd);
 	igt_require_gem(fd);
 
-	igt_require(i915_reset_control(false));
+	igt_require(i915_reset_control(fd, false));
 	hang = spin_sync(fd, 0, 0);
 
 	memset(obj, 0, sizeof(obj));
@@ -745,7 +736,7 @@ static void test_inflight_internal(int fd, unsigned int wait)
 	}
 	igt_spin_free(fd, hang);
 
-	igt_assert(i915_reset_control(true));
+	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
 	close(fd);
 }
@@ -781,7 +772,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 
 		gem_quiescent_gpu(fd);
 
-		igt_require(i915_reset_control(flags & TEST_WEDGE ?
+		igt_require(i915_reset_control(fd, flags & TEST_WEDGE ?
 					       false : true));
 
 		/*
@@ -803,7 +794,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 		igt_assert_eq(sync_fence_status(hang->out_fence), -EIO);
 
 		/* Unwedge by forcing a reset. */
-		igt_assert(i915_reset_control(true));
+		igt_assert(i915_reset_control(fd, true));
 		trigger_reset(fd);
 
 		gem_quiescent_gpu(fd);
@@ -918,7 +909,7 @@ static int fd = -1;
 static void
 exit_handler(int sig)
 {
-	i915_reset_control(true);
+	i915_reset_control(fd, true);
 	igt_force_gpu_reset(fd);
 }
 
@@ -933,7 +924,7 @@ igt_main
 
 		igt_allow_hang(fd, 0, 0);
 
-		igt_require(i915_reset_control(true));
+		igt_require(i915_reset_control(fd, true));
 		igt_force_gpu_reset(fd);
 		igt_install_exit_handler(exit_handler);
 	}
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
