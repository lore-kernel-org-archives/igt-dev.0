Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AA610E2AF
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 23:13:05 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Dec 2022 15:12:53 -0800
Message-Id: <20221212231254.2303-19-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
References: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 18/19] tests/i915/vm_bind: Use execbuf3
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/gem_exec3_balancer.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_exec3_balancer.c b/tests/i915/gem_exec3_balancer.c
index 68ef040c7..23122f009 100644
--- a/tests/i915/gem_exec3_balancer.c
+++ b/tests/i915/gem_exec3_balancer.c
@@ -171,11 +171,6 @@ static void logical_sort_siblings(int i915,
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
@@ -215,10 +210,11 @@ static unsigned int get_timeslice(int i915,
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
@@ -291,17 +287,22 @@ static void parallel_ordering(int i915, unsigned int flags)
 
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
@@ -313,7 +314,6 @@ static void parallel_ordering(int i915, unsigned int flags)
 		 * these are changed it is possible for the test to fail.
 		 */
 		usleep(get_timeslice(i915, siblings[0]) * 2);
-		igt_assert(fence_busy(spin->out_fence));
 		igt_assert(syncobj_busy(i915, exec_syncobj));
 		check_bo(i915, obj[0], 0);
 
@@ -343,6 +343,7 @@ static void parallel_ordering(int i915, unsigned int flags)
 		put_ahnd(ahnd);
 	}
 
+	gem_vm_destroy(i915, spin_vm_id);
 	gem_vm_destroy(i915, vm_id);
 }
 
-- 
2.21.0.rc0.32.g243a4c7e27
