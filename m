Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683FF6EE12
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 06:50:10 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Thu, 13 May 2021 23:49:48 -0700
Message-Id: <20210514064953.1644250-12-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
References: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/16] Verify execbuf fails with stale PXP
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

NOTE: The end-to-end architecture requirement includes that
any break in the links of the PXP sessions needs to trigger a
full teardown and the application needs to be made aware of that
allowing it to re-establish the end-to-end pipeline of buffers,
contexts and renders again if it chooses to. This stricter
behavior targets only contexts created with PXP enabled.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/intel_batchbuffer.c |   2 +-
 lib/intel_batchbuffer.h |   3 ++
 tests/i915/gem_pxp.c    | 110 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 23957109..e16ab056 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2536,7 +2536,7 @@ static void update_offsets(struct intel_bb *ibb,
  * Note: In this step execobj for bb is allocated and inserted to the objects
  * array.
 */
-static int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
+int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
 			   uint64_t flags, bool sync)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 389da7b2..b16ae00f 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -664,6 +664,9 @@ uint64_t intel_bb_offset_reloc_to_object(struct intel_bb *ibb,
 					 uint32_t offset,
 					 uint64_t presumed_offset);
 
+int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
+			uint64_t flags, bool sync);
+
 void intel_bb_dump_cache(struct intel_bb *ibb);
 
 void intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 37c38016..1952e230 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -37,6 +37,7 @@ IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated
 
 /* test-configs for power-management triggered protected session teardown */
 #define SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE 1
+#define SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC 2
 
 /* Struct and defintions for power management. */
 struct powermgt_data {
@@ -611,12 +612,86 @@ static void trigger_powermgt_suspend_cycle(int i915,
 	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
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
+
+static void emit_pipectrl(struct intel_bb *ibb, struct intel_buf *fenceb, bool before)
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
+			  PIPE_CONTROL_CS_STALL |
+			  PIPE_CONTROL_POST_SYNC_OP);
+	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | 4);
+	intel_bb_out(ibb, pipe_ctl_flags);
+	intel_bb_emit_reloc(ibb, fenceb->handle, 0, I915_GEM_DOMAIN_COMMAND, (before?0:8), fenceb->addr.offset);
+	intel_bb_out(ibb, ps_op_id);
+	intel_bb_out(ibb, ps_op_id);
+	intel_bb_out(ibb, MI_NOOP);
+	intel_bb_out(ibb, MI_NOOP);
+}
+
+static void assert_pipectl_storedw_done(int i915, uint32_t bo)
+{
+	uint32_t *ptr;
+	uint32_t success_mask = 0x0;
+
+	ptr = gem_mmap__device_coherent(i915, bo, 0, 4096, PROT_READ);
+
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
+	execret = __intel_bb_exec(ibb, intel_bb_offset(ibb),
+				  I915_EXEC_RENDER | I915_EXEC_NO_RELOC, false);
+
+	igt_assert_eq(execret, expected_gemexec_response);
+	if (expected_gemexec_response == 0) {
+		gem_sync(ibb->i915, fence->handle);
+		assert_pipectl_storedw_done(i915, fence->handle);
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
@@ -636,6 +711,38 @@ static void test_protected_session_teardown(int i915, uint32_t test_cfg,
 		igt_assert_eq(matched_after_keychange, 0);
 		break;
 
+	case SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC:
+		ctx = create_protected_ctx(i915, true, true, true, false, 0);
+		assert_ctx_protected_param(i915, ctx, true);
+
+		/* use normal buffers for testing for invalidation
+		 * of protected contexts to ensure kernel is catching
+		 * the invalidated context (not buffer)
+		 */
+		fencebo = alloc_and_fill_dest_buff(i915, false, 4096, 0);
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
+		trigger_powermgt_suspend_cycle(i915, pm);
+
+		gem_execbuf_flush_store_dw(i915, ibb, ctx, fencebuf, -EACCES);
+
+		intel_bb_destroy(ibb);
+		intel_buf_destroy(fencebuf);
+		gem_close(i915, fencebo);
+		gem_context_destroy(i915, ctx);
+		buf_ops_destroy(bops);
+		break;
+
 	default:
 		igt_info("Skipping unknown power-mgt test_cfg = %d\n", test_cfg);
 		break;
@@ -732,6 +839,9 @@ igt_main
 		igt_subtest("verify-pxp-key-change-after-suspend-resume") {
 			test_protected_session_teardown(i915, SESSION_PMSUSPEND_TEARDOWN_KEY_CHANGE, &pm);
 		}
+		igt_subtest("reject-old-prot-context-execution-after-suspend-resume") {
+			test_protected_session_teardown(i915, SESSION_PMSUSPEND_STALEPROTCTX_BAN_EXEC, &pm);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
