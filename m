Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C83CD98DE
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 12:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641C710E3D2;
	Mon, 15 Jun 2026 12:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EC35OnzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B857610E3D2
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781526304; x=1813062304;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aRJMvU6Zjf5DXELD/mDJM93QGO8J/F91QfQ9YZF5EDo=;
 b=EC35OnzO98l88xFum2VAARGhA4KQC9ntbkX0+GTGICBLDYAtvGBVX9jR
 q1VDJ3NlexNMDnd8CH4i1r5CETdr1q2PbFUH+2+7R3emmDuQASOjCGkk+
 PcOgOGilZ3Q47I61JB8pGG5XRVdu5WffPnkeXfk8oiwLWe5yrfTxW+gN0
 bzNDrXLGyIkHkfg3TNJ5MgwsaqB/rQggudcNhR4F8JLAf7ILvHyBxS6wr
 js2wWHIUpzmeMX3MoAAHRb4P4CXpbNDinNNYy2xSn25/iEyqrfx3pq2s0
 7hfzZGgO5oMW2pivhCk5HX2flXDkVFWP8dZbf6JlvUEaCdQbX3edyvD6r w==;
X-CSE-ConnectionGUID: WM/b5fvNQGC8s0XOKdo+9Q==
X-CSE-MsgGUID: TNbO6cvoSPyACMbqxGX1LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82248713"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82248713"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:25:03 -0700
X-CSE-ConnectionGUID: jS1s/4c1RrSgUS4OdbXYGg==
X-CSE-MsgGUID: 8s35dvV1SEuX0QMF+BNwRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="243299210"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa010.fm.intel.com with ESMTP; 15 Jun 2026 05:25:02 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Subject: [PATCH v2 1/3] tests/intel/xe_ccs : Add helpers and Negative test for
 VM_Bind Decomp
Date: Mon, 15 Jun 2026 18:01:07 +0530
Message-ID: <20260615123109.2286386-2-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615123109.2286386-1-smitha.balasubramanyam@intel.com>
References: <20260527054210.2147520-1-smitha.balasubramanyam@intel.com>
 <20260615123109.2286386-1-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Introduce data structures and helper utilities used by the VM
negative tests to validate the VM_Bind Decomp feature

These helpers provide resource management and setup/cleanup
logic that simplifies the implementation of the test cases
introduced in subsequent patches.

One functional subtest is introduced in this patch.
This test verifies handling of invalid UAPI Params in Non-fault Mode.

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_ccs.c | 479 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 479 insertions(+)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 4c5fe0311..e1dc80659 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -68,10 +68,17 @@
  *
  * SUBTEST: vm-bind-fault-mode-decompress
  * Description: Validate VM_BIND with DECOMPRESS flag functionality in fault mode
+ *
+ * SUBTEST: vm-bind-decompress-uapi-bad-params
+ * Description: UAPI negative test — attempt VM_BIND with a combination of invalid params
  */
 
 IGT_TEST_DESCRIPTION("Exercise gen12 blitter with and without flatccs compression on Xe");
 
+#ifndef INVALID_PAT_INDEX
+#define INVALID_PAT_INDEX 10U
+#endif
+
 static struct param {
 	int compression_format;
 	int tiling;
@@ -100,6 +107,7 @@ struct test_config {
 	bool suspend_resume;
 	bool vm_bind_decompress;
 	bool vm_bind_fault_mode_decompress;
+	bool vm_bind_decompress_uapi_bad_params;
 	int width_increment;
 	int width_steps;
 	int overwrite_width;
@@ -371,6 +379,460 @@ static void surf_copy(int xe,
 		     "restoring source ccs data\n");
 }
 
+/* VM_BIND DECOMPRESS negative-test case definitions and shared setup state */
+struct vm_bind_decomp_neg_test_case {
+	const char *test_name;
+	uint32_t pat;      /* PAT index passed to __xe_vm_bind() */
+	uint32_t flags;    /* DRM_XE_VM_BIND_FLAG_* */
+	bool expect_fail;  /* true => we expect kernel to reject (result != 0) */
+};
+
+struct vm_bind_decomp_setup_resources {
+	int xe;
+	u32 vm;
+	u64 vm_map_addr;
+	u64 map_size;
+	u32 handle;       /* compressed destination BO handle */
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
+					struct vm_bind_decomp_setup_resources *state)
+{
+	/* Return if there is nothing to clean up. */
+	if (!state)
+		return;
+
+	/* If a VM mapping remains, try to unmap it. */
+	if (state->vm && state->vm_map_addr && state->map_size) {
+		int ret = __xe_vm_bind(xe, state->vm, 0, 0, 0,
+				state->vm_map_addr, state->map_size,
+				DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
+		igt_info("Unmapping VM mapping at addr 0x%llx, size %llu, ret=%d\n",
+			 (unsigned long long)state->vm_map_addr,
+			 (unsigned long long)state->map_size,
+			 ret);
+	}
+
+	/* Remove allocator offsets if set */
+	if (ahnd) {
+		if (state->src_obj && state->src_obj->handle) {
+			igt_debug("Removing allocator offset for src_obj handle %u\n",
+				  state->src_obj->handle);
+			put_offset(ahnd, state->src_obj->handle);
+		}
+		if (state->comp_obj && state->comp_obj->handle)
+			put_offset(ahnd, state->comp_obj->handle);
+		igt_debug("Removed allocator offsets for src_obj and comp_obj if they existed\n");
+		if (state->bb)
+			put_offset(ahnd, state->bb);
+		igt_debug("Removed allocator offset for bb handle %u\n", state->bb);
+		intel_allocator_bind(ahnd, 0, 0);
+		igt_debug("SUCCESS : Cleared allocator bindings\n");
+	}
+
+	/* Destroy blit objects */
+	if (state->src_obj)
+		blt_destroy_object(xe, state->src_obj);
+	if (state->comp_obj)
+		blt_destroy_object(xe, state->comp_obj);
+	igt_debug("SUCCESS : Destroyed blit objects if they existed\n");
+
+	/* Close bb handle(s) */
+
+	if (state->bb) {
+		gem_close(xe, state->bb);
+		igt_debug("SUCCESS : Close bb handle\n");
+	}
+
+	/* Destroy VM */
+	if (state->vm)
+		xe_vm_destroy(xe, state->vm);
+	igt_debug("SUCCESS : Destroyed VM if it existed\n");
+
+	/* Clear fields to make it safe to call again */
+	memset(state, 0, sizeof(*state));
+	igt_debug("SUCCESS : Cleared state structure\n");
+
+	igt_debug("SUCCESS : Cleanup completed\n");
+}
+
+/* Setup function: prepares state->src_obj, state->comp_obj, VM and initial map.
+ * On any failure it calls vm_bind_decomp_test_setup() then igt_assert_f() to abort safely.
+ */
+static int vm_bind_decomp_test_setup(int xe, intel_ctx_t *ctx, uint64_t ahnd,
+				     u32 region_src, u32 region_comp, u32 width, u32 height,
+				     enum blt_tiling_type tiling,
+				     const struct test_config *config,
+				     bool is_gradient,
+				     bool use_fault_mode_vm,
+				     struct vm_bind_decomp_setup_resources *state)
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
+	igt_assert(state);
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
+	igt_require(xe_has_vram(xe));
+	igt_require(config->compression);
+	igt_require(blt_uses_extended_block_copy(xe));
+	igt_require(blt_platform_has_flat_ccs_enabled(xe));
+
+	/* Create VM (FAULT_MODE requires LR_MODE) when requested by caller. */
+	if (use_fault_mode_vm)
+		state->vm = xe_vm_create(xe,
+					 DRM_XE_VM_CREATE_FLAG_LR_MODE |
+					 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
+					 0);
+	else
+		state->vm = xe_vm_create(xe, 0, 0);
+	if (state->vm <= 0) {
+		vm_bind_decomp_test_cleanup(xe, ahnd, state);
+		igt_assert_f(false, "xe_vm_create() failed: %d\n", state->vm);
+	}
+
+	/* Create BB */
+	state->bb = xe_bo_create(xe, 0, bb_size, region_src,
+				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
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
+					   uc_mocs, T_LINEAR, COMPRESSION_DISABLED,
+					   comp_type, true);
+	if (!state->src_obj || !state->src_obj->ptr) {
+		vm_bind_decomp_test_cleanup(xe, ahnd, state);
+		igt_assert_f(false, "failed to create or map src object\n");
+	}
+
+	/* Fill deterministic compressible data */
+	if (is_gradient) {
+		blt_surface_fill_rect(xe, state->src_obj, width, height);
+	} else {
+		fill_buffer_simple_pattern(state->src_obj->ptr, state->src_obj->size);
+		igt_assert_f(verify_test_pattern(state->src_obj->ptr,
+						 state->src_obj->size, "SOURCE"),
+						"Source pattern verification failed");
+	}
+	/* Create compressed destination object */
+	state->comp_obj = blt_create_object(&blt, region_comp, width, height, bpp,
+					    uc_mocs, tiling, COMPRESSION_ENABLED,
+					    comp_type, true);
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
+			igt_assert_f(false,
+				     "Surface compression failed, cannot test decompression\n");
+		}
+	}
+
+	/* store handles and PATs */
+	state->handle = state->comp_obj->handle;
+	state->uncompressed_pat = intel_get_pat_idx_uc(xe);
+	state->comp_pat = intel_get_pat_idx_uc_comp(xe);
+
+	/* perform initial map using compressed pat */
+	result = __xe_vm_bind(xe, state->vm, 0, state->handle, 0,
+			      state->vm_map_addr, state->map_size,
+			      DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+			      state->comp_pat, 0);
+	if (result != 0) {
+		vm_bind_decomp_test_cleanup(xe, ahnd, state);
+		igt_assert_f(false, "initial __xe_vm_bind MAP failed: %d (%s)\n",
+			     result, strerror(errno));
+	}
+	/* success */
+	return 0;
+}
+
+static void vm_bind_decompress_uapi_bad_params(int xe,
+					       intel_ctx_t *ctx,
+					       u64 ahnd,
+					       u32 region1,
+					       u32 region2,
+					       u32 width,
+					       u32 height,
+					       enum blt_tiling_type tiling,
+					       const struct test_config *config)
+{
+	struct vm_bind_decomp_setup_resources allocated_resources = {};
+	int ret = 0;
+	void *mapped_data = MAP_FAILED;
+	u32 *mapped_ptr = NULL;
+	bool decompression_successful = false;
+	uint64_t addr;
+	u32 handle;
+	u64 use_map_size;
+	const uint64_t default_alignment = xe_get_default_alignment(xe);
+
+	/* Build negative cases (runtime PAT lookups) */
+	struct vm_bind_decomp_neg_test_case bad_cases[8] = {
+		/* PAT-based accepts (DECOMPRESS + Default PAT) */
+		/* In the __xe_vmbind() wrapper,
+		 * the DEFAULT_PAT_INDEX is updated to the appropriate GPU PAT index
+		 * for the default caching type, so this case should succeed with a valid PAT
+		 * even though we are passing the generic DEFAULT_PAT_INDEX value
+		 */
+		{ "decompress-default-pat", DEFAULT_PAT_INDEX,
+		  DRM_XE_VM_BIND_FLAG_DECOMPRESS, false },
+
+		/* PAT-based accepts (DECOMPRESS + GPU WB PAT) */
+		{ "decompress-gpu-wb-pat", 0,
+		  DRM_XE_VM_BIND_FLAG_DECOMPRESS, false },
+
+		/* PAT-based rejects (DECOMPRESS + Invalid PAT) */
+		{ "decompress-invalid-pat", INVALID_PAT_INDEX,
+		  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+		/* PAT-based rejects (DECOMPRESS + non-UC PAT) */
+		{ "decompress-gpu-wt-pat", 0,
+			DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+		/* PAT-based rejects (DECOMPRESS + compressed PAT) */
+		{ "decompress-gpu-compressed-pat", 0,
+		  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+		/* Range smaller than the uncompressed size (should be rejected for DECOMPRESS) */
+		{ "decompress-small-range", 0,
+		  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+		/* Misaligned virtual address for DECOMPRESS update */
+		{ "decompress-misaligned-va", 0,
+		  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+		/* Wrong BO handle supplied (invalid handle) */
+		{ "decompress-wrong-bo-handle", 0,
+		  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+	};
+
+	/* Setup (this asserts+cleans on failure) */
+	ret = vm_bind_decomp_test_setup(xe, ctx, ahnd, region1, region2,
+					width, height, tiling, config, false, false,
+					&allocated_resources);
+	igt_assert_eq(ret, 0);
+
+	/* assign runtime values after setup */
+	addr = allocated_resources.vm_map_addr;
+	handle = allocated_resources.handle;
+	use_map_size = allocated_resources.map_size;
+
+	print_buffer_data(allocated_resources.src_obj->ptr,
+			  min_t(size_t, 64, allocated_resources.size),
+			  "ORIGINAL", 4);
+	print_buffer_data(allocated_resources.comp_obj->ptr,
+			  min_t(size_t, 64, allocated_resources.size),
+			  "COMPRESSED", 4);
+
+	/* Fill platform-specific PAT lookups and runtime-dependent PATs */
+	bad_cases[1].pat = intel_get_pat_idx_wb(xe);
+	bad_cases[3].pat = intel_get_pat_idx_wt(xe);
+	bad_cases[4].pat = intel_get_pat_idx_uc_comp(xe);
+	bad_cases[5].pat = allocated_resources.uncompressed_pat;
+	bad_cases[6].pat = allocated_resources.uncompressed_pat;
+	bad_cases[7].pat = allocated_resources.uncompressed_pat;
+
+	/* Iterate the cases */
+	for (unsigned int i = 0; i < ARRAY_SIZE(bad_cases); i++) {
+		const struct vm_bind_decomp_neg_test_case *test_variant = &bad_cases[i];
+
+		u32 use_pat = test_variant->pat;
+		u32 flags = test_variant->flags;
+
+		/* Reset to known good values before each iteration */
+		addr = allocated_resources.vm_map_addr;
+		handle = allocated_resources.handle;
+		use_map_size = allocated_resources.map_size;
+
+		igt_info("\nVM_BIND variant: %s\n", test_variant->test_name);
+
+		/* Specialize the case parameters */
+		if (!strcmp(test_variant->test_name, "decompress-small-range")) {
+			use_map_size = allocated_resources.map_size - 1;
+			igt_debug("allocated_resources.size=%llu, default_alignment=%llu\n",
+				  (unsigned long long)allocated_resources.size,
+				  (unsigned long long)default_alignment);
+		} else if (!strcmp(test_variant->test_name, "decompress-misaligned-va")) {
+			addr = allocated_resources.vm_map_addr + 1; /* deliberately misaligned */
+
+		} else if (!strcmp(test_variant->test_name, "decompress-wrong-bo-handle")) {
+			/* flip some bits to make handle unlikely to be valid */
+			handle = allocated_resources.handle ^ 0xdeadbeef;
+		}
+	igt_debug("Issuing VM_BIND :addr=0x%llx map_size=%llu handle=%u pat=%u "
+			  "flags=0x%x for %s\n",
+			  (unsigned long long)addr,
+			  (unsigned long long)use_map_size,
+			  handle, use_pat, flags, test_variant->test_name);
+	errno = 0;
+	ret = __xe_vm_bind(xe, allocated_resources.vm,
+			   0, /* engine */
+			   handle, /* handle (may be invalid) */
+			   0, /* offset in BO */
+			   addr, /* VA */
+			   use_map_size,
+			   DRM_XE_VM_BIND_OP_MAP, /* update mapping */
+			   flags,
+			   NULL, 0, 0,
+			   use_pat,
+			   0);
+	/* Evaluate outcome against expectation */
+	if (test_variant->expect_fail) {
+		if (ret == 0) {
+			/* Unexpected success — try to unmap and then fail the test (cleanup) */
+			igt_warn("VM_BIND unexpectedly SUCCEEDED for %s "
+				 "- attempting cleanup\n",
+				 test_variant->test_name);
+
+			/* Attempt to unmap the mapping we may have created */
+			__xe_vm_bind(xe, allocated_resources.vm, 0, 0, 0, addr,
+				     use_map_size, DRM_XE_VM_BIND_OP_UNMAP,
+				     0, NULL, 0, 0, 0, 0);
+
+			/* Perform cleanup before asserting */
+			vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+			igt_assert_f(false,
+				     "VM_BIND expected failure but succeeded for %s",
+				     test_variant->test_name);
+		} else {
+			igt_info("VM_BIND rejected as expected for %s (errno=%d %s)\n",
+				 test_variant->test_name, errno, strerror(errno));
+		}
+	} else {
+		/* Expected path: VM_BIND must succeed, then data integrity is verified. */
+		if (ret != 0) {
+			igt_warn("VM_BIND unexpectedly FAILED for %s: %d (%s)\n",
+				 test_variant->test_name, ret, strerror(errno));
+			vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+			igt_assert_f(false, "VM_BIND unexpected failure for %s",
+				     test_variant->test_name);
+		} else {
+			igt_info("VM_BIND succeeded for %s (as expected)\n",
+				 test_variant->test_name);
+			if (!strcmp(test_variant->test_name, "decompress-default-pat") ||
+			    !strcmp(test_variant->test_name, "decompress-gpu-wb-pat")) {
+				/* Map the BO for CPU access using helper */
+				mapped_data = xe_bo_map(xe, allocated_resources.handle,
+							allocated_resources.size);
+				if (mapped_data == MAP_FAILED) {
+					igt_warn("Mapping handle %u failed for verification\n",
+						 allocated_resources.handle);
+					vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+					igt_assert_f(false, "Failed to map BO for verification");
+				}
+				mapped_ptr = (uint32_t *)mapped_data;
+				print_buffer_data(allocated_resources.src_obj->ptr,
+						  min_t(size_t, 64,
+							allocated_resources.size),
+						  "ORIGINAL", 4);
+				print_buffer_data(mapped_ptr,
+						  min_t(size_t, 64,
+							allocated_resources.size),
+						  "DECOMPRESSED", 4);
+
+				decompression_successful =
+					verify_test_pattern(mapped_ptr,
+							    allocated_resources.size,
+							    "DECOMPRESSED");
+				if (!decompression_successful)
+					igt_info("Decompression pattern verification "
+							"FAILED for %s\n",
+							test_variant->test_name);
+
+				if (memcmp(mapped_ptr,
+					   allocated_resources.src_obj->ptr,
+					   allocated_resources.size) != 0) {
+					igt_info("Decompressed data does not match "
+						  "original for %s\n",
+						  test_variant->test_name);
+					print_buffer_data(mapped_ptr,
+							  min_t(size_t, 256,
+								allocated_resources.size),
+							  "CURRENT_STATE", 4);
+					print_buffer_data(allocated_resources.src_obj->ptr,
+							  min_t(size_t, 256,
+								allocated_resources.size),
+							  "EXPECTED", 4);
+
+					/* tidy mapping and do full cleanup before failing */
+					munmap(mapped_data, allocated_resources.size);
+					vm_bind_decomp_test_cleanup(xe, ahnd,
+								    &allocated_resources);
+					igt_assert_f(false,
+						     "Decompressed BO contents differ "
+						     "from original for %s",
+						     test_variant->test_name);
+				}
+
+				igt_info("Decompression content matches original for %s\n",
+					 test_variant->test_name);
+				/* tidy up mapping */
+				munmap(mapped_data, allocated_resources.size);
+				mapped_data = MAP_FAILED;
+				mapped_ptr = NULL;
+			}
+		}
+		}
+	}
+
+	/* final clean */
+	vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+}
+
 struct blt_copy3_data {
 	int xe;
 	struct blt_copy_object src;
@@ -1274,6 +1736,11 @@ static void single_copy(int xe, const struct test_config *config,
 					region1, region2, width,
 					height, tiling, config);
 		put_ahnd(ahnd);
+	} else if (config->vm_bind_decompress_uapi_bad_params) {
+		ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
+		vm_bind_decompress_uapi_bad_params(xe, ctx, ahnd, region1, region2,
+						   width, height, tiling, config);
+		put_ahnd(ahnd);
 	} else {
 		copyfns[copy_function].copyfn(xe, ctx,
 					      region1, region2,
@@ -1569,7 +2036,19 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_subtest("vm-bind-fault-mode-decompress") {
 		struct test_config config = { .compression = true,
 					      .vm_bind_fault_mode_decompress = true };
+		u32 region1 = system_memory(xe);
+		u32 region2 = vram_if_possible(xe, 0);
+		int tiling = T_LINEAR;
+		int width = param.width;
+		int height = param.height;
+
+		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
+	}
 
+	igt_describe("Validate uAPI of VM_BIND with DECOMPRESS flag with bad params");
+	igt_subtest("vm-bind-decompress-uapi-bad-params") {
+		struct test_config config = { .compression = true,
+			.vm_bind_decompress_uapi_bad_params = true };
 		u32 region1 = system_memory(xe);
 		u32 region2 = vram_if_possible(xe, 0);
 		int tiling = T_LINEAR;
-- 
2.43.0

