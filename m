Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7466EB26
 for <igt-dev@lists.freedesktop.org>; Sat,  9 May 2020 00:21:25 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  8 May 2020 17:21:24 -0700
Message-Id: <20200509002124.3174-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_spin_batch: Use
 __for_each_physical_engine
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

Instead of the legacy for_each_physical_engine use
__for_each_physical_engine to utilize all engines.

Fixes: 57efd81037 ("i915/gem_spin_batch: Add test to execute in parallel on all engines")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_spin_batch.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index e7dd58ec2..6a7753ced 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -137,10 +137,11 @@ static void spin_on_all_engines(int fd, unsigned int timeout_sec)
 static void spin_all(int i915, unsigned int flags)
 #define PARALLEL_SPIN_NEW_CTX BIT(0)
 {
+	const struct intel_execution_engine2 *e2;
 	struct igt_spin *spin, *n;
 	IGT_LIST_HEAD(list);
 
-	for_each_physical_engine(e, i915) {
+	__for_each_physical_engine(i915, e2) {
 		uint32_t ctx;
 
 		ctx = 0;
@@ -150,7 +151,7 @@ static void spin_all(int i915, unsigned int flags)
 		/* Prevent preemption so only one is allowed on each engine */
 		spin = igt_spin_new(i915,
 				    .ctx = ctx,
-				    .engine = eb_ring(e),
+				    .engine = e2->flags,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_NO_PREEMPTION));
 		if (ctx)
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
