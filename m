Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A40D6E527
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 12:17:58 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id my1so146152pjb.1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 05:17:58 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 20 Apr 2020 15:17:41 +0300
Message-Id: <20200420121747.23816-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200420121747.23816-1-juhapekka.heikkila@gmail.com>
References: <20200420121747.23816-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/8] lib/params: start renaming functions
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
Cc: Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

based on patch from Jani Nikula.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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
index 1fc39925..17067843 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -393,7 +393,7 @@ static void __cancel_work_at_exit(int fd)
 {
 	igt_terminate_spins(); /* for older kernels */
 
-	igt_sysfs_set_parameter(fd, "reset", "%x", -1u /* any method */);
+	igt_params_set(fd, "reset", "%x", -1u /* any method */);
 	igt_drop_caches_set(fd,
 			    /* cancel everything */
 			    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index bb58a207..4d80eb6a 100644
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
index 22340a3d..cedb142d 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -188,7 +188,7 @@ igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
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
index ad2f9e54..bc2a352c 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -276,7 +276,7 @@ static void nohangcheck_hostile(int i915)
 
 	i915 = gem_reopen_driver(i915);
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	igt_require(dir != -1);
 
 	ctx = gem_context_create(i915);
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 965b788b..cdaa87aa 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -95,7 +95,7 @@ static void enable_hangcheck(int i915)
 {
 	int dir;
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	if (dir < 0) /* no parameters, must be default! */
 		return;
 
@@ -361,7 +361,7 @@ static void test_nohangcheck_hostile(int i915)
 	 * we forcibly terminate that context.
 	 */
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	igt_require(dir != -1);
 
 	igt_require(__enable_hangcheck(dir, false));
@@ -398,7 +398,7 @@ static void test_nohangcheck_hang(int i915)
 
 	igt_require(!gem_has_cmdparser(i915, ALL_ENGINES));
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	igt_require(dir != -1);
 
 	igt_require(__enable_hangcheck(dir, false));
@@ -1090,8 +1090,7 @@ igt_main
 		igt_require_gem(i915);
 
 		/* Restore the reset modparam if left clobbered */
-		igt_assert(igt_sysfs_set_parameter
-			   (i915, "reset", "%d", -1 /* any [default] reset */));
+		igt_assert(igt_params_set(i915, "reset", "%d", -1));
 
 		enable_hangcheck(i915);
 		igt_install_exit_handler(exit_handler);
diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index 1f4655af..32c92287 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -580,7 +580,7 @@ test_hang(int fd)
 	int dir;
 
 	hang = igt_allow_hang(fd, 0, 0);
-	igt_require(igt_sysfs_set_parameter(fd, "reset", "1")); /* global */
+	igt_require(igt_params_set(fd, "reset", "1")); /* global */
 
 	control = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(control != MAP_FAILED);
diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index 9c7b6645..8ea090d8 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -784,8 +784,7 @@ igt_main
 
 		has_reset_stats = gem_has_reset_stats(fd);
 
-		igt_assert(igt_sysfs_set_parameter
-			   (fd, "reset", "%d", 1 /* only global reset */));
+		igt_assert(igt_params_set(fd, "reset", "%d", 1 /* only global reset */));
 
 		using_full_reset = !gem_engine_reset_enabled(fd) &&
 				   gem_gpu_reset_enabled(fd);
@@ -846,8 +845,7 @@ igt_main
 		int fd;
 
 		fd = drm_open_driver(DRIVER_INTEL);
-		igt_assert(igt_sysfs_set_parameter
-			   (fd, "reset", "%d", INT_MAX /* any reset method */));
+		igt_assert(igt_params_set(fd, "reset", "%d", INT_MAX /* any reset method */));
 		close(fd);
 	}
 }
diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index 662f4865..d1924f95 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -31,6 +31,7 @@
 #include <sys/wait.h>
 #include <unistd.h>
 
+#include "igt_params.h"
 #include "drmtest.h" /* gem_quiescent_gpu()! */
 #include "i915/gem_engine_topology.h"
 #include "igt_dummyload.h"
@@ -52,7 +53,7 @@ static void enable_hangcheck(int i915, bool state)
 {
 	int dir;
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	if (dir < 0) /* no parameters, must be default! */
 		return;
 
diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
index a7e93a4d..8a52dfb9 100644
--- a/tests/i915/sysfs_preempt_timeout.c
+++ b/tests/i915/sysfs_preempt_timeout.c
@@ -29,6 +29,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#include "igt_params.h"
 #include "drmtest.h" /* gem_quiescent_gpu()! */
 #include "i915/gem_engine_topology.h"
 #include "igt_dummyload.h"
@@ -51,7 +52,7 @@ static bool enable_hangcheck(int i915, bool state)
 	bool success;
 	int dir;
 
-	dir = igt_sysfs_open_parameters(i915);
+	dir = igt_params_open(i915);
 	if (dir < 0) /* no parameters, must be default! */
 		return false;
 
diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
index b983df43..123b9e19 100644
--- a/tests/i915/sysfs_timeslice_duration.c
+++ b/tests/i915/sysfs_timeslice_duration.c
@@ -29,6 +29,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#include "igt_params.h"
 #include "drmtest.h" /* gem_quiescent_gpu()! */
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_mman.h"
@@ -61,7 +62,7 @@ static bool enable_hangcheck(int i915, bool state)
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
