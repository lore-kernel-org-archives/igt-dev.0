Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB036E1B6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 19:10:23 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id a5so3065202pjh.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 May 2020 12:10:23 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu,  7 May 2020 22:09:44 +0300
Message-Id: <20200507190944.19520-8-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
References: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/7] tests/gem_eio: switch to using
 igt_params_set()
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
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/gem_eio.c | 57 +++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 33 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index a1259067..e0d8390f 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -53,20 +53,11 @@
 
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
@@ -107,9 +98,9 @@ static void wedge_gpu(int fd)
 	/* First idle the GPU then disable GPU resets before injecting a hang */
 	gem_quiescent_gpu(fd);
 
-	igt_require(i915_reset_control(false));
+	igt_require(i915_reset_control(fd, false));
 	manual_hang(fd);
-	igt_assert(i915_reset_control(true));
+	igt_assert(i915_reset_control(fd, true));
 }
 
 static int __gem_throttle(int fd)
@@ -347,7 +338,7 @@ static void __test_banned(int fd)
 	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 
 	gem_quiescent_gpu(fd);
-	igt_require(i915_reset_control(true));
+	igt_require(i915_reset_control(fd, true));
 
 	igt_until_timeout(5) {
 		igt_spin_t *hang;
@@ -405,9 +396,9 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
 	 */
 
 	if (flags & TEST_WEDGE)
-		igt_require(i915_reset_control(false));
+		igt_require(i915_reset_control(fd, false));
 	else
-		igt_require(i915_reset_control(true));
+		igt_require(i915_reset_control(fd, true));
 
 	hang = spin_sync(fd, 0, I915_EXEC_DEFAULT);
 
@@ -416,7 +407,7 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
 
 	igt_spin_free(fd, hang);
 
-	igt_require(i915_reset_control(true));
+	igt_require(i915_reset_control(fd, true));
 
 	trigger_reset(fd);
 	close(fd);
@@ -431,12 +422,12 @@ static void test_suspend(int fd, int state)
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
@@ -471,7 +462,7 @@ static void test_inflight(int fd, unsigned int wait)
 
 		gem_quiescent_gpu(fd);
 		igt_debug("Starting %s on engine '%s'\n", __func__, e->name);
-		igt_require(i915_reset_control(false));
+		igt_require(i915_reset_control(fd, false));
 
 		hang = spin_sync(fd, 0, eb_ring(e));
 		obj[0].handle = hang->handle;
@@ -496,7 +487,7 @@ static void test_inflight(int fd, unsigned int wait)
 		}
 		igt_spin_free(fd, hang);
 
-		igt_assert(i915_reset_control(true));
+		igt_assert(i915_reset_control(fd, true));
 		trigger_reset(fd);
 
 		gem_close(fd, obj[1].handle);
@@ -521,7 +512,7 @@ static void test_inflight_suspend(int fd)
 	fd = gem_reopen_driver(fd);
 	igt_require_gem(fd);
 	igt_require(gem_has_exec_fence(fd));
-	igt_require(i915_reset_control(false));
+	igt_require(i915_reset_control(fd, false));
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].flags = EXEC_OBJECT_WRITE;
@@ -554,7 +545,7 @@ static void test_inflight_suspend(int fd)
 	}
 	igt_spin_free(fd, hang);
 
-	igt_assert(i915_reset_control(true));
+	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
 	close(fd);
 }
@@ -602,7 +593,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		gem_quiescent_gpu(fd);
 
 		igt_debug("Starting %s on engine '%s'\n", __func__, e->name);
-		igt_require(i915_reset_control(false));
+		igt_require(i915_reset_control(fd, false));
 
 		memset(obj, 0, sizeof(obj));
 		obj[0].flags = EXEC_OBJECT_WRITE;
@@ -637,7 +628,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		igt_spin_free(fd, hang);
 		gem_close(fd, obj[1].handle);
 
-		igt_assert(i915_reset_control(true));
+		igt_assert(i915_reset_control(fd, true));
 		trigger_reset(fd);
 
 		for (unsigned int n = 0; n < ARRAY_SIZE(ctx); n++)
@@ -664,7 +655,7 @@ static void test_inflight_external(int fd)
 
 	fence = igt_cork_plug(&cork, fd);
 
-	igt_require(i915_reset_control(false));
+	igt_require(i915_reset_control(fd, false));
 	hang = __spin_poll(fd, 0, 0);
 
 	memset(&obj, 0, sizeof(obj));
@@ -696,7 +687,7 @@ static void test_inflight_external(int fd)
 	close(fence);
 
 	igt_spin_free(fd, hang);
-	igt_assert(i915_reset_control(true));
+	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
 	close(fd);
 }
@@ -715,7 +706,7 @@ static void test_inflight_internal(int fd, unsigned int wait)
 	fd = gem_reopen_driver(fd);
 	igt_require_gem(fd);
 
-	igt_require(i915_reset_control(false));
+	igt_require(i915_reset_control(fd, false));
 	hang = spin_sync(fd, 0, 0);
 
 	memset(obj, 0, sizeof(obj));
@@ -746,7 +737,7 @@ static void test_inflight_internal(int fd, unsigned int wait)
 	}
 	igt_spin_free(fd, hang);
 
-	igt_assert(i915_reset_control(true));
+	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
 	close(fd);
 }
@@ -782,7 +773,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 
 		gem_quiescent_gpu(fd);
 
-		igt_require(i915_reset_control(flags & TEST_WEDGE ?
+		igt_require(i915_reset_control(fd, flags & TEST_WEDGE ?
 					       false : true));
 
 		/*
@@ -804,7 +795,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 		igt_assert_eq(sync_fence_status(hang->out_fence), -EIO);
 
 		/* Unwedge by forcing a reset. */
-		igt_assert(i915_reset_control(true));
+		igt_assert(i915_reset_control(fd, true));
 		trigger_reset(fd);
 
 		gem_quiescent_gpu(fd);
@@ -919,7 +910,7 @@ static int fd = -1;
 static void
 exit_handler(int sig)
 {
-	i915_reset_control(true);
+	i915_reset_control(fd, true);
 	igt_force_gpu_reset(fd);
 }
 
@@ -934,7 +925,7 @@ igt_main
 
 		igt_allow_hang(fd, 0, 0);
 
-		igt_require(i915_reset_control(true));
+		igt_require(i915_reset_control(fd, true));
 		igt_force_gpu_reset(fd);
 		igt_install_exit_handler(exit_handler);
 	}
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
