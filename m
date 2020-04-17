Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1C06EB8D
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 11:00:02 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Fri, 17 Apr 2020 16:28:39 +0530
Message-Id: <20200417105839.12084-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH
 i-g-t]tests/i915/gem_exec_balancer:Resolving unpredictable tasklet delays
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Increased the Sampling window to help with sporadic test failures
due to unpredicted tasklet delays.

Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_exec_balancer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index e9a893e9..aeaec77e 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -41,6 +41,7 @@ IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing");
 #define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
 
 #define INSTANCE_COUNT (1 << I915_PMU_SAMPLE_INSTANCE_BITS)
+#define NSEC_PER_MSEC (1000 * 100)
 
 static size_t sizeof_load_balance(int count)
 {
@@ -1512,7 +1513,7 @@ static void full(int i915, unsigned int flags)
 			close(fence);
 		}
 
-		load = measure_min_load(pmu[0], count, 10000);
+		load = measure_min_load(pmu[0], count, NSEC_PER_MSEC);
 		igt_spin_free(i915, spin);
 
 		close(pmu[0]);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
