Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F14B89B8F
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 04:41:04 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed, 27 Oct 2021 21:40:56 -0700
Message-Id: <56371b5203b31157e31be46fa616d8dde3b4e7c4.1635395331.git.ashutosh.dixit@intel.com>
In-Reply-To: <cover.1635395331.git.ashutosh.dixit@intel.com>
References: <cover.1635395331.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/i915: Clarify gem_submission
 function names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: John Harrison <john.c.harrison@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The function names gem_has_guc_submission, gem_has_execlists and
gem_has_semaphores are ambiguous. After "lib/i915: Return actual submission
method from gem_submission_method" these functions return which submission
method the kernel is actually using, not merely one which is
present (e.g. execlist submission is present on all kernels on which GuC
submission is present).

Therefore change the function names to clarify that they return the actual
submission method being used, not merely one which is present.

Suggested-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_scheduler.c    | 2 +-
 lib/i915/gem_submission.c   | 6 +++---
 lib/i915/gem_submission.h   | 6 +++---
 tests/i915/gem_ctx_shared.c | 2 +-
 tests/i915/gem_exec_fair.c  | 2 +-
 tests/i915/gem_watchdog.c   | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
index cdddf42ad2b..bec9f0cda2e 100644
--- a/lib/i915/gem_scheduler.c
+++ b/lib/i915/gem_scheduler.c
@@ -145,7 +145,7 @@ bool gem_scheduler_has_timeslicing(int fd)
 		 I915_SCHEDULER_CAP_SEMAPHORES)) ==
 		(I915_SCHEDULER_CAP_PREEMPTION |
 		I915_SCHEDULER_CAP_SEMAPHORES))
-		|| gem_has_guc_submission(fd));
+		|| gem_using_guc_submission(fd));
 }
 
 /**
diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 6fe7112d958..afdaf214192 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -139,7 +139,7 @@ void gem_submission_print_method(int fd)
  * Feature test macro to query whether the driver is using semaphores for
  * synchronization between engines.
  */
-bool gem_has_semaphores(int fd)
+bool gem_using_semaphores(int fd)
 {
 	return gem_submission_method(fd) & GEM_SUBMISSION_SEMAPHORES;
 }
@@ -151,7 +151,7 @@ bool gem_has_semaphores(int fd)
  * Feature test macro to query whether the driver is using execlists as a
  * hardware submission method.
  */
-bool gem_has_execlists(int fd)
+bool gem_using_execlists(int fd)
 {
 	return gem_submission_method(fd) & GEM_SUBMISSION_EXECLISTS;
 }
@@ -163,7 +163,7 @@ bool gem_has_execlists(int fd)
  * Feature test macro to query whether the driver is using the GuC as a
  * hardware submission method.
  */
-bool gem_has_guc_submission(int fd)
+bool gem_using_guc_submission(int fd)
 {
 	return gem_submission_method(fd) & GEM_SUBMISSION_GUC;
 }
diff --git a/lib/i915/gem_submission.h b/lib/i915/gem_submission.h
index 38dd24a99a4..5ecade25f46 100644
--- a/lib/i915/gem_submission.h
+++ b/lib/i915/gem_submission.h
@@ -33,9 +33,9 @@
 #define GEM_SUBMISSION_GUC		(1 << 2)
 unsigned gem_submission_method(int fd);
 void gem_submission_print_method(int fd);
-bool gem_has_semaphores(int fd);
-bool gem_has_execlists(int fd);
-bool gem_has_guc_submission(int fd);
+bool gem_using_semaphores(int fd);
+bool gem_using_execlists(int fd);
+bool gem_using_guc_submission(int fd);
 bool gem_engine_has_mutable_submission(int fd, unsigned int engine);
 bool gem_class_has_mutable_submission(int fd, int class);
 
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index f50ef13263f..849713ff32f 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -159,7 +159,7 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
 	uint32_t plug;
 	uint64_t ahnd;
 
-	igt_require(gem_has_execlists(i915) || gem_has_guc_submission(i915));
+	igt_require(gem_using_execlists(i915) || gem_using_guc_submission(i915));
 
 	/*
 	 * Each context, although they share a vm, are expected to be
diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index 2aa2bdebed5..935f9c4a0bc 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -1318,7 +1318,7 @@ igt_main
 		 * These tests are for a specific scheduling model which is
 		 * not currently implemented by GuC. So skip on GuC platforms.
 		 */
-		igt_require(!gem_has_guc_submission(i915));
+		igt_require(!gem_using_guc_submission(i915));
 
 		cfg = intel_ctx_cfg_all_physical(i915);
 
diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index 21c7710a806..a9d7f9da7fe 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -222,7 +222,7 @@ static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
 	const intel_ctx_t *ctx[num_engines];
 	uint64_t ahnd;
 
-	igt_require(gem_has_execlists(i915) || gem_has_guc_submission(i915));
+	igt_require(gem_using_execlists(i915) || gem_using_guc_submission(i915));
 
 	igt_debug("%u virtual engines\n", num_engines);
 	igt_require(num_engines);
-- 
2.33.0
