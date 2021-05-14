Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A3D6EE12
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 06:50:09 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Thu, 13 May 2021 23:49:51 -0700
Message-Id: <20210514064953.1644250-15-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
References: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 14/16] Ensure RESET_STAT reports invalidated
 protected context
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

When protected contexts are created but get invalidated
due to PXP session teardown (such as after a suspend-resume
cycle), RESET_STAT ioctl for said context will report it
as I915_CONTEXT_INVALIDATED.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index ef93c4fe..def452cc 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -40,6 +40,7 @@ IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated
 #define SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC 2
 #define SESSION_PMSUSPEND_STALEPROTBO_BAN_EXEC 3
 #define SESSION_PMSUSPEND_STALECTX_STALEPROTBO_EXEC_OK 4
+#define SESSION_PMSUSPEND_STALEPROTCTX_IN_RESETSTAT 5
 
 /* Struct and defintions for power management. */
 struct powermgt_data {
@@ -684,6 +685,25 @@ static void gem_execbuf_flush_store_dw(int i915, struct intel_bb *ibb,
 	}
 }
 
+static void check_context_invalid_state(int i915,
+		uint32_t ctx, bool is_expected_invalid)
+{
+	struct drm_i915_reset_stats rs;
+	bool ctx_is_invalid = false;
+	int ret;
+
+	memset(&rs, 0, sizeof(rs));
+	rs.ctx_id = ctx;
+
+	ret = drmIoctl(i915, DRM_IOCTL_I915_GET_RESET_STATS, &rs);
+	igt_assert(ret == 0);
+
+	if (rs.flags & I915_CONTEXT_INVALIDATED)
+		ctx_is_invalid = true;
+	igt_assert_eq(is_expected_invalid, ctx_is_invalid);
+
+}
+
 static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 		struct powermgt_data *pm)
 {
@@ -779,6 +799,27 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 		buf_ops_destroy(bops);
 		break;
 
+	case SESSION_PMSUSPEND_STALEPROTCTX_IN_RESETSTAT:
+		ctx = create_protected_ctx(i915, true, true, true, false, 0);
+		assert_ctx_protected_param(i915, ctx, true);
+
+		ibb = intel_bb_create_with_context(i915, ctx, 4096);
+		igt_assert(ibb);
+
+		bops = buf_ops_create(i915);
+		igt_assert(bops);
+
+		fencebuf = intel_buf_create_using_handle(bops, fencebo, 256, 4,
+							 32, 0, I915_TILING_NONE, 0);
+		intel_bb_add_intel_buf(ibb, fencebuf, true);
+
+		gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, 0);
+		check_context_invalid_state(i915, ctx, false);
+
+		trigger_powermgt_suspend_cycle(i915, pm);
+		check_context_invalid_state(i915, ctx, true);
+		break;
+
 	default:
 		igt_info("Skipping unknown power-mgt test_cfg = %d\n", test_cfg);
 		break;
@@ -884,6 +925,9 @@ igt_main
 		igt_subtest("allow-regular-ctx-old-prot-buff-execution-after-suspend-resume") {
 			test_protected_session_teardown(i915, SESSION_PMSUSPEND_STALECTX_STALEPROTBO_EXEC_OK, &pm);
 		}
+		igt_subtest("old-prot-context-reports-reset-stat-after-suspend-resume") {
+			test_protected_session_teardown(i915, SESSION_PMSUSPEND_STALEPROTCTX_IN_RESETSTAT, &pm);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
