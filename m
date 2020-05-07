Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976536EA52
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 19:10:05 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r14so3468176pfg.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 May 2020 12:10:05 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu,  7 May 2020 22:09:39 +0300
Message-Id: <20200507190944.19520-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
References: <20200507190944.19520-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/7] lib/params: start renaming functions
 igt_params_*
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
 lib/drmtest.c                         |  2 +-
 lib/i915/gem_submission.c             |  2 +-
 lib/igt_aux.c                         |  3 +--
 lib/igt_gt.c                          |  2 +-
 lib/igt_params.c                      | 12 +++++-------
 lib/igt_params.h                      |  5 ++---
 tests/i915/gem_ctx_exec.c             |  2 +-
 tests/i915/gem_ctx_persistence.c      |  9 ++++-----
 tests/i915/gem_mmap_gtt.c             |  2 +-
 tests/i915/gem_reset_stats.c          |  6 ++----
 tests/i915/sysfs_heartbeat_interval.c |  3 ++-
 tests/i915/sysfs_preempt_timeout.c    |  3 ++-
 tests/i915/sysfs_timeslice_duration.c |  3 ++-
 13 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 85f96ae1..040ca39c 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -495,7 +495,7 @@ static void __cancel_work_at_exit(int fd)
 {
 	igt_terminate_spins(); /* for older kernels */
 
-	igt_sysfs_set_parameter(fd, "reset", "%x", -1u /* any method */);
+	igt_params_set(fd, "reset", "%x", -1u /* any method */);
 	igt_drop_caches_set(fd,
 			    /* cancel everything */
 			    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 47b33698..6bea6aa3 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -78,7 +78,7 @@ unsigned gem_submission_method(int fd)
 
 	int dir;
 
-	dir = igt_sysfs_open_parameters(fd);
+	dir = igt_params_open(fd);
 	if (dir < 0)
 		return 0;
 
diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index c55b2916..fba34933 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -514,8 +514,7 @@ void igt_fork_hang_detector(int fd)
 	 * they are a test failure!) and so the loss of per-engine reset
 	 * functionality is not an issue.
 	 */
-	igt_assert(igt_sysfs_set_parameter
-		   (fd, "reset", "%d", 1 /* only global reset */));
+	igt_assert(igt_params_set(fd, "reset", "%d", 1 /* only global reset */));
 
 	signal(SIGIO, sig_abort);
 	igt_fork_helper(&hang_detector)
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index b94ca615..2fd51985 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -189,7 +189,7 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
 		__gem_context_set_param(fd, &param);
 		allow_reset = INT_MAX; /* any reset method */
 	}
-	igt_require(igt_sysfs_set_parameter(fd, "reset", "%d", allow_reset));
+	igt_require(igt_params_set(fd, "reset", "%d", allow_reset));
 
 	if (!igt_check_boolean_env_var("IGT_HANG_WITHOUT_RESET", false))
 		igt_require(has_gpu_reset(fd));
diff --git a/lib/igt_params.c b/lib/igt_params.c
index 4bd2b1f2..f220e73b 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -126,7 +126,7 @@ static void igt_save_module_param(const char *name, const char *file_path)
 }
 
 /**
- * igt_sysfs_open_parameters:
+ * igt_params_open:
  * @device: fd of the device
  *
  * This opens the module parameters directory (under sysfs) corresponding
@@ -135,7 +135,7 @@ static void igt_save_module_param(const char *name, const char *file_path)
  * Returns:
  * The directory fd, or -1 on failure.
  */
-int igt_sysfs_open_parameters(int device)
+int igt_params_open(int device)
 {
 	int dir, params = -1;
 
@@ -165,22 +165,20 @@ int igt_sysfs_open_parameters(int device)
 }
 
 /**
- * igt_sysfs_set_parameters:
+ * igt_params_set:
  * @device: fd of the device
  * @parameter: the name of the parameter to set
  * @fmt: printf-esque format string
  *
  * Returns true on success
  */
-bool igt_sysfs_set_parameter(int device,
-			     const char *parameter,
-			     const char *fmt, ...)
+bool igt_params_set(int device, const char *parameter, const char *fmt, ...)
 {
 	va_list ap;
 	int dir;
 	int ret;
 
-	dir = igt_sysfs_open_parameters(device);
+	dir = igt_params_open(device);
 	if (dir < 0)
 		return false;
 
diff --git a/lib/igt_params.h b/lib/igt_params.h
index cf0fd18f..52eed77f 100644
--- a/lib/igt_params.h
+++ b/lib/igt_params.h
@@ -26,11 +26,10 @@
 
 #include <stdbool.h>
 
-int igt_sysfs_open_parameters(int device);
+int igt_params_open(int device);
 
 __attribute__((format(printf, 3, 4)))
-bool igt_sysfs_set_parameter(int device, const char *parameter,
-			     const char *fmt, ...);
+bool igt_params_set(int device, const char *parameter, const char *fmt, ...);
 
 void igt_set_module_param(const char *name, const char *val);
 void igt_set_module_param_int(const char *name, int val);
diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 23036a95..bae1d663 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -277,7 +277,7 @@ static void nohangcheck_hostile(int i915)
 
 	i915 = gem_reopen_driver(i915);
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	igt_require(dir != -1);
 
 	ctx = gem_context_create(i915);
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index b81000d1..6a49116a 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -96,7 +96,7 @@ static void enable_hangcheck(int i915)
 {
 	int dir;
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	if (dir < 0) /* no parameters, must be default! */
 		return;
 
@@ -362,7 +362,7 @@ static void test_nohangcheck_hostile(int i915)
 	 * we forcibly terminate that context.
 	 */
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	igt_require(dir != -1);
 
 	igt_require(__enable_hangcheck(dir, false));
@@ -399,7 +399,7 @@ static void test_nohangcheck_hang(int i915)
 
 	igt_require(!gem_has_cmdparser(i915, ALL_ENGINES));
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	igt_require(dir != -1);
 
 	igt_require(__enable_hangcheck(dir, false));
@@ -1091,8 +1091,7 @@ igt_main
 		igt_require_gem(i915);
 
 		/* Restore the reset modparam if left clobbered */
-		igt_assert(igt_sysfs_set_parameter
-			   (i915, "reset", "%d", -1 /* any [default] reset */));
+		igt_assert(igt_params_set(i915, "reset", "%d", -1));
 
 		enable_hangcheck(i915);
 		igt_install_exit_handler(exit_handler);
diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index d4f3f7cb..3a4681a1 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -656,7 +656,7 @@ test_hang(int fd)
 	int dir;
 
 	hang = igt_allow_hang(fd, 0, 0);
-	igt_require(igt_sysfs_set_parameter(fd, "reset", "1")); /* global */
+	igt_require(igt_params_set(fd, "reset", "1")); /* global */
 
 	control = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(control != MAP_FAILED);
diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index e2d2dd8b..b6927daf 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -785,8 +785,7 @@ igt_main
 
 		has_reset_stats = gem_has_reset_stats(fd);
 
-		igt_assert(igt_sysfs_set_parameter
-			   (fd, "reset", "%d", 1 /* only global reset */));
+		igt_assert(igt_params_set(fd, "reset", "%d", 1 /* only global reset */));
 
 		using_full_reset = !gem_engine_reset_enabled(fd) &&
 				   gem_gpu_reset_enabled(fd);
@@ -847,8 +846,7 @@ igt_main
 		int fd;
 
 		fd = drm_open_driver(DRIVER_INTEL);
-		igt_assert(igt_sysfs_set_parameter
-			   (fd, "reset", "%d", INT_MAX /* any reset method */));
+		igt_assert(igt_params_set(fd, "reset", "%d", INT_MAX /* any reset method */));
 		close(fd);
 	}
 }
diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index 6266f3e8..6d4413d6 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -31,6 +31,7 @@
 #include <sys/wait.h>
 #include <unistd.h>
 
+#include "igt_params.h"
 #include "drmtest.h"
 #include "i915/gem.h"
 #include "i915/gem_context.h"
@@ -52,7 +53,7 @@ static void enable_hangcheck(int i915, bool state)
 {
 	int dir;
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	if (dir < 0) /* no parameters, must be default! */
 		return;
 
diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
index 785289cb..3f4939ee 100644
--- a/tests/i915/sysfs_preempt_timeout.c
+++ b/tests/i915/sysfs_preempt_timeout.c
@@ -29,6 +29,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#include "igt_params.h"
 #include "drmtest.h"
 #include "i915/gem.h"
 #include "i915/gem_context.h"
@@ -51,7 +52,7 @@ static bool enable_hangcheck(int i915, bool state)
 	bool success;
 	int dir;
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	if (dir < 0) /* no parameters, must be default! */
 		return false;
 
diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
index 1eeac830..2b1e52c8 100644
--- a/tests/i915/sysfs_timeslice_duration.c
+++ b/tests/i915/sysfs_timeslice_duration.c
@@ -29,6 +29,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#include "igt_params.h"
 #include "drmtest.h"
 #include "i915/gem.h"
 #include "i915/gem_engine_topology.h"
@@ -62,7 +63,7 @@ static bool enable_hangcheck(int i915, bool state)
 	bool success;
 	int dir;
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	if (dir < 0) /* no parameters, must be default! */
 		return false;
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
