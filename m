Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C826EEA855D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 05:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7764610E48C;
	Mon,  9 Mar 2026 05:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYdiEvMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1495E10E48C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 05:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773034965; x=1804570965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0z1Jx8s3wYVm7ROYdxb93Br5nXDKgNyYxPixHkl8ZA=;
 b=gYdiEvMgTepMgu8wUtl8V6u0h1nTHsYgTImUwQk70sFo2SK+soYc8D+4
 V3zBE+1w073JkefQQE3uz8aUwvuTvBuaQUrbQ9+4CINQ78vbE0bEuwd5u
 OKXl+kIZnNTaMqhgkAAZitfw4bWW33MgosJSvgcgAQZun9KdU+VhiZlmU
 xrEwvA9OLyk1jv+PtFeIOF+qz12GTOzGcVkXfb3u55ghGIIgL+gV5za/h
 75pDJQyCh6q39SsVEy56LVdMilbFuCKJUz7zKewxLF74sYu5xMMJXMoK7
 NdNfW/dobadizW92wxrgChLiDNOMOECJzamiFy11lYj62veqNdCJgYvFB A==;
X-CSE-ConnectionGUID: Mjm6ktMTQ36rRdOzPJNS/w==
X-CSE-MsgGUID: ImKWOnLyTuqBDCZVdDroKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74163075"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74163075"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 22:42:45 -0700
X-CSE-ConnectionGUID: E+W4XbiwQQmJH+apclUzpQ==
X-CSE-MsgGUID: ADZBSupwSWm+0mFMe/XEFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218851540"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 22:42:44 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Cc: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Subject: [PATCH 2/3] tests/intel : Add data structs & helper utilities for
 VM_Bind Neg tests
Date: Mon,  9 Mar 2026 11:12:59 +0530
Message-ID: <20260309054300.642203-3-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309054300.642203-1-smitha.balasubramanyam@intel.com>
References: <20260309054300.642203-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>

Introduce data structures and helper utilities used by the VM
negative tests in xe_vm.

These helpers provide resource management and setup/cleanup
logic that simplifies the implementation of the test cases
introduced in subsequent patches.

No functional tests are introduced in this patch.
---
 tests/intel/xe_ccs.c | 310 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 308 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 4424f6f9b..da78bc3aa 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -355,8 +355,314 @@ static void surf_copy(int xe,
 	gem_close(xe, bb2);
 
 	igt_assert_f(result == 0,
-		     "Source and destination surfaces are different after "
-		     "restoring source ccs data\n");
+			"Source and destination surfaces are different after "
+			"restoring source ccs data\n");
+}
+
+/* Data-driven case & state used by vm_bind_decompress negative test cases */
+struct vm_bind_decomp_neg_test_case {
+	const char *test_name;
+	uint32_t pat;      /* use 32-bit for ioctl param safety */
+	uint32_t flags;    /* DRM_XE_VM_BIND_FLAG_* */
+	bool expect_fail;  /* true => we expect kernel to reject (result != 0) */
+};
+
+struct vm_bind_decomp_setup_resources {
+	int xe;
+	u32 vm;
+	u64 vm_map_addr;
+	u64 map_size;
+	u32 handle;       /* compressed BO handle */
+	u32 bb;
+	u32 region_src;
+	u32 region_comp;
+	u64 size;
+	uint32_t comp_pat;
+	uint32_t uncompressed_pat;
+
+	/* objects to destroy/map bookkeeping */
+	struct blt_copy_object *src_obj;
+	struct blt_copy_object *comp_obj;
+};
+
+/* Cleanup for VM_Bind Decomp Negative test cases */
+static void vm_bind_decomp_test_cleanup(int xe, uint64_t ahnd,
+		struct vm_bind_decomp_setup_resources *state)
+{
+	if (!state)
+		return;
+
+	/* If we left a VM mapping, try to unmap it */
+	if (state->vm && state->vm_map_addr && state->map_size) {
+		int ret = __xe_vm_bind(xe, state->vm, 0, 0, 0,
+				state->vm_map_addr, state->map_size,
+				DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
+		igt_info("Unmapping VM mapping at addr 0x%llx, size %llu, ret=%d\n",
+				(unsigned long long)state->vm_map_addr,
+				(unsigned long long)state->map_size,
+				ret);
+	}
+
+	/* Remove allocator offsets if set */
+	if (ahnd) {
+		if (state->src_obj && state->src_obj->handle) {
+			igt_debug("Removing allocator offset for src_obj handle %u\n",
+					state->src_obj->handle);
+			put_offset(ahnd, state->src_obj->handle);
+		}
+		if (state->comp_obj && state->comp_obj->handle)
+			put_offset(ahnd, state->comp_obj->handle);
+		igt_debug("Removed allocator offsets for src_obj and comp_obj if they existed\n");
+		if (state->bb)
+			put_offset(ahnd, state->bb);
+		igt_debug("Removed allocator offset for bb handle %u\n", state->bb);
+		intel_allocator_bind(ahnd, 0, 0);
+		igt_info("SUCCESS : Cleared allocator bindings\n");
+	}
+
+	/* Destroy blit objects */
+	if (state->src_obj)
+		blt_destroy_object(xe, state->src_obj);
+	if (state->comp_obj)
+		blt_destroy_object(xe, state->comp_obj);
+	igt_info("SUCCESS : Destroyed blit objects if they existed\n");
+
+	/* Close bb handle(s) */
+
+	if (state->bb) {
+		gem_close(xe, state->bb);
+		igt_info("SUCCESS : Close bb handle\n");
+	}
+
+	/* Destroy VM */
+	if (state->vm)
+		xe_vm_destroy(xe, state->vm);
+	igt_info("SUCCESS : Destroyed VM if it existed\n");
+
+	/* Clear fields to make it safe to call again */
+	memset(state, 0, sizeof(*state));
+	igt_info("SUCCESS : Cleared state structure\n");
+
+	igt_info("SUCCESS : Cleanup completed\n");
+}
+
+/* Setup function: prepares state->src_obj, state->comp_obj, VM and initial map.
+ * On any failure it calls vm_bind_decomp_test_setup() then igt_assert_f() to abort safely.
+ */
+static int vm_bind_decomp_test_setup(int xe, intel_ctx_t *ctx, uint64_t ahnd,
+		u32 region_src, u32 region_comp, u32 width, u32 height,
+		enum blt_tiling_type tiling,
+		const struct test_config *config,
+		bool is_gradient,
+		struct vm_bind_decomp_setup_resources *state)
+{
+	struct blt_copy_data blt = {};
+	struct blt_block_copy_data_ext ext = {};
+	u64 bb_size = xe_bb_size(xe, SZ_4K);
+	u8 uc_mocs = intel_get_uc_mocs_index(xe);
+	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
+	const u32 bpp = 32;
+	int result = -1;
+	uint32_t devid;
+
+	igt_assert(state != NULL);
+	memset(state, 0, sizeof(*state));
+
+	state->xe = xe;
+	state->region_src = region_src;
+	state->region_comp = region_comp;
+	state->vm_map_addr = 0x30000000;
+	state->size = (u64)width * height * 4;
+	state->map_size = ALIGN(state->size, xe_get_default_alignment(xe));
+
+	/* Precondition checks - do these before allocating resources */
+	devid = intel_get_drm_devid(xe);
+	igt_require(intel_gen(devid) >= 20);
+	igt_require(config->compression);
+	igt_require(blt_uses_extended_block_copy(xe));
+	igt_require(blt_platform_has_flat_ccs_enabled(xe));
+
+	/* Create VM */
+	state->vm = xe_vm_create(xe, 0, 0);
+	if (state->vm <= 0) {
+		vm_bind_decomp_test_cleanup(xe, ahnd, state);
+		igt_assert_f(false, "xe_vm_create() failed: %d\n", state->vm);
+	}
+
+	/* Create BB */
+	state->bb = xe_bo_create(xe, 0, bb_size, region_src,
+			DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	if (!state->bb) {
+		vm_bind_decomp_test_cleanup(xe, ahnd, state);
+		igt_assert_f(false, "xe_bo_create() for BB failed\n");
+	}
+
+	/* Init blit + batch */
+	blt_copy_init(xe, &blt);
+	blt_set_batch(&blt.bb, state->bb, bb_size, region_src);
+
+	/* Create src (uncompressed) */
+	state->src_obj = blt_create_object(&blt, region_src, width, height, bpp,
+			uc_mocs, T_LINEAR, COMPRESSION_DISABLED,
+			comp_type, true);
+	if (!state->src_obj || !state->src_obj->ptr) {
+		vm_bind_decomp_test_cleanup(xe, ahnd, state);
+		igt_assert_f(false, "failed to create or map src object\n");
+	}
+
+	/* Fill deterministic compressible data */
+	if (is_gradient)
+		blt_surface_fill_rect(xe, state->src_obj, width, height);
+	else {
+		fill_buffer_simple_pattern(state->src_obj->ptr, state->src_obj->size);
+		igt_assert_f(verify_test_pattern(state->src_obj->ptr,
+					state->src_obj->size, "SOURCE"),
+				"Source pattern verification failed");
+	}
+	/* Create compressed destination object */
+	state->comp_obj = blt_create_object(&blt, region_comp, width, height, bpp,
+			uc_mocs, tiling, COMPRESSION_ENABLED,
+			comp_type, true);
+	if (!state->comp_obj) {
+		vm_bind_decomp_test_cleanup(xe, ahnd, state);
+		igt_assert_f(false, "failed to create compressed object\n");
+	}
+
+	/* Compress using GPU: caller must provide ctx/ahnd */
+	blt.color_depth = CD_32bit;
+	blt.print_bb = param.print_bb;
+	blt_set_copy_object(&blt.src, state->src_obj);
+	blt_set_copy_object(&blt.dst, state->comp_obj);
+	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
+	blt_set_object_ext(&ext.dst, param.compression_format, width, height, SURFACE_TYPE_2D);
+
+	/* Use provided ctx/ahnd */
+	igt_assert(ctx && ahnd);
+	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
+	intel_ctx_xe_sync(ctx, true);
+
+	/* Verify compression occurred when platform supports it */
+	if (blt_platform_has_flat_ccs_enabled(xe)) {
+		bool is_compressed = blt_surface_is_compressed(xe, ctx, NULL,
+				ahnd, state->comp_obj);
+		if (!is_compressed) {
+			vm_bind_decomp_test_cleanup(xe, ahnd, state);
+			igt_assert_f(false, "Surface compression failed,cannot test decompression\n");
+		}
+	}
+
+	/* store handles and PATs */
+	state->handle = state->comp_obj->handle;
+	state->uncompressed_pat = intel_get_pat_idx_uc(xe);
+	state->comp_pat = intel_get_pat_idx_uc_comp(xe);
+
+	/* perform initial map using compressed pat */
+	result = __xe_vm_bind(xe, state->vm, 0, state->handle, 0, state->vm_map_addr,
+			state->map_size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0, state->comp_pat, 0);
+	if (result != 0) {
+		vm_bind_decomp_test_cleanup(xe, ahnd, state);
+		igt_assert_f(false, "initial __xe_vm_bind MAP failed: %d (%s)\n",
+				result, strerror(errno));
+	}
+	/* success */
+	return 0;
+}
+
+/* Helper: submit a tiny GPU batch that writes an immediate dword to the
+ * provided VA. This forces the kernel to fault in / decompress pages
+ * for that VA. Uses the provided `ctx` and `ahnd` (caller should have
+ * created/validated these).
+ */
+static void trigger_page_fault_write(int xe, intel_ctx_t *ctx, uint64_t unused_ahnd,
+		uint64_t vm_map_addr, uint32_t region)
+{
+	u32 cmd_bo = 0;
+	uint64_t cmd_off = 0;
+	uint32_t *cmdp = MAP_FAILED;
+	uint64_t local_ahnd = 0;
+	int ret;
+
+	/* Open a short-lived allocator for this command BO to avoid colliding
+	 * with the main test allocator bookkeeping.
+	 */
+	local_ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
+	igt_assert_f(local_ahnd, "failed to open temporary allocator\n");
+
+	/* Create a small command BO in the provided region */
+	cmd_bo = xe_bo_create(xe, 0, 4096, region, 0);
+	igt_assert_f(cmd_bo, "failed to create cmd_bo\n");
+
+	/* Reserve an allocator offset for the BO using local_ahnd */
+	cmd_off = get_offset(local_ahnd, cmd_bo, 4096, 0);
+	igt_assert_f(cmd_off, "get_offset for cmd_bo failed\n");
+
+	/* Map the BO to write the batch */
+	cmdp = xe_bo_map(xe, cmd_bo, 4096);
+	igt_assert_f(cmdp != MAP_FAILED, "xe_bo_map cmd_bo failed\n");
+
+	/* Build a tiny batch: MI_STORE_DWORD_IMM dst=vm_map_addr, value=0xDEADBEEF */
+	cmdp[0] = MI_STORE_DWORD_IMM;
+	cmdp[1] = 0;
+	cmdp[2] = (uint32_t)(vm_map_addr & 0xffffffffu);
+	cmdp[3] = (uint32_t)((vm_map_addr >> 32) & 0xffffffffu);
+	cmdp[4] = 0xDEADBEEFu;
+	cmdp[5] = MI_BATCH_BUFFER_END;
+
+	/* Dump the first few dwords of the BB (do this BEFORE munmap) */
+	igt_info("BB dump: cmd_bo=%u cmd_off=0x%llx region=%u vm=%u execq=%u",
+			cmd_bo, (unsigned long long)CANONICAL(cmd_off), region, ctx->vm,
+			ctx->exec_queue);
+	for (int i = 0; i < 8; i++)
+		igt_info(" bb[%02d]=0x%08x", i, cmdp[i]);
+
+	/* Make CPU writes visible to GPU */
+	munmap(cmdp, 4096);
+	cmdp = MAP_FAILED;
+
+	//To-Do : In Fault_mode, observing that there is a hang here with wb_pat case.
+	/* Tried falling back to rcs engine and the test worked, need to clarify on this */
+	/* Post discussion, will cleanup the code*/
+	// /* Try submit in non-asserting way to inspect errors and retry on RCS */
+	// int r = __intel_ctx_xe_exec(ctx, local_ahnd, CANONICAL(cmd_off));
+	// igt_info("submit result (original ctx): r=%d", r);
+	// if (r) {
+	// /* Try RCS fallback to verify if  the problem is BCS-specific */
+	// struct drm_xe_engine_class_instance inst = {
+	//	.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+	// };
+	// uint32_t rcs_q = xe_exec_queue_create(xe, ctx->vm, &inst, 0);
+	// if (rcs_q) {
+	//	intel_ctx_t *rcs_ctx = intel_ctx_xe(xe, ctx->vm, rcs_q, 0, 0, 0);
+	//	int r2 = __intel_ctx_xe_exec(rcs_ctx, local_ahnd, CANONICAL(cmd_off));
+	//	igt_info("submit result (rcs ctx): r=%d", r2);
+	//	if (!r2)
+	//		intel_ctx_xe_sync(rcs_ctx, true);
+	//	xe_exec_queue_destroy(xe, rcs_q);
+	//	free(rcs_ctx);
+	// } else {
+	//	igt_info("rcs exec queue create failed\n");
+	// }
+	// } else {
+	// intel_ctx_xe_sync(ctx, true);
+	// }
+
+	/* Submit the batch */
+	igt_info("Submitting faulting batch to write to VA 0x%llx\n",
+			(unsigned long long)vm_map_addr);
+	ret = __intel_ctx_xe_exec(ctx, local_ahnd, cmd_off);
+	igt_assert_f(ret == 0, "Batch submission failed: %d (%s)\n", ret, strerror(errno));
+
+	/* Sync to ensure completion */
+	intel_ctx_xe_sync(ctx, true);
+
+	/* Cleanup */
+	put_offset(local_ahnd, cmd_bo);
+	gem_close(xe, cmd_bo);
+	intel_allocator_close(local_ahnd);
+
+	igt_info("Faulting write batch completed successfully\n");
+}
+
 }
 
 struct blt_copy3_data {
-- 
2.43.0

