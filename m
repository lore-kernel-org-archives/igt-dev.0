Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FED6E28A
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 08:25:42 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri,  4 Jun 2021 11:27:19 +0300
Message-Id: <20210604082720.13281-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] Revert "i915/gem_exec_schedule: Check
 for timeslicing"
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Timeslicing patches had an issue, reverting them to be reworked.

This reverts commit 1fbc1e7d602f96a7f4e2b95057eef994656b8e74.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/i915/gem_exec_schedule.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index e205f272..6147ff96 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -505,7 +505,8 @@ static void timeslice(int i915, unsigned int engine)
 	 * switch to the other batch in order to advance.
 	 */
 
-	igt_require(gem_scheduler_has_timeslicing(i915));
+	igt_require(gem_scheduler_has_semaphores(i915));
+	igt_require(gem_scheduler_has_preemption(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	obj.handle = timeslicing_batches(i915, &offset);
@@ -601,7 +602,8 @@ static void timesliceN(int i915, unsigned int engine, int count)
 	 * switch to the other batch in order to advance.
 	 */
 
-	igt_require(gem_scheduler_has_timeslicing(i915));
+	igt_require(gem_scheduler_has_semaphores(i915));
+	igt_require(gem_scheduler_has_preemption(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	/* No coupling between requests; free to timeslice */
@@ -633,7 +635,8 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
 	igt_spin_t *spin[3];
 	uint32_t ctx;
 
-	igt_require(gem_scheduler_has_timeslicing(i915));
+	igt_require(gem_scheduler_has_semaphores(i915));
+	igt_require(gem_scheduler_has_preemption(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	ctx = gem_context_create(i915);
@@ -739,7 +742,8 @@ static void submit_slice(int i915,
 	 * especially when that work is coperating with the spinner.
 	 */
 
-	igt_require(gem_scheduler_has_timeslicing(i915));
+	igt_require(gem_scheduler_has_semaphores(i915));
+	igt_require(gem_scheduler_has_preemption(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	__for_each_physical_engine(i915, cancel) {
@@ -816,7 +820,7 @@ static void semaphore_userlock(int i915, unsigned long flags)
 	igt_spin_t *spin = NULL;
 	uint32_t scratch;
 
-	igt_require(gem_scheduler_has_timeslicing(i915));
+	igt_require(gem_scheduler_has_semaphores(i915));
 
 	/*
 	 * Given the use of semaphores to govern parallel submission
@@ -2869,7 +2873,8 @@ igt_main
 
 		igt_subtest_group {
 			igt_fixture {
-				igt_require(gem_scheduler_has_timeslicing(fd));
+				igt_require(gem_scheduler_has_semaphores(fd));
+				igt_require(gem_scheduler_has_preemption(fd));
 				igt_require(intel_gen(intel_get_drm_devid(fd)) >= 8);
 			}
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
