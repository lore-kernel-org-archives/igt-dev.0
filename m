Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC396ED36
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 19:39:29 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Mon, 10 Feb 2020 11:39:08 -0800
Message-Id: <20200210193908.1754-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_balancer: Skip the test
 if no engines are available
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

The test needs to have at least some engines to run, if no engines are
present flag it as a skip rather than have a pass. This patch also fixes
the error check for perf_i915_open().

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 tests/i915/gem_exec_balancer.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 150eba0d..df816feb 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -61,7 +61,7 @@ static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
 	int fd;
 
 	fd = perf_i915_open(i915, I915_PMU_ENGINE_BUSY(class, instance));
-	if (fd != -1) {
+	if (fd >= 0) {
 		close(fd);
 		return true;
 	}
@@ -113,6 +113,23 @@ list_engines(int i915, uint32_t class_mask, unsigned int *out)
 	return engines;
 }
 
+static bool has_engines(int i915)
+{
+	for (int class = 0; class < 32; class++) {
+		struct i915_engine_class_instance *ci;
+		unsigned int count;
+
+		ci = list_engines(i915, 1 << class, &count);
+		if (!ci)
+			continue;
+
+		if (count > 0)
+			return true;
+	}
+
+	return false;
+}
+
 static int __set_engines(int i915, uint32_t ctx,
 			 const struct i915_engine_class_instance *ci,
 			 unsigned int count)
@@ -1818,6 +1835,7 @@ igt_main
 		gem_require_contexts(i915);
 		igt_require(has_context_engines(i915));
 		igt_require(has_load_balancer(i915));
+		igt_require(has_engines(i915));
 
 		igt_fork_hang_detector(i915);
 	}
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
