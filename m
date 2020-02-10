Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975F16ED5F
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 21:00:18 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Mon, 10 Feb 2020 13:00:16 -0800
Message-Id: <20200210210016.2886-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_exec_balancer: Skip the
 test if no perf engines are available
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

Require that the test can access perf engines files. This patch also fixes
the error check for perf_i915_open().

v2:
	- Skip based on valid perf type ID. (Chris)

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 tests/i915/gem_exec_balancer.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 150eba0d..f51be339 100644
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
@@ -113,6 +113,11 @@ list_engines(int i915, uint32_t class_mask, unsigned int *out)
 	return engines;
 }
 
+static bool has_perf_engines(int i915)
+{
+	return i915_perf_type_id(i915);
+}
+
 static int __set_engines(int i915, uint32_t ctx,
 			 const struct i915_engine_class_instance *ci,
 			 unsigned int count)
@@ -1818,6 +1823,7 @@ igt_main
 		gem_require_contexts(i915);
 		igt_require(has_context_engines(i915));
 		igt_require(has_load_balancer(i915));
+		igt_require(has_perf_engines(i915));
 
 		igt_fork_hang_detector(i915);
 	}
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
