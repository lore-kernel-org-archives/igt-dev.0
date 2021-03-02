Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40F389E0D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 22:58:41 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  2 Mar 2021 14:53:33 -0800
Message-Id: <20210302225334.361966-11-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 10/11] Verify gem_execbuf fails with stale PXP
 context after teardown
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

Add a subtest to verify that reusing a stale protected context
in a gem_execbuff after a teardown (triggered by suspend-resume
cycle) shall fail with -EIO error.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/i915_pxp.c | 132 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/tests/i915/i915_pxp.c b/tests/i915/i915_pxp.c
index 11ca05df..b8c82ea9 100644
--- a/tests/i915/i915_pxp.c
+++ b/tests/i915/i915_pxp.c
@@ -679,12 +679,107 @@ static void trigger_powermgt_suspend_cycle(int i915,
 	}
 }
 
+#define GFX_OP_PIPE_CONTROL    ((3 << 29) | (3 << 27) | (2 << 24))
+#define PIPE_CONTROL_CS_STALL	            (1 << 20)
+#define PIPE_CONTROL_RENDER_TARGET_FLUSH    (1 << 12)
+#define PIPE_CONTROL_FLUSH_ENABLE           (1 << 7)
+#define PIPE_CONTROL_DATA_CACHE_INVALIDATE  (1 << 5)
+#define PIPE_CONTROL_PROTECTEDPATH_DISABLE  (1 << 27)
+#define PIPE_CONTROL_PROTECTEDPATH_ENABLE   (1 << 22)
+#define PIPE_CONTROL_POST_SYNC_OP           (1 << 14)
+#define PIPE_CONTROL_POST_SYNC_OP_STORE_DW_IDX (1 << 21)
+#define PS_OP_TAG_BEFORE                    0x1234fed0
+#define PS_OP_TAG_AFTER                     0x5678cbaf
+static void emit_pipectrl(struct intel_bb *ibb,
+		 struct intel_buf *fenceb, bool before)
+{
+	uint32_t pipe_ctl_flags = 0;
+	uint32_t ps_op_id;
+
+	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
+	intel_bb_out(ibb, pipe_ctl_flags);
+
+	if (before)
+		ps_op_id = PS_OP_TAG_BEFORE;
+	else
+		ps_op_id = PS_OP_TAG_AFTER;
+
+	pipe_ctl_flags = (PIPE_CONTROL_FLUSH_ENABLE |
+				PIPE_CONTROL_CS_STALL |
+				PIPE_CONTROL_POST_SYNC_OP);
+	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | 4);
+	intel_bb_out(ibb, pipe_ctl_flags);
+	intel_bb_emit_reloc(ibb, fenceb->handle,
+		0, I915_GEM_DOMAIN_COMMAND,
+		(before?0:8), fenceb->addr.offset);
+	intel_bb_out(ibb, ps_op_id);
+	intel_bb_out(ibb, ps_op_id);
+	intel_bb_out(ibb, MI_NOOP);
+	intel_bb_out(ibb, MI_NOOP);
+}
+
+static void assert_pipectl_storedw_done(int i915, uint32_t bo,
+		uint32_t maptype)
+{
+	uint32_t *ptr;
+	uint32_t success_mask = 0x0;
+
+	switch (maptype) {
+	case I915_GEM_DOMAIN_CPU:
+		ptr = gem_mmap__cpu(i915, bo, 0, 4096, PROT_READ);
+		gem_set_domain(i915, bo, I915_GEM_DOMAIN_CPU,
+			I915_GEM_DOMAIN_CPU);
+		break;
+	case I915_GEM_DOMAIN_GTT:
+		ptr = gem_mmap__gtt(i915, bo, 4096, PROT_READ);
+		gem_set_domain(i915, bo, I915_GEM_DOMAIN_GTT,
+			I915_GEM_DOMAIN_GTT);
+		break;
+	default:
+	case I915_GEM_DOMAIN_WC:
+		ptr = gem_mmap__device_coherent(i915, bo, 0, 4096, PROT_READ);
+		gem_set_domain(i915, bo, I915_GEM_DOMAIN_WC,
+			I915_GEM_DOMAIN_WC);
+		break;
+	}
+	igt_assert(ptr);
+	if (ptr[0] == PS_OP_TAG_BEFORE && ptr[1] == PS_OP_TAG_BEFORE)
+		success_mask |= 0x1;
+
+	igt_assert_eq(success_mask, 0x1);
+	igt_assert(gem_munmap(ptr, 4096) == 0);
+}
+
+static void gem_execbuf_flush_store_dw(int i915, struct intel_bb *ibb,
+	uint32_t ctx, struct intel_buf *fence, int expected_gemexec_response)
+{
+	int execret;
+
+	intel_bb_ptr_set(ibb, 0);
+	intel_bb_add_intel_buf(ibb, fence, true);
+	emit_pipectrl(ibb, fence, true);
+	intel_bb_emit_bbe(ibb);
+	execret = intel_bb_exec_noassert(ibb, intel_bb_offset(ibb),
+		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, false);
+
+	igt_assert_eq(execret, expected_gemexec_response);
+	if (expected_gemexec_response == 0) {
+		gem_sync(ibb->i915, fence->handle);
+		assert_pipectl_storedw_done(i915,
+			fence->handle, I915_GEM_DOMAIN_WC);
+	}
+}
+
 static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 		struct powermgt_data *pm)
 {
 	uint32_t encrypted_pixels_b4[TSTSURF_SIZE/TSTSURF_BYTESPP];
 	uint32_t encrypted_pixels_aft[TSTSURF_SIZE/TSTSURF_BYTESPP];
 	int matched_after_keychange = 0, loop = 0;
+	uint32_t ctx, fencebo;
+	struct intel_buf *fencebuf;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
 
 	switch (test_cfg) {
 	case SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE:
@@ -706,6 +801,38 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 		}
 		igt_assert_eq(matched_after_keychange, 0);
 		break;
+
+	case SESSION_PMSUSPEND_TEARDOWN_PROTCTX_BAN_EXEC:
+		ctx = create_protected_ctx(i915, true, true,
+			true, false, 0);
+		assert_ctx_protected_param(i915, ctx, true);
+
+		ibb = intel_bb_create_with_context(i915, ctx, 4096);
+		igt_assert(ibb);
+
+		bops = buf_ops_create(i915);
+		igt_assert(bops);
+
+		fencebo = create_protected_bo(i915, 4096,
+				false, false, 0);
+		igt_assert(fencebo);
+		fill_bo_content(i915, fencebo, 1024, 0x0);
+
+		fencebuf = intel_buf_create_using_handle(bops, fencebo,
+				256, 4,	32, 0, I915_TILING_NONE, 0);
+		intel_bb_add_intel_buf(ibb, fencebuf, true);
+
+		gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, 0);
+		trigger_powermgt_suspend_cycle(i915, pm);
+		gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, -EIO);
+
+		intel_bb_destroy(ibb);
+		intel_buf_destroy(fencebuf);
+		gem_close(i915, fencebo);
+		gem_context_destroy(i915, ctx);
+		buf_ops_destroy(bops);
+		break;
+
 	default:
 		igt_info("Skipping unknown power-mgt test_cfg = %d\n",
 			test_cfg);
@@ -821,6 +948,11 @@ igt_main
 				SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE,
 				&pm);
 		}
+		igt_subtest("reject-old-context-execution-after-suspend-resume") {
+			test_protected_session_teardown(i915,
+				SESSION_PMSUSPEND_TEARDOWN_PROTCTX_BAN_EXEC,
+				&pm);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
