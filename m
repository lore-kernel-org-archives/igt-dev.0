Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8906F5E6
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 15:14:05 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  5 Oct 2021 08:10:09 -0700
Message-Id: <20211005151022.2161424-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20211005151022.2161424-1-alan.previn.teres.alexis@intel.com>
References: <20211005151022.2161424-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v13 03/16] Add basic PXP testing of buffer
 and context alloc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Test PXP capability support as well as the allocation of protected
buffers and protected contexts.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/gem_pxp.c | 355 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 356 insertions(+)
 create mode 100644 tests/i915/gem_pxp.c

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
new file mode 100644
index 00000000..c6083d0f
--- /dev/null
+++ b/tests/i915/gem_pxp.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+
+IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated HW-PXP-session");
+/* Note: PXP = "Protected Xe Path" */
+
+static int create_bo_ext(int i915, uint32_t size, bool protected_is_true, uint32_t *bo_out)
+{
+	int ret;
+	uint64_t size64 = size;
+	struct i915_user_extension *ext = NULL;
+
+	struct drm_i915_gem_create_ext_protected_content protected_ext = {
+		.base = { .name = I915_GEM_CREATE_EXT_PROTECTED_CONTENT },
+		.flags = 0,
+	};
+
+	if (protected_is_true)
+		ext = &protected_ext.base;
+
+	*bo_out = 0;
+	ret = __gem_create_ext(i915, &size64, bo_out, ext);
+
+	return ret;
+}
+
+static void test_bo_alloc_pxp_nohw(int i915)
+{
+	int ret;
+	uint32_t bo;
+
+	ret = create_bo_ext(i915, 4096, false, &bo);
+	igt_assert_eq(ret, 0);
+	gem_close(i915, bo);
+
+	ret = create_bo_ext(i915, 4096, true, &bo);
+	igt_assert_eq(ret, -ENODEV);
+	igt_assert_eq(bo, 0);
+}
+
+static void test_bo_alloc_pxp_off(int i915)
+{
+	int ret;
+	uint32_t bo;
+
+	ret = create_bo_ext(i915, 4096, false, &bo);
+	igt_assert_eq(ret, 0);
+	gem_close(i915, bo);
+}
+
+static void test_bo_alloc_pxp_on(int i915)
+{
+	int ret;
+	uint32_t bo;
+
+	ret = create_bo_ext(i915, 4096, true, &bo);
+	igt_assert_eq(ret, 0);
+	gem_close(i915, bo);
+}
+
+static int create_ctx_with_params(int i915, bool with_protected_param, bool protected_is_true,
+				  bool with_recoverable_param, bool recoverable_is_true,
+				  uint32_t *ctx_out)
+{
+	uint32_t flags = 0;
+	uint64_t extensions = 0;
+
+	struct drm_i915_gem_context_create_ext_setparam p_prot = {
+		.base = {
+			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+			.next_extension = 0,
+		},
+		.param = {
+			.param = I915_CONTEXT_PARAM_PROTECTED_CONTENT,
+			.value = 0,
+		}
+	};
+	struct drm_i915_gem_context_create_ext_setparam p_norecover = {
+		.base = {
+			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+			.next_extension = 0,
+		},
+		.param = {
+			.param = I915_CONTEXT_PARAM_RECOVERABLE,
+			.value = 0,
+		}
+	};
+
+	p_prot.param.value = protected_is_true;
+	p_norecover.param.value = recoverable_is_true;
+
+	if (with_protected_param && with_recoverable_param) {
+		p_norecover.base.next_extension = to_user_pointer(&(p_prot.base));
+		flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS;
+		extensions = to_user_pointer(&(p_norecover.base));
+	} else if (!with_protected_param && with_recoverable_param) {
+		p_norecover.base.next_extension = 0;
+		flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS;
+		extensions = to_user_pointer(&(p_norecover.base));
+	} else if (with_protected_param && !with_recoverable_param) {
+		p_prot.base.next_extension = 0;
+		flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS;
+		extensions = to_user_pointer(&(p_prot.base));
+	}
+
+	*ctx_out = 0;
+	return __gem_context_create_ext(i915, flags, extensions, ctx_out);
+
+}
+
+#define CHANGE_PARAM_PROTECTED 0x0001
+#define CHANGE_PARAM_RECOVERY 0x0002
+
+static int modify_ctx_param(int i915, uint32_t ctx_id, uint32_t param_mask, bool param_value)
+{
+	int ret;
+
+	struct drm_i915_gem_context_param ctx_param = {
+		.ctx_id = ctx_id,
+		.param = 0,
+		.value = 0,
+	};
+
+	if (param_mask == CHANGE_PARAM_PROTECTED) {
+		ctx_param.param = I915_CONTEXT_PARAM_PROTECTED_CONTENT;
+		ctx_param.value = (int)param_value;
+	} else if (param_mask == CHANGE_PARAM_RECOVERY) {
+		ctx_param.param = I915_CONTEXT_PARAM_RECOVERABLE;
+		ctx_param.value = (int)param_value;
+	}
+
+	ret = igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_SETPARAM, &ctx_param);
+
+	return ret;
+}
+
+static int get_ctx_protected_param(int i915, uint32_t ctx_id)
+{
+	int ret;
+
+	struct drm_i915_gem_context_param ctx_param = {
+		.ctx_id = ctx_id,
+		.param = I915_CONTEXT_PARAM_PROTECTED_CONTENT,
+	};
+
+	ret = igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_GETPARAM, &ctx_param);
+	igt_assert_eq(ret, 0);
+
+	return ctx_param.value;
+}
+
+static int get_ctx_recovery_param(int i915, uint32_t ctx_id)
+{
+	int ret;
+
+	struct drm_i915_gem_context_param ctx_param = {
+		.ctx_id = ctx_id,
+		.param = I915_CONTEXT_PARAM_RECOVERABLE,
+	};
+
+	ret = igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_GETPARAM, &ctx_param);
+	igt_assert_eq(ret, 0);
+
+	return ctx_param.value;
+}
+
+static bool is_pxp_hw_supported(int i915)
+{
+	uint32_t tmpctx;
+	int i = 0, ret;
+
+	/* when running too soon after boot, its possible the component interface
+	 * between i915 and MEI may have not yet established, give it some time
+	 */
+	while (i++ < 50) {
+		ret = create_ctx_with_params(i915, true, true, true, false, &tmpctx);
+		if (ret == 0) {
+			gem_context_destroy(i915, tmpctx);
+			return true;
+		}
+		usleep(50*1000);
+	}
+	return false;
+}
+
+static void test_ctx_alloc_pxp_nohw(int i915)
+{
+	uint32_t ctx;
+
+	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ctx), -ENODEV);
+	igt_assert_eq(create_ctx_with_params(i915, true, false, true, false, &ctx), 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	gem_context_destroy(i915, ctx);
+}
+
+static void test_ctx_alloc_recover_off_protect_off(int i915)
+{
+	uint32_t ctx;
+
+	igt_assert_eq(create_ctx_with_params(i915, true, false, true, false, &ctx), 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	gem_context_destroy(i915, ctx);
+}
+
+static void test_ctx_alloc_recover_off_protect_on(int i915)
+{
+	uint32_t ctx;
+
+	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ctx), 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	gem_context_destroy(i915, ctx);
+}
+
+static void test_ctx_alloc_recover_on_protect_off(int i915)
+{
+	uint32_t ctx;
+
+	igt_assert_eq(create_ctx_with_params(i915, true, false, true, true, &ctx), 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 1);
+	gem_context_destroy(i915, ctx);
+}
+
+static void test_ctx_alloc_recover_on_protect_on(int i915)
+{
+	uint32_t ctx;
+
+	igt_assert_eq(create_ctx_with_params(i915, true, true, true, true, &ctx), -EPERM);
+	igt_assert_eq(create_ctx_with_params(i915, true, true, false, false, &ctx), -EPERM);
+}
+
+static void test_ctx_mod_recover_off_to_on(int i915)
+{
+	uint32_t ctx;
+
+	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ctx), 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_RECOVERY, true), -EPERM);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	gem_context_destroy(i915, ctx);
+}
+
+static void test_ctx_mod_protected_on_to_off(int i915)
+{
+	uint32_t ctx;
+
+	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ctx), 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_PROTECTED, false), -EPERM);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	gem_context_destroy(i915, ctx);
+}
+
+static void test_ctx_mod_protected_to_all_invalid(int i915)
+{
+	uint32_t ctx;
+
+	igt_assert_eq(create_ctx_with_params(i915, true, true, true, false, &ctx), 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_RECOVERY, true), -EPERM);
+	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_PROTECTED, false), -EPERM);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	gem_context_destroy(i915, ctx);
+}
+
+static void test_ctx_mod_regular_to_all_valid(int i915)
+{
+	uint32_t ctx;
+
+	igt_assert_eq(create_ctx_with_params(i915, false, false, false, false, &ctx), 0);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 1);
+	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_RECOVERY, false), 0);
+	igt_assert_eq(modify_ctx_param(i915, ctx, CHANGE_PARAM_PROTECTED, true), -EPERM);
+	igt_assert_eq(get_ctx_protected_param(i915, ctx), 0);
+	igt_assert_eq(get_ctx_recovery_param(i915, ctx), 0);
+	gem_context_destroy(i915, ctx);
+}
+
+igt_main
+{
+	int i915 = -1;
+	bool pxp_supported = false;
+
+	igt_fixture
+	{
+		i915 = drm_open_driver(DRIVER_INTEL);
+		igt_require(i915);
+		igt_require_gem(i915);
+		pxp_supported = is_pxp_hw_supported(i915);
+	}
+
+	igt_subtest_group {
+		igt_fixture {
+			igt_require((pxp_supported == 0));
+		}
+
+		igt_describe("Verify protected buffer on unsupported hw:");
+		igt_subtest("hw-rejects-pxp-buffer")
+			test_bo_alloc_pxp_nohw(i915);
+		igt_describe("Verify protected context on unsupported hw:");
+		igt_subtest("hw-rejects-pxp-context")
+			test_ctx_alloc_pxp_nohw(i915);
+	}
+
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(pxp_supported);
+		}
+
+		igt_describe("Verify protected buffer on supported hw:");
+		igt_subtest("create-regular-buffer")
+			test_bo_alloc_pxp_off(i915);
+		igt_subtest("create-protected-buffer")
+			test_bo_alloc_pxp_on(i915);
+
+		igt_describe("Verify protected context on supported hw:");
+		igt_subtest("create-regular-context-1")
+			test_ctx_alloc_recover_off_protect_off(i915);
+		igt_subtest("create-regular-context-2")
+			test_ctx_alloc_recover_on_protect_off(i915);
+		igt_subtest("fail-invalid-protected-context")
+			test_ctx_alloc_recover_on_protect_on(i915);
+		igt_subtest("create-valid-protected-context")
+			test_ctx_alloc_recover_off_protect_on(i915);
+
+		igt_describe("Verify protected context integrity:");
+		igt_subtest("reject-modify-context-protection-on")
+			test_ctx_mod_regular_to_all_valid(i915);
+		igt_subtest("reject-modify-context-protection-off-1")
+			test_ctx_mod_recover_off_to_on(i915);
+		igt_subtest("reject-modify-context-protection-off-2")
+			test_ctx_mod_protected_on_to_off(i915);
+		igt_subtest("reject-modify-context-protection-off-3")
+			test_ctx_mod_protected_to_all_invalid(i915);
+	}
+
+	igt_fixture {
+		close(i915);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 99557912..7bd650d5 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -169,6 +169,7 @@ i915_progs = [
 	'gem_pread_after_blit',
 	'gem_pwrite',
 	'gem_pwrite_snooped',
+	'gem_pxp',
 	'gem_read_read_speed',
 	'gem_readwrite',
 	'gem_reg_read',
-- 
2.25.1
