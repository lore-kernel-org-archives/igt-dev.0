Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDFC6E958
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jul 2021 09:23:38 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Fri, 16 Jul 2021 02:23:29 -0700
Message-Id: <20210716092334.961262-12-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210716092334.961262-1-alan.previn.teres.alexis@intel.com>
References: <20210716092334.961262-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 11/16] Verify execbuf fails with stale
 PXP context after teardown
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add a subtest to verify that reusing a stale protected context
in a gem_execbuff after a teardown (triggered by suspend-resume
cycle) shall fail with -EACCES error.

NOTE: The end-to-end architecture requirement includes that
any break in the links of the PXP sessions needs to trigger a
full teardown and the application needs to be made aware of that
allowing it to re-establish the end-to-end pipeline of buffers,
contexts and renders again if it chooses to. This stricter
behavior targets only contexts created with PXP enabled.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/intel_batchbuffer.c |   2 +-
 lib/intel_batchbuffer.h |   3 +
 tests/i915/gem_pxp.c    | 135 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index fae0ec4c..a39d814b 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2471,7 +2471,7 @@ static void update_offsets(struct intel_bb *ibb,
  * Note: In this step execobj for bb is allocated and inserted to the objects
  * array.
 */
-static int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
+int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
 			   uint64_t flags, bool sync)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 1c5ce3fa..e650b028 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -660,6 +660,9 @@ uint64_t intel_bb_offset_reloc_to_object(struct intel_bb *ibb,
 					 uint32_t offset,
 					 uint64_t presumed_offset);
 
+int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
+			uint64_t flags, bool sync);
+
 void intel_bb_dump_cache(struct intel_bb *ibb);
 
 void intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 5fd728e7..230d3ba3 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -15,6 +15,14 @@ struct powermgt_data {
 	bool has_runtime_pm;
 };
 
+struct simple_exec_assets {
+	uint32_t ctx;
+	uint32_t fencebo;
+	struct intel_buf *fencebuf;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+};
+
 static int create_bo_ext(int i915, uint32_t size, bool protected_is_true, uint32_t *bo_out)
 {
 	int ret;
@@ -649,6 +657,131 @@ static void test_pxp_pwrcycle_teardown_keychange(int i915, struct powermgt_data
 	igt_assert_eq(matched_after_keychange, 0);
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
+	intel_bb_emit_reloc(ibb, fenceb->handle, 0, I915_GEM_DOMAIN_COMMAND, (before?0:8),
+			    fenceb->addr.offset);
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
+static int gem_execbuf_flush_store_dw(int i915, struct intel_bb *ibb, uint32_t ctx,
+				      struct intel_buf *fence)
+{
+	int ret;
+
+	intel_bb_ptr_set(ibb, 0);
+	intel_bb_add_intel_buf(ibb, fence, true);
+	emit_pipectrl(ibb, fence, true);
+	intel_bb_emit_bbe(ibb);
+	ret = __intel_bb_exec(ibb, intel_bb_offset(ibb),
+				  I915_EXEC_RENDER | I915_EXEC_NO_RELOC, false);
+	if (ret == 0) {
+		gem_sync(ibb->i915, fence->handle);
+		assert_pipectl_storedw_done(i915, fence->handle);
+	}
+	return ret;
+}
+
+static void prepare_exec_assets(int i915, struct simple_exec_assets *data, bool ctx_pxp,
+				bool buf_pxp)
+{
+	int ret;
+
+	if (ctx_pxp)
+		ret = create_ctx_with_params(i915, true, true, true, false, &(data->ctx));
+	else
+		ret = create_ctx_with_params(i915, false, false, false, false, &(data->ctx));
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(get_ctx_protected_param(i915, data->ctx), ctx_pxp);
+	data->ibb = intel_bb_create_with_context(i915, data->ctx, 4096);
+	igt_assert(data->ibb);
+
+	data->fencebo = alloc_and_fill_dest_buff(i915, buf_pxp, 4096, 0);
+
+	data->bops = buf_ops_create(i915);
+	igt_assert(data->bops);
+
+	data->fencebuf = intel_buf_create_using_handle(data->bops, data->fencebo, 256, 4,
+						       32, 0, I915_TILING_NONE, 0);
+	intel_bb_add_intel_buf(data->ibb, data->fencebuf, true);
+}
+
+static void free_exec_assets(int i915, struct simple_exec_assets *data)
+{
+	intel_bb_destroy(data->ibb);
+	gem_close(i915, data->fencebo);
+	intel_buf_destroy(data->fencebuf);
+	gem_context_destroy(i915, data->ctx);
+	buf_ops_destroy(data->bops);
+}
+
+static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_data *pm)
+{
+	int ret;
+	struct simple_exec_assets data = {0};
+
+	/*
+	 * Use normal buffers for testing for invalidation
+	 * of protected contexts to ensure kernel is catching
+	 * the invalidated context (not buffer)
+	 */
+	prepare_exec_assets(i915, &data, true, false);
+	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
+	igt_assert(ret == 0);
+
+	trigger_powermgt_suspend_cycle(i915, pm);
+
+	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
+	igt_assert_f((ret == -EACCES), "Executing stale pxp context didn't fail with -EACCES\n");
+
+	free_exec_assets(i915, &data);
+}
+
 igt_main
 {
 	int i915 = -1;
@@ -738,6 +871,8 @@ igt_main
 		igt_describe("Verify suspend-resume teardown management:");
 		igt_subtest("verify-pxp-key-change-after-suspend-resume")
 			test_pxp_pwrcycle_teardown_keychange(i915, &pm);
+		igt_subtest("verify-pxp-execution-behavior-after-suspend-resume")
+			test_pxp_pwrcycle_staleasset_execution(i915, &pm);
 	}
 
 	igt_fixture {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
