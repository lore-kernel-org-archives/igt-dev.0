Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6856E4B1
 for <igt-dev@lists.freedesktop.org>; Mon, 31 May 2021 13:51:06 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Mon, 31 May 2021 19:11:39 +0530
Message-Id: <20210531134139.359240-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210531134139.359240-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210531134139.359240-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t V3 2/2] i915/gem_exec_schedule: Check for
 timeslicing
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
List-ID: <igt-dev@lists.freedesktop.org>

Userspace semaphores (with arbitrary deadlock as soon by this test)
can only be handled if the kernel supports timeslicing. Now that we
explicitly report timeslicing capabilities, check for that cap.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/i915/gem_exec_schedule.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 6147ff96..e205f272 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -505,8 +505,7 @@ static void timeslice(int i915, unsigned int engine)
 	 * switch to the other batch in order to advance.
 	 */
 
-	igt_require(gem_scheduler_has_semaphores(i915));
-	igt_require(gem_scheduler_has_preemption(i915));
+	igt_require(gem_scheduler_has_timeslicing(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	obj.handle = timeslicing_batches(i915, &offset);
@@ -602,8 +601,7 @@ static void timesliceN(int i915, unsigned int engine, int count)
 	 * switch to the other batch in order to advance.
 	 */
 
-	igt_require(gem_scheduler_has_semaphores(i915));
-	igt_require(gem_scheduler_has_preemption(i915));
+	igt_require(gem_scheduler_has_timeslicing(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	/* No coupling between requests; free to timeslice */
@@ -635,8 +633,7 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
 	igt_spin_t *spin[3];
 	uint32_t ctx;
 
-	igt_require(gem_scheduler_has_semaphores(i915));
-	igt_require(gem_scheduler_has_preemption(i915));
+	igt_require(gem_scheduler_has_timeslicing(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	ctx = gem_context_create(i915);
@@ -742,8 +739,7 @@ static void submit_slice(int i915,
 	 * especially when that work is coperating with the spinner.
 	 */
 
-	igt_require(gem_scheduler_has_semaphores(i915));
-	igt_require(gem_scheduler_has_preemption(i915));
+	igt_require(gem_scheduler_has_timeslicing(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	__for_each_physical_engine(i915, cancel) {
@@ -820,7 +816,7 @@ static void semaphore_userlock(int i915, unsigned long flags)
 	igt_spin_t *spin = NULL;
 	uint32_t scratch;
 
-	igt_require(gem_scheduler_has_semaphores(i915));
+	igt_require(gem_scheduler_has_timeslicing(i915));
 
 	/*
 	 * Given the use of semaphores to govern parallel submission
@@ -2873,8 +2869,7 @@ igt_main
 
 		igt_subtest_group {
 			igt_fixture {
-				igt_require(gem_scheduler_has_semaphores(fd));
-				igt_require(gem_scheduler_has_preemption(fd));
+				igt_require(gem_scheduler_has_timeslicing(fd));
 				igt_require(intel_gen(intel_get_drm_devid(fd)) >= 8);
 			}
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
