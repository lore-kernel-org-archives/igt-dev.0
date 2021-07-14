Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380CD6E24E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 12:00:04 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed, 14 Jul 2021 17:21:33 +0530
Message-Id: <20210714115133.973808-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] lib/i915: Fix the check for scheduler caps for
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

Semaphore and preemption both are required and the check
was missing required check logic.

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/i915/gem_scheduler.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
index 6dfa3676..cdddf42a 100644
--- a/lib/i915/gem_scheduler.c
+++ b/lib/i915/gem_scheduler.c
@@ -140,9 +140,11 @@ bool gem_scheduler_has_engine_busy_stats(int fd)
  */
 bool gem_scheduler_has_timeslicing(int fd)
 {
-	return ((gem_scheduler_capability(fd) &
+	return (((gem_scheduler_capability(fd) &
 	        (I915_SCHEDULER_CAP_PREEMPTION |
-		 I915_SCHEDULER_CAP_SEMAPHORES))
+		 I915_SCHEDULER_CAP_SEMAPHORES)) ==
+		(I915_SCHEDULER_CAP_PREEMPTION |
+		I915_SCHEDULER_CAP_SEMAPHORES))
 		|| gem_has_guc_submission(fd));
 }
 
@@ -168,8 +170,6 @@ void gem_scheduler_print_capability(int fd)
 		igt_info(" - With HW semaphores enabled\n");
 	if (caps & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
 		igt_info(" - With engine busy statistics\n");
-	if ((caps & (I915_SCHEDULER_CAP_PREEMPTION
-		  | I915_SCHEDULER_CAP_SEMAPHORES))
-		|| gem_has_guc_submission(fd))
+	if (gem_scheduler_has_timeslicing(fd))
 		igt_info(" - With timeslicing enabled\n");
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
