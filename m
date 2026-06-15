Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE17ECD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 12:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907B510E3D2;
	Mon, 15 Jun 2026 12:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BM3KxRQT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60EC10E3D2
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781526307; x=1813062307;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oa2r5oY6J62Sib1BKhEOG1eyHTLuPsX4sz1PCh9nMrs=;
 b=BM3KxRQTQIwcDGtLehq8rn28RIfoO6+ICykPiRjbEqh+iLn9RcueARQV
 ySFhWkrs+eV9InYmMKlaVJJv7YEFzM/Fnj5tF/81mRkueW84kaxGuJJ8D
 0Vrx4ySSx0dQpFG332TtJmKlpkED9zkC3zmkGqIJw51jLn1OPhLYw5K6P
 aqecLSAG7QIvKoREgQ6aX9cVWdC5KR8Vk6NB7u+rpi0uhZin4wkmh31Ub
 jNI75CQN0iRjHWdvdoalSWAOJnHfBCxEAzjYQH7wj6Wjg0cKlfHPHuX2f
 GuNmw6KKaWqr6eQ5uWeZDh3A8T6AjaNF61Uw/goj1canJ83Z7yRYYxD50 w==;
X-CSE-ConnectionGUID: Wm31V92sR5+a9YkyGGEDrQ==
X-CSE-MsgGUID: wRaMTxbEQLmZzZDpJrc9tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82248722"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82248722"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:25:06 -0700
X-CSE-ConnectionGUID: JjxAc7e2SR2FpuCku9FVlw==
X-CSE-MsgGUID: VYLa4Sb2S7SdjipRSoiT0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="243299235"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa010.fm.intel.com with ESMTP; 15 Jun 2026 05:25:05 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Subject: [PATCH v2 3/3] tests/intel/xe_ccs : Add CCS corruption neg test for
 VM_BIND decomp
Date: Mon, 15 Jun 2026 18:01:09 +0530
Message-ID: <20260615123109.2286386-4-smitha.balasubramanyam@intel.com>
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

Add a negative test covering VM_BIND decompression verification
with corrupted CCS metadata.

The test also exercises suspend and resume handling during the
corruption scenario.

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_ccs.c | 345 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 345 insertions(+)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 9a4fa36e1..bcf7655bd 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -75,6 +75,13 @@
  * SUBTEST: vm-bind-decompress-uapi-bad-params-fault-mode
  * Description: UAPI negative test attempt VM_BIND with a combination of
  *				invalid params - fault mode
+ *
+ * SUBTEST: vm-bind-decompress-ccs-corruption
+ * Description: Functional negative test — attempt VM_BIND after corrupting the CCS data;
+ *				verify that decompression fails (data differs from original).
+ *
+ * SUBTEST: vm-bind-decompress-ccs-corruption-suspend-resume
+ * Description: Validate VM_BIND with DECOMPRESS flag with corrupted CCS with suspend/resume (S0)
  */
 
 IGT_TEST_DESCRIPTION("Exercise gen12 blitter with and without flatccs compression on Xe");
@@ -113,6 +120,7 @@ struct test_config {
 	bool vm_bind_fault_mode_decompress;
 	bool vm_bind_decompress_uapi_bad_params;
 	bool vm_bind_decompress_uapi_bad_params_fault_mode;
+	bool vm_bind_decompress_ccs_corruption;
 	int width_increment;
 	int width_steps;
 	int overwrite_width;
@@ -1175,6 +1183,307 @@ static void vm_bind_decompress_uapi_bad_params_fault_mode(int xe,
 	vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
 }
 
+/* Functional negative test that validates VM_BIND Decompress with CCS corruption.
+ * It compresses src -> mid1/mid2, extracts CCS, corrupts mid1 CCS, writes back,
+ * reissues VM_BIND with DECOMPRESS for both and verifies mid1 != src and mid2 == src.
+ */
+static void vm_bind_decompress_ccs_corruption(int xe,
+					      intel_ctx_t *ctx,
+					      u64 ahnd,
+					      u32 region1,
+					      u32 region2,
+					      u32 width,
+					      u32 height,
+					      const struct test_config *config)
+{
+	struct drm_xe_gem_mmap_offset mmap_offset = {};
+	struct blt_copy_data blt = {};
+	struct blt_block_copy_data_ext ext = {};
+	struct blt_ctrl_surf_copy_data surf = {};
+	struct vm_bind_decomp_setup_resources allocated_resources = {};
+	struct blt_copy_object *src, *mid1, *mid2;
+	const u32 bpp = 32;
+	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
+	u64 bb_size = xe_bb_size(xe, SZ_4K);
+	u64 size = (u64)width * height * 4;
+	u32 comp_pat = intel_get_pat_idx_uc_comp(xe);
+	u32 ccs1, ccs2;
+	uint32_t *ccsmap1 = NULL, *ccsmap2 = NULL;
+	uint64_t ccssize = 0;
+	uint64_t ccs_bo_size = 0;
+	uint32_t *ccscopy = NULL;
+	int result;
+	void *mapped_mid1 = MAP_FAILED;
+	void *mapped_mid2 = MAP_FAILED;
+
+	/* Use vm_bind_decomp_test_setup to create a src (uncompressed) and a first
+	 * compressed object (mid1). The helper also creates a VM and BB
+	 * used for subsequent ctrl-surface operations.
+	 */
+	result = vm_bind_decomp_test_setup(xe, ctx, ahnd, region1, region2, width,
+					   height, T_LINEAR, config, true, false,
+					   &allocated_resources);
+	igt_assert_eq(result, 0);
+
+	/* Reuse helper-created objects */
+	src = allocated_resources.src_obj;
+	mid1 = allocated_resources.comp_obj;
+
+	print_buffer_data(src->ptr, min_t(size_t, 64, size), "ORIGINAL", 4);
+	print_buffer_data(mid1->ptr, min_t(size_t, 64, size),
+			  "SURFACE1_COMPRESSED", 4);
+
+	 /* Compute CCS sizes now that mid1 is valid */
+	ccssize = mid1->size / CCS_RATIO(xe);
+	ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(xe));
+	ccscopy = malloc(ccssize);
+
+	/* Create a second compressed object (mid2) and compress src->mid2 */
+	/* Init blit + batch */
+	blt_copy_init(xe, &blt);
+	mid2 = blt_create_object(&blt, region2, width, height,
+				 bpp, intel_get_uc_mocs_index(xe), T_LINEAR,
+				 COMPRESSION_ENABLED, comp_type, true);
+	igt_assert(mid2);
+
+	/* Use the BB provided by the helper */
+	blt_set_batch(&blt.bb, allocated_resources.bb, bb_size, allocated_resources.region_src);
+	blt.color_depth = CD_32bit;
+	blt.print_bb = param.print_bb;
+	blt_set_copy_object(&blt.src, src);
+	blt_set_copy_object(&blt.dst, mid2);
+	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
+	blt_set_object_ext(&ext.dst, param.compression_format, width, height, SURFACE_TYPE_2D);
+
+	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
+	intel_ctx_xe_sync(ctx, true);
+
+	/* Verify compression occurred when platform supports it */
+	if (blt_platform_has_flat_ccs_enabled(xe)) {
+		bool is_compressed = blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid2);
+
+		if (!is_compressed) {
+			vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+			igt_assert_f(false, "Surface compression failed - "
+					" cannot test decompression\n");
+		}
+	}
+
+	print_buffer_data(mid2->ptr, min_t(size_t, 64, size),
+			  "SURFACE2_COMPRESSED", 4);
+
+	ccs1 = xe_bo_create_caching(xe, 0, ccs_bo_size, system_memory(xe), 0,
+				    __xe_default_cpu_caching(xe,
+							     system_memory(xe), 0));
+	ccs2 = xe_bo_create_caching(xe, 0, ccs_bo_size, system_memory(xe), 0,
+				    __xe_default_cpu_caching(xe,
+							     system_memory(xe), 0));
+	blt_ctrl_surf_copy_init(xe, &surf);
+	surf.print_bb = param.print_bb;
+
+	/* mid1 -> ccs1 */
+	blt_set_ctrl_surf_object(&surf.src, mid1->handle, mid1->region,
+				 mid1->size, intel_get_uc_mocs_index(xe),
+				 comp_pat, BLT_INDIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, ccs1, system_memory(xe), ccssize,
+				 0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+	blt_set_batch(&surf.bb, allocated_resources.bb, bb_size, allocated_resources.region_src);
+
+	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
+	intel_ctx_xe_sync(ctx, true);
+
+	/* mid2 -> ccs2 */
+	blt_set_ctrl_surf_object(&surf.src, mid2->handle, mid2->region,
+				 mid2->size, intel_get_uc_mocs_index(xe),
+				 comp_pat, BLT_INDIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, ccs2, system_memory(xe), ccssize,
+				 0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+	blt_set_batch(&surf.bb, allocated_resources.bb, bb_size, allocated_resources.region_src);
+	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
+	intel_ctx_xe_sync(ctx, true);
+	igt_info("\nExtracted CCS for both compressed surfaces\n");
+	igt_info("Proceeds to corrupt surface1 CCS and preserve surface2 CCS\n");
+
+	/* --- Map, corrupt mid1's CCS, then write corrupted CCS back into mid1 --- */
+	/* Map ccs1 (the corrupted copy) */
+	ccsmap1 = xe_bo_map(xe, ccs1, ccssize);
+	// Verifying mapping
+	igt_assert(ccsmap1 != MAP_FAILED);
+
+	igt_assert(ccscopy);
+	memcpy(ccscopy, ccsmap1, ccssize);
+
+	/* Corrupt the CCS content (example corruption) */
+	for (size_t i = 0; i < ccssize / sizeof(uint32_t); i++)
+		ccsmap1[i] = (uint32_t)i ^ 0xdeadbeefu;
+
+	/* Ensure GPU sees the change by writing it back via ctrl-surf-copy:
+	 * ccs1 -> mid1 (DIRECT_ACCESS -> BLT_INDIRECT_ACCESS)
+	 */
+	munmap(ccsmap1, ccssize);        /* unmap before submitting */
+	blt_set_ctrl_surf_object(&surf.src, ccs1, system_memory(xe), ccssize,
+				 0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, mid1->handle, mid1->region,
+				 mid1->size, intel_get_uc_mocs_index(xe),
+				 comp_pat, BLT_INDIRECT_ACCESS);
+	blt_set_batch(&surf.bb, allocated_resources.bb, bb_size, allocated_resources.region_src);
+	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
+	intel_ctx_xe_sync(ctx, true);
+
+	/* --- Write clean/unaltered CCS back to mid2 (optional, restoration) --- */
+	ccsmap2 = xe_bo_map(xe, ccs2, ccssize);
+	igt_assert(ccsmap2 != MAP_FAILED);
+	munmap(ccsmap2, ccssize);
+	blt_set_ctrl_surf_object(&surf.src, ccs2, system_memory(xe), ccssize,
+				 0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
+	blt_set_ctrl_surf_object(&surf.dst, mid2->handle, mid2->region,
+				 mid2->size, intel_get_uc_mocs_index(xe),
+				 comp_pat, BLT_INDIRECT_ACCESS);
+	blt_set_batch(&surf.bb, allocated_resources.bb, bb_size, allocated_resources.region_src);
+	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
+	intel_ctx_xe_sync(ctx, true);
+	igt_info("Applied corrupted CCS to surface1 and restored clean CCS to surface2\n");
+
+	/* --- Suspend/Resume test (optional) --- */
+	if (config->suspend_resume) {
+		char *ccs1_before = NULL, *ccs2_before = NULL;
+		char *ccs1_after  = NULL, *ccs2_after  = NULL;
+		void *map;
+
+		igt_info("Test Case has invoked a suspend-resume\n");
+
+		/* Compute checksums of CCS BOs before suspend */
+		map = xe_bo_map(xe, ccs1, ccssize);
+		igt_assert(map != MAP_FAILED);
+		ccs1_before = g_compute_checksum_for_data(G_CHECKSUM_SHA1, map, ccssize);
+		munmap(map, ccssize);
+
+		map = xe_bo_map(xe, ccs2, ccssize);
+		igt_assert(map != MAP_FAILED);
+		ccs2_before = g_compute_checksum_for_data(G_CHECKSUM_SHA1, map, ccssize);
+		munmap(map, ccssize);
+
+		/* Ensure all GPU work is visible, then suspend/resume */
+		intel_ctx_xe_sync(ctx, true);
+		igt_info("Suspending system to test CCS persistence across S0 suspend/resume\n");
+		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
+		igt_info("System resume complete — continuing VM_BIND tests\n");
+
+		/* Re-read CCS BOs after resume and compute checksums */
+		map = xe_bo_map(xe, ccs1, ccssize);
+		igt_assert(map != MAP_FAILED);
+		ccs1_after = g_compute_checksum_for_data(G_CHECKSUM_SHA1, map, ccssize);
+		munmap(map, ccssize);
+
+		map = xe_bo_map(xe, ccs2, ccssize);
+		igt_assert(map != MAP_FAILED);
+		ccs2_after = g_compute_checksum_for_data(G_CHECKSUM_SHA1, map, ccssize);
+		munmap(map, ccssize);
+
+		/* Expectations:
+		 * - ccs1 (corrupted) should remain changed across suspend/resume
+		 * - ccs2 (clean) should remain unchanged across suspend/resume
+		 */
+		if (ccs1_before && ccs1_after && !strcmp(ccs1_before, ccs1_after))
+			igt_info("CCS1 (corrupted) persisted with same checksum (expected)\n");
+		else if (ccs1_before && ccs1_after)
+			igt_warn("CCS1 checksum changed across suspend/resume (unexpected)\n");
+
+		if (ccs2_before && ccs2_after && strcmp(ccs2_before, ccs2_after) == 0)
+			igt_info("CCS2 (clean) persisted with identical checksum (expected)\n");
+		else
+			igt_warn("CCS2 checksum changed across suspend/resume (unexpected)\n");
+
+		g_free(ccs1_before);
+		g_free(ccs1_after);
+		g_free(ccs2_before);
+		g_free(ccs2_after);
+	}
+
+	/* Cleanup */
+	free(ccscopy);
+	/* ccsmap1 was unmapped before writeback; avoid double unmap here */
+	gem_close(xe, ccs1);
+	gem_close(xe, ccs2);
+	put_offset(ahnd, ccs1);
+	put_offset(ahnd, ccs2);
+	igt_debug("Cleaned up CCS BOs\n");
+
+	/* Bind both mid1 and mid2 initially compressed */
+	result = __xe_vm_bind(xe, allocated_resources.vm, 0, mid1->handle, 0,
+			      allocated_resources.vm_map_addr,
+			      allocated_resources.map_size,
+			      DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+			      comp_pat, 0);
+	igt_assert_eq(result, 0);
+	result = __xe_vm_bind(xe, allocated_resources.vm, 0, mid2->handle, 0,
+			      allocated_resources.vm_map_addr +
+			      allocated_resources.map_size,
+			      allocated_resources.map_size,
+			      DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+			      comp_pat, 0);
+	igt_assert_eq(result, 0);
+	/* Update mappings to request DECOMPRESS (UC PAT) */
+	result = __xe_vm_bind(xe, allocated_resources.vm, 0, mid1->handle, 0,
+			      allocated_resources.vm_map_addr,
+			      allocated_resources.map_size,
+			      DRM_XE_VM_BIND_OP_MAP,
+			      DRM_XE_VM_BIND_FLAG_DECOMPRESS, NULL, 0, 0,
+			      allocated_resources.uncompressed_pat, 0);
+	igt_assert_eq(result, 0);
+	result = __xe_vm_bind(xe, allocated_resources.vm, 0, mid2->handle, 0,
+			      allocated_resources.vm_map_addr +
+			      allocated_resources.map_size,
+			      allocated_resources.map_size,
+			      DRM_XE_VM_BIND_OP_MAP,
+			      DRM_XE_VM_BIND_FLAG_DECOMPRESS, NULL, 0, 0,
+			      allocated_resources.uncompressed_pat, 0);
+	igt_assert_eq(result, 0);
+
+	/* Map both for CPU access and compare */
+	mmap_offset.handle = mid1->handle;
+	mmap_offset.flags = 0;
+	result = igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmap_offset);
+
+	igt_assert_eq(result, 0);
+	mapped_mid1 = mmap(NULL, size, PROT_READ, MAP_SHARED, xe, mmap_offset.offset);
+	igt_assert(mapped_mid1 != MAP_FAILED);
+
+	mmap_offset.handle = mid2->handle;
+	mmap_offset.flags = 0;
+	result = igt_ioctl(xe, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmap_offset);
+	igt_assert_eq(result, 0);
+	mapped_mid2 = mmap(NULL, size, PROT_READ, MAP_SHARED, xe, mmap_offset.offset);
+	igt_assert(mapped_mid2 != MAP_FAILED);
+	igt_info("Issued VM_BIND with DECOMPRESS for both surfaces and now verifying each surface against the original data\n");
+	if (memcmp(mapped_mid1, src->ptr, size) == 0)
+		igt_assert_f(false, "mid1 decompressed matches src "
+				"(expected mismatch due to CCS corruption)");
+	igt_info("VM_BIND decompression did not recover original data for corrupted surface (mid1), as expected\n");
+
+	print_buffer_data(mapped_mid1, min_t(size_t, 64, size),
+			  "MID1_CORRUPTED", 4);
+	print_buffer_data(src->ptr, min_t(size_t, 64, size), "SRC", 4);
+
+	if (memcmp(mapped_mid2, src->ptr, size) != 0)
+		igt_assert_f(false, "Decompressed MID2 does not match src "
+				"(expected match for clean CCS)");
+	igt_info("VM_BIND decompression successful for clean surface (mid2)\n");
+
+	print_buffer_data(mapped_mid2, min_t(size_t, 64, size),
+			  "MID2_DECOMPRESSED", 4);
+	print_buffer_data(src->ptr, min_t(size_t, 64, size), "SRC", 4);
+
+	igt_info("CCS corruption decompression test completed successfully\n");
+	munmap(mapped_mid1, size);
+	munmap(mapped_mid2, size);
+
+	put_offset(ahnd, mid2->handle);
+	blt_destroy_object(xe, mid2);
+
+	vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+}
+
 struct blt_copy3_data {
 	int xe;
 	struct blt_copy_object src;
@@ -2089,6 +2398,12 @@ static void single_copy(int xe, const struct test_config *config,
 							      ctx, ahnd, region1, region2,
 							      width, height, tiling, config);
 		put_ahnd(ahnd);
+	} else if (config->vm_bind_decompress_ccs_corruption) {
+		ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
+		vm_bind_decompress_ccs_corruption(xe, ctx, ahnd,
+						  region1, region2, width,
+						  height, config);
+		put_ahnd(ahnd);
 	} else {
 		copyfns[copy_function].copyfn(xe, ctx,
 					      region1, region2,
@@ -2419,6 +2734,36 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
 	}
 
+	igt_describe("Validate VM_BIND with DECOMPRESS flag with corrupted CCS");
+	igt_subtest("vm-bind-decompress-ccs-corruption") {
+		struct test_config config = { .compression = true,
+			.vm_bind_decompress_ccs_corruption = true,
+			.suspend_resume = false };
+		u32 region1 = system_memory(xe);
+		u32 region2 = vram_if_possible(xe, 0);
+		int tiling = T_LINEAR;
+		int width = param.width;
+		int height = param.height;
+
+		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
+	}
+
+	igt_describe("Validate VM_BIND with DECOMPRESS flag "
+		     "with corrupted CCS with suspend/resume");
+	igt_subtest("vm-bind-decompress-ccs-corruption-suspend-resume") {
+		struct test_config config = { .compression = true,
+			.vm_bind_decompress_ccs_corruption = true,
+			.suspend_resume = true };
+		u32 region1 = system_memory(xe);
+		u32 region2 = vram_if_possible(xe, 0);
+		int tiling = T_LINEAR;
+		int width = param.width;
+		int height = param.height;
+
+		single_copy(xe, &config, region1, region2, width, height, tiling,
+			    BLOCK_COPY);
+	}
+
 	igt_fixture() {
 		xe_device_put(xe);
 		close(xe);
-- 
2.43.0

