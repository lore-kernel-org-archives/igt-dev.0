Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAD810E13F
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 06:19:28 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 ashutosh.dixit@intel.com, igt-dev@lists.freedesktop.org
Date: Mon, 21 Nov 2022 11:49:16 +0530
Message-Id: <20221121061916.3571789-5-priyanka.dandamudi@intel.com>
In-Reply-To: <20221121061916.3571789-1-priyanka.dandamudi@intel.com>
References: <20221121061916.3571789-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/x-patch; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] REVIEW: Full tree diff against
 origin/internal
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

Auto-generated diff between origin/internal..internal
---
 tests/i915/gem_ctx_engines.c | 88 +++++++++++++++-----------------------------
 tests/i915/gem_ctx_param.c   | 63 -------------------------------
 2 files changed, 30 insertions(+), 121 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index bd366e2c8..c6beb8c95 100644
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
 
-	param.size = sizeof(*engines) + (PRELIM_I915_EXEC_ENGINE_MASK + 2) * sizeof(*engines->engines);
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
diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index eab710d0a..ea5b3f730 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -183,25 +183,6 @@ static void test_vm(int i915)
 	gem_context_destroy(i915, arg.ctx_id);
 	igt_require(err == -ENOENT);
 
-	/* Test that we can't set the VM on ctx0 */
-	arg.ctx_id = 0;
-	arg.value = gem_vm_create(i915);
-	err = __gem_context_set_param(i915, &arg);
-	gem_vm_destroy(i915, arg.value);
-	igt_assert_eq(err, -EINVAL);
-
-	/* Test that we can't set the VM after we've done an execbuf */
-	arg.ctx_id = gem_context_create(i915);
-	ahnd = get_reloc_ahnd(i915, arg.ctx_id);
-	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx_id = arg.ctx_id);
-	igt_spin_free(i915, spin);
-	put_ahnd(ahnd);
-	arg.value = gem_vm_create(i915);
-	err = __gem_context_set_param(i915, &arg);
-	gem_context_destroy(i915, arg.ctx_id);
-	gem_vm_destroy(i915, arg.value);
-	igt_assert_eq(err, -EINVAL);
-
 	parent = gem_context_create(i915);
 	child = gem_context_create(i915);
 
@@ -267,35 +248,6 @@ static void test_vm(int i915)
 	put_ahnd(ahnd);
 }
 
-static void test_set_invalid_param(int fd, uint64_t param, uint64_t value)
-{
-	/* Create a fresh context */
-	struct drm_i915_gem_context_param arg = {
-		.ctx_id = gem_context_create(fd),
-		.param = param,
-		.value = value,
-	};
-	int err;
-
-	err = __gem_context_set_param(fd, &arg);
-	gem_context_destroy(fd, arg.ctx_id);
-	igt_assert_eq(err, -EINVAL);
-}
-
-static void test_get_invalid_param(int fd, uint64_t param)
-{
-	/* Create a fresh context */
-	struct drm_i915_gem_context_param arg = {
-		.ctx_id = gem_context_create(fd),
-		.param = param,
-	};
-	int err;
-
-	err = __gem_context_get_param(fd, &arg);
-	gem_context_destroy(fd, arg.ctx_id);
-	igt_assert_eq(err, -EINVAL);
-}
-
 igt_main
 {
 	struct drm_i915_gem_context_param arg;
@@ -458,21 +410,6 @@ igt_main
 		igt_assert_eq(__gem_context_set_param(fd, &arg), -EINVAL);
 	}
 
-	igt_subtest("invalid-set-ringsize")
-		test_set_invalid_param(fd, I915_CONTEXT_PARAM_RINGSIZE, 8192);
-
-	igt_subtest("invalid-get-ringsize")
-		test_get_invalid_param(fd, I915_CONTEXT_PARAM_RINGSIZE);
-
-	igt_subtest("invalid-set-no-zeromap")
-		test_set_invalid_param(fd, I915_CONTEXT_PARAM_NO_ZEROMAP, 1);
-
-	igt_subtest("invalid-get-no-zeromap")
-		test_get_invalid_param(fd, I915_CONTEXT_PARAM_NO_ZEROMAP);
-
-	igt_subtest("invalid-get-engines")
-		test_get_invalid_param(fd, I915_CONTEXT_PARAM_ENGINES);
-
 	igt_fixture
 		close(fd);
 }
--
git-pile 0.99-dev
