Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFD510E02A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 06:19:22 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 ashutosh.dixit@intel.com, igt-dev@lists.freedesktop.org
Date: Mon, 21 Nov 2022 11:49:13 +0530
Message-Id: <20221121061916.3571789-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20221121061916.3571789-1-priyanka.dandamudi@intel.com>
References: <20221121061916.3571789-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] Revert "tests/i915/gem_ctx_engines: Fix
 the invalid subtest for the new rules"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

This reverts commit 99d863de8b7bb687daee9d7edd59c4b17419e8d1.
---
 tests/i915/gem_ctx_engines.c | 88 ++++++++++++------------------------
 1 file changed, 30 insertions(+), 58 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index e3f75dce1..97b1a21f4 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -47,44 +47,31 @@
 #define engine_class(e, n) ((e)->engines[(n)].engine_class)
 #define engine_instance(e, n) ((e)->engines[(n)].engine_instance)
 
-static int
-__set_param_fresh_context(int i915, struct drm_i915_gem_context_param param)
-{
-	int err;
-
-	igt_assert_eq(param.ctx_id, 0);
-	param.ctx_id = gem_context_create(i915);
-	err = __gem_context_set_param(i915, &param);
-	gem_context_destroy(i915, param.ctx_id);
-
-	return err;
-}
-
 static void invalid_engines(int i915)
 {
 	struct i915_context_param_engines stack = {}, *engines;
 	struct drm_i915_gem_context_param param = {
+		.ctx_id = gem_context_create(i915),
 		.param = I915_CONTEXT_PARAM_ENGINES,
 		.value = to_user_pointer(&stack),
 	};
 	uint32_t handle;
-	igt_spin_t *spin;
 	void *ptr;
 
 	param.size = 0;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
+	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
 
 	param.size = 1;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
 
 	param.size = sizeof(stack) - 1;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
 
 	param.size = sizeof(stack) + 1;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
 
-	param.size = sizeof(*engines) + (I915_EXEC_RING_MASK + 2) * sizeof(*engines->engines);
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
+	param.size = 0;
+	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
 
 	/* Create a single page surrounded by inaccessible nothingness */
 	ptr = mmap(NULL, 3 * 4096, PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
@@ -98,57 +85,57 @@ static void invalid_engines(int i915)
 	param.value = to_user_pointer(engines);
 
 	engines->engines[0].engine_class = -1;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -ENOENT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -ENOENT);
 
 	mprotect(engines, 4096, PROT_READ);
-	igt_assert_eq(__set_param_fresh_context(i915, param), -ENOENT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -ENOENT);
 
 	mprotect(engines, 4096, PROT_WRITE);
 	engines->engines[0].engine_class = 0;
-	if (__set_param_fresh_context(i915, param)) /* XXX needs RCS */
+	if (__gem_context_set_param(i915, &param)) /* XXX needs RCS */
 		goto out;
 
 	engines->extensions = to_user_pointer(ptr);
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	engines->extensions = 0;
-	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
+	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
 
 	param.value = to_user_pointer(engines - 1);
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines) - 1;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines) - param.size +  1;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines) + 4096;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines) - param.size + 4096;
-	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
+	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
 
 	param.value = to_user_pointer(engines) - param.size + 4096 + 1;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines) + 4096;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines) + 4096 - 1;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines) - 1;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines - 1);
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines - 1) + 4096;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(engines - 1) + 4096 - sizeof(*engines->engines) / 2;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	handle = gem_create(i915, 4096 * 3);
 	ptr = gem_mmap__device_coherent(i915, handle, 0, 4096 * 3, PROT_READ);
@@ -158,40 +145,25 @@ static void invalid_engines(int i915)
 	munmap(ptr + 8192, 4096);
 
 	param.value = to_user_pointer(ptr + 4096);
-	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
+	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
 
 	param.value = to_user_pointer(ptr);
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(ptr) + 4095;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(ptr) + 8192;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	param.value = to_user_pointer(ptr) + 12287;
-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
 
 	munmap(ptr + 4096, 4096);
 
-	/* Reset back to a known-good param struct */
-	param.size = sizeof(*engines) + sizeof(*engines->engines);
-	param.value = to_user_pointer(engines);
-	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
-
-	/* Test that we can't set engines after we've done an execbuf */
-	param.ctx_id = gem_context_create(i915);
-	spin = igt_spin_new(i915, .ctx_id = param.ctx_id);
-	igt_spin_free(i915, spin);
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
-	gem_context_destroy(i915, param.ctx_id);
-
-	/* Test that we can't set engines on ctx0 */
-	param.ctx_id = 0;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
-
 out:
 	munmap(engines, 4096);
+	gem_context_destroy(i915, param.ctx_id);
 }
 
 static uint32_t batch_create(int i915)
