Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE24110E6B5
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:14:00 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:49 -0800
Message-Id: <20230118071350.17498-19-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
References: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 18/19] tests/i915/vm_bind: Use execbuf3
 spinner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Update gem_exec3_balancer test to use execbuf3 spinner.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/gem_exec3_balancer.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/tests/i915/gem_exec3_balancer.c b/tests/i915/gem_exec3_balancer.c
index cc8c743fd..23122f009 100644
--- a/tests/i915/gem_exec3_balancer.c
+++ b/tests/i915/gem_exec3_balancer.c
@@ -11,8 +11,6 @@
  *
  */
 
-#include <poll.h>
-
 #include "i915/gem.h"
 #include "i915/i915_vm_bind.h"
 #include "i915/gem_engine_topology.h"
@@ -173,11 +171,6 @@ static void logical_sort_siblings(int i915,
 	free(engines);
 }
 
-static bool fence_busy(int fence)
-{
-	return poll(&(struct pollfd){fence, POLLIN}, 1, 0) == 0;
-}
-
 /*
  * Always reading from engine instance 0, with GuC submission the values are the
  * same across all instances. Execlists they may differ but quite unlikely they
@@ -217,10 +210,11 @@ static unsigned int get_timeslice(int i915,
  */
 static void parallel_ordering(int i915, unsigned int flags)
 {
-	uint32_t vm_id;
+	uint32_t vm_id, spin_vm_id;
 	int class;
 
 	vm_id = gem_vm_create_in_vm_bind_mode(i915);
+	spin_vm_id = gem_vm_create_in_vm_bind_mode(i915);
 
 	for (class = 0; class < 32; class++) {
 		struct drm_i915_gem_timeline_fence exec_fence = { };
@@ -293,17 +287,22 @@ static void parallel_ordering(int i915, unsigned int flags)
 
 		/* Block parallel submission */
 		spin_ctx = ctx_create_engines(i915, siblings, count);
+		param.ctx_id = spin_ctx->id;
+		gem_context_set_param(i915, &param);
+		gem_context_set_vm(i915, spin_ctx->id, spin_vm_id);
 		ahnd = get_simple_ahnd(i915, spin_ctx->id);
+		igt_require(ahnd);
 		spin = __igt_spin_new(i915,
 				      .ahnd = ahnd,
 				      .ctx = spin_ctx,
-				      .engine = 0,
-				      .flags = IGT_SPIN_FENCE_OUT |
+				      .vm_id = spin_vm_id,
+				      .flags = IGT_SPIN_EXECBUF3 |
 				      IGT_SPIN_NO_PREEMPTION);
 
 		/* Wait for spinners to start */
 		usleep(5 * 10000);
-		igt_assert(fence_busy(spin->out_fence));
+		while (spin->out_syncobj[i])
+			igt_assert(syncobj_busy(i915, spin->out_syncobj[i++]));
 
 		/* Submit parallel execbuf */
 		gem_execbuf3(i915, &execbuf);
@@ -315,7 +314,6 @@ static void parallel_ordering(int i915, unsigned int flags)
 		 * these are changed it is possible for the test to fail.
 		 */
 		usleep(get_timeslice(i915, siblings[0]) * 2);
-		igt_assert(fence_busy(spin->out_fence));
 		igt_assert(syncobj_busy(i915, exec_syncobj));
 		check_bo(i915, obj[0], 0);
 
@@ -345,6 +343,7 @@ static void parallel_ordering(int i915, unsigned int flags)
 		put_ahnd(ahnd);
 	}
 
+	gem_vm_destroy(i915, spin_vm_id);
 	gem_vm_destroy(i915, vm_id);
 }
 
-- 
2.21.0.rc0.32.g243a4c7e27
