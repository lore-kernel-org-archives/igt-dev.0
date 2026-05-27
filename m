Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B88CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 05:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C7110E236;
	Wed, 27 May 2026 05:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tc+SGVda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB86210E74F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 05:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779860233; x=1811396233;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BFgoDNzszBOHppoFyI6RbWswP9uzu/ibVDj5RWkbj7g=;
 b=Tc+SGVda46U9JKEhghtGrLiGa5+fTwV0w41kwgpOzV/5oAHKc900REac
 TSDCPzYktaf0AKB2OHXiQ7sFAWgWMshrx3vLTPmw0FOehRPqWfnGKTRuw
 rk2rdEAQxqquObQha98CZsPyKVKYPI71ojJoFZ5zMlRQHqPHWHGyGtCmT
 FyAKIMTNKVhQREVyC8ZXoI2l/s3uVa2AI37sgr7sPiv/NxNTsmyt+Yspa
 L4zsMsYNyHCVxRSjeLjtewzZYoNlD+pt9SpXlWwRghPmTc4nqHOy7qWYL
 BQE1giRskAAAbOcyqHAzhtIx1u28g9kpoWHH0scbxzBZ9FmHYBZE8I0MJ w==;
X-CSE-ConnectionGUID: Fni/YtGQSyGjm5R+DYhgug==
X-CSE-MsgGUID: AQiKP0QWTBuE13gvaDikEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80652238"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80652238"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:37:13 -0700
X-CSE-ConnectionGUID: OaQj3tRYR++fvc4CwW1uDw==
X-CSE-MsgGUID: eRW18Ay5STWQ1dbLqRVRuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="246154360"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa003.jf.intel.com with ESMTP; 26 May 2026 22:37:11 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/3] tests/intel/xe_ccs: Add fault-mode helper and VM_BIND
 decomp neg test
Date: Wed, 27 May 2026 11:12:09 +0530
Message-ID: <20260527054210.2147520-3-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527054210.2147520-1-smitha.balasubramanyam@intel.com>
References: <20260527054210.2147520-1-smitha.balasubramanyam@intel.com>
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

Add a helper to trigger page-fault writes along with a negative
testcase covering invalid UAPI handling in fault mode.

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_ccs.c | 361 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 361 insertions(+)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index c3949fcd1..3bfb439b9 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -71,6 +71,10 @@
  *
  * SUBTEST: vm-bind-decompress-uapi-bad-params
  * Description: UAPI negative test — attempt VM_BIND with a combination of invalid params
+ *
+ * SUBTEST: vm-bind-decompress-uapi-bad-params-fault-mode
+ * Description: UAPI negative test attempt VM_BIND with a combination of
+ *				invalid params - fault mode
  */
 
 IGT_TEST_DESCRIPTION("Exercise gen12 blitter with and without flatccs compression on Xe");
@@ -108,6 +112,7 @@ struct test_config {
 	bool vm_bind_decompress;
 	bool vm_bind_fault_mode_decompress;
 	bool vm_bind_decompress_uapi_bad_params;
+	bool vm_bind_decompress_uapi_bad_params_fault_mode;
 	int width_increment;
 	int width_steps;
 	int overwrite_width;
@@ -832,6 +837,343 @@ static void vm_bind_decompress_uapi_bad_params(int xe,
 	vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
 }
 
+/* Helper: submit a tiny GPU batch that writes an immediate dword to the
+ * provided VA. This forces the kernel to fault in / decompress pages
+ * for that VA. Uses the provided `ctx` and `ahnd` (caller should have
+ * created/validated these).
+ */
+static void trigger_page_fault_write(int xe, intel_ctx_t *ctx,
+				     uint64_t vm_map_addr,
+				     uint64_t map_size,
+				     uint32_t region)
+{
+	struct drm_xe_exec exec = {};
+	struct drm_xe_sync exec_sync = {};
+	const u64 vm_alignment = xe_get_default_alignment(xe);
+	const size_t ufence_bo_size = SZ_4K;
+	u64 cmd_vm_addr = 0;
+	u64 ufence_vm_addr = 0;
+	u64 *ufence_map = MAP_FAILED;
+	u32 cmd_bo = 0;
+	u32 ufence_bo = 0;
+	u32 *cmdp = MAP_FAILED;
+	int ret;
+
+	/* Create command and fence BOs, then map them directly into the target VM. */
+	cmd_bo = xe_bo_create(xe, 0, SZ_4K, region, 0);
+	igt_assert_f(cmd_bo, "failed to create cmd_bo\n");
+	ufence_bo = xe_bo_create_caching(xe, 0, ufence_bo_size,
+					 system_memory(xe), 0,
+					 DRM_XE_GEM_CPU_CACHING_WC);
+	igt_assert_f(ufence_bo, "failed to create ufence_bo\n");
+
+	/* Map the BO to write the batch */
+	cmdp = xe_bo_map(xe, cmd_bo, SZ_4K);
+	igt_assert_f(cmdp != MAP_FAILED, "xe_bo_map cmd_bo failed\n");
+	ufence_map = xe_bo_map(xe, ufence_bo, ufence_bo_size);
+	igt_assert_f(ufence_map != MAP_FAILED, "xe_bo_map ufence_bo failed\n");
+	memset(ufence_map, 0, ufence_bo_size);
+
+	cmd_vm_addr = ALIGN(vm_map_addr + map_size, vm_alignment);
+	ufence_vm_addr = ALIGN(cmd_vm_addr + SZ_4K, vm_alignment);
+
+	ret = __xe_vm_bind(xe, ctx->vm, 0, cmd_bo, 0, cmd_vm_addr, SZ_4K,
+			   DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+			   DEFAULT_PAT_INDEX, 0);
+	igt_assert_eq(ret, 0);
+	ret = __xe_vm_bind(xe, ctx->vm, 0, ufence_bo, 0, ufence_vm_addr, ufence_bo_size,
+			   DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+			   DEFAULT_PAT_INDEX, 0);
+	igt_assert_eq(ret, 0);
+
+	/* Build a tiny batch: MI_STORE_DWORD_IMM_GEN4 dst=vm_map_addr, value=0xDEADBEEF */
+	cmdp[0] = MI_STORE_DWORD_IMM_GEN4;
+	cmdp[1] = lower_32_bits(vm_map_addr);
+	cmdp[2] = upper_32_bits(vm_map_addr);
+	cmdp[3] = 0xDEADBEEF;
+	cmdp[4] = MI_BATCH_BUFFER_END;
+
+	/* Debug dump of the first few dwords in the fault-trigger batch. */
+	igt_debug("BB dump: cmd_bo=%u cmd_off=0x%llx region=%u vm=%u execq=%u",
+		  cmd_bo, (unsigned long long)cmd_vm_addr, region,
+		  ctx->vm, ctx->exec_queue);
+	for (int i = 0; i < 8; i++)
+		igt_debug(" bb[%02d]=0x%08x", i, cmdp[i]);
+	igt_debug("\n");
+
+	/* Dump the first few dwords of the BB (do this BEFORE munmap) */
+	igt_info("BB dump: cmd_bo=%u cmd_off=0x%llx region=%u vm=%u execq=%u",
+		 cmd_bo, (unsigned long long)cmd_vm_addr, region,
+		 ctx->vm, ctx->exec_queue);
+	for (int i = 0; i < 8; i++)
+		igt_info(" bb[%02d]=0x%08x", i, cmdp[i]);
+
+	/* Make CPU writes visible to GPU */
+	munmap(cmdp, SZ_4K);
+	cmdp = MAP_FAILED;
+
+	/* Submit the batch directly. */
+	memset(&exec, 0, sizeof(exec));
+	exec.exec_queue_id = ctx->exec_queue;
+	exec.address = cmd_vm_addr;
+	exec.num_batch_buffer = 1;
+
+	memset(&exec_sync, 0, sizeof(exec_sync));
+	exec_sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	exec_sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	exec_sync.addr = ufence_vm_addr;
+	exec_sync.timeline_value = 1ULL;
+	exec.num_syncs = 1;
+	exec.syncs = to_user_pointer(&exec_sync);
+
+	igt_info("Submitting faulting batch to write to VA 0x%llx\n",
+		 (unsigned long long)vm_map_addr);
+	igt_debug("Submitting faulting batch to write to VA 0x%llx\n",
+		  (unsigned long long)vm_map_addr);
+	ret = igt_ioctl(xe, DRM_IOCTL_XE_EXEC, &exec);
+	igt_assert_f(ret == 0, "EXEC ioctl failed: %d (%s)\n", ret, strerror(errno));
+
+	xe_wait_ufence(xe, ufence_map, 1ULL, ctx->exec_queue, NSEC_PER_SEC);
+	igt_assert_eq_u64(ufence_map[0], 1ULL);
+
+	/* Cleanup */
+	ret = __xe_vm_bind(xe, ctx->vm, 0, 0, 0, cmd_vm_addr, SZ_4K,
+			   DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
+	igt_assert_eq(ret, 0);
+	ret = __xe_vm_bind(xe, ctx->vm, 0, 0, 0, ufence_vm_addr, ufence_bo_size,
+			   DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
+	igt_assert_eq(ret, 0);
+
+	munmap(ufence_map, ufence_bo_size);
+	gem_close(xe, cmd_bo);
+	gem_close(xe, ufence_bo);
+
+	igt_info("Faulting write batch completed successfully\n");
+}
+
+/* Fault-mode variant of vm_bind_decompress_uapi_bad_params.
+ * It reuses your bad_cases but, for expected-success cases, triggers
+ * a GPU write to the mapped VA to force the kernel page-fault/decompress path.
+ */
+static void vm_bind_decompress_uapi_bad_params_fault_mode(int xe,
+							  intel_ctx_t *ctx,
+							  u64 ahnd,
+							  u32 region1,
+							  u32 region2,
+							  u32 width,
+							  u32 height,
+							  enum blt_tiling_type tiling,
+							  const struct test_config *config)
+{
+	struct vm_bind_decomp_setup_resources allocated_resources = {};
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+	};
+	intel_ctx_t *fault_ctx = NULL;
+	u32 fault_exec_queue = 0;
+	int ret = 0;
+	bool pattern_matches;
+	void *mapped_data = MAP_FAILED;
+	u64 addr;
+	u32 handle;
+	u64 use_map_size;
+	const uint64_t default_alignment = xe_get_default_alignment(xe);
+	struct vm_bind_decomp_neg_test_case bad_cases[8] = {
+	/* PAT-based accepts (DECOMPRESS + Default PAT) */
+	{ "decompress-default-pat", DEFAULT_PAT_INDEX,
+	  DRM_XE_VM_BIND_FLAG_DECOMPRESS, false },
+
+	/* PAT-based accepts (DECOMPRESS + GPU WB PAT) */
+	{ "decompress-gpu-wb-pat", 0,
+	  DRM_XE_VM_BIND_FLAG_DECOMPRESS, false },
+
+	/* PAT-based rejects (DECOMPRESS + Invalid PAT) */
+	{ "decompress-invalid-pat", INVALID_PAT_INDEX,
+	  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+	/* PAT-based rejects (DECOMPRESS + non-UC PAT) */
+	{ "decompress-gpu-wt-pat", 0,
+	  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+	/* PAT-based rejects (DECOMPRESS + compressed PAT) */
+	{ "decompress-gpu-compressed-pat", 0,
+	  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+	/* Range smaller than the uncompressed size (should be rejected for DECOMPRESS) */
+	{ "decompress-small-range", 0,
+	  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+	/* Misaligned virtual address for DECOMPRESS update */
+	{ "decompress-misaligned-va", 0,
+	  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+
+	/* Wrong BO handle supplied (invalid handle) */
+	{ "decompress-wrong-bo-handle", 0,
+	  DRM_XE_VM_BIND_FLAG_DECOMPRESS, true },
+	};
+	/* Setup (this asserts+cleans on failure) */
+	ret = vm_bind_decomp_test_setup(xe, ctx, ahnd, region1, region2, width,
+					height, tiling, config, false, true,
+					&allocated_resources);
+	igt_assert_eq(ret, 0);
+	igt_assert_f(allocated_resources.vm != 0, "VM not created\n");
+
+	/* Fault-triggering writes must execute in the same VM used by VM_BIND. */
+	fault_exec_queue = xe_exec_queue_create(xe, allocated_resources.vm, &inst, 0);
+	fault_ctx = intel_ctx_xe(xe, allocated_resources.vm, fault_exec_queue, 0, 0, 0);
+	igt_assert_f(fault_ctx, "failed to create fault-mode execution context\n");
+
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
+	/* Fill PAT values before iterating through each case*/
+	bad_cases[1].pat = intel_get_pat_idx_wb(xe);
+	bad_cases[3].pat = intel_get_pat_idx_wt(xe);
+	bad_cases[4].pat = intel_get_pat_idx_uc_comp(xe);
+	bad_cases[5].pat = allocated_resources.uncompressed_pat;
+	bad_cases[6].pat = allocated_resources.uncompressed_pat;
+	bad_cases[7].pat = allocated_resources.uncompressed_pat;
+
+	/* Iterate cases */
+	for (unsigned int i = 0; i < ARRAY_SIZE(bad_cases); i++) {
+		const struct vm_bind_decomp_neg_test_case *test_variant = &bad_cases[i];
+
+		/* Reset per-case parameters */
+		u32 use_pat = test_variant->pat;
+		u32 flags = test_variant->flags;
+
+		addr = allocated_resources.vm_map_addr;
+		handle = allocated_resources.handle;
+		use_map_size = allocated_resources.map_size;
+
+		igt_info("\nVM_BIND variant: %s\n", test_variant->test_name);
+
+		/* Corrupt inputs or pass wrong params for a few special cases. */
+		if (!strcmp(test_variant->test_name, "decompress-small-range")) {
+			if (allocated_resources.map_size > default_alignment)
+				use_map_size = allocated_resources.map_size - 1;
+			igt_info("Using reduced map size: %llu\n",
+				 (unsigned long long)use_map_size);
+		} else if (!strcmp(test_variant->test_name, "decompress-misaligned-va")) {
+			addr = allocated_resources.vm_map_addr + 1;
+		} else if (!strcmp(test_variant->test_name, "decompress-wrong-bo-handle")) {
+			handle = allocated_resources.handle ^ 0xdeadbeef;
+		}
+
+		errno = 0;
+		ret =
+		__xe_vm_bind(xe, allocated_resources.vm, 0, handle, 0, addr,
+			     use_map_size, DRM_XE_VM_BIND_OP_MAP, flags,
+			     NULL, 0, 0, use_pat, 0);
+		if (test_variant->expect_fail) {
+			if (ret == 0) {
+				/* Unexpected success — unmap and abort */
+				igt_warn("VM_BIND unexpectedly SUCCEEDED for %s — cleaning up\n",
+					 test_variant->test_name);
+				__xe_vm_bind(xe, allocated_resources.vm, 0, 0, 0,
+					     addr, use_map_size, DRM_XE_VM_BIND_OP_UNMAP, 0,
+					     NULL, 0, 0, 0, 0);
+				vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+				igt_assert_f(false,
+					     "VM_BIND expected failure but succeeded for %s",
+					     test_variant->test_name);
+			} else {
+				igt_info("VM_BIND rejected as expected for %s "
+				"(ret=%d errno=%d %s)\n",
+				test_variant->test_name, ret, errno, strerror(errno));
+				igt_info("Success : VM_Bind rejected\n");
+			}
+		} else {
+			/* Expected path: VM_BIND must succeed, then data integrity is verified. */
+			if (ret != 0) {
+				igt_warn("VM_BIND unexpectedly FAILED for %s: %d (%s)\n",
+					 test_variant->test_name, ret, strerror(errno));
+				vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+				igt_assert_f(false, "VM_BIND unexpected failure for %s",
+					     test_variant->test_name);
+			}
+
+			igt_info("VM_BIND succeeded for %s (as expected)\n",
+				 test_variant->test_name);
+			/* Trigger page-fault via GPU write to the mapped VA */
+			trigger_page_fault_write(xe, fault_ctx, addr,
+						 allocated_resources.map_size,
+						 region1);
+
+			/* Compare destination buffer against source and print short dumps. */
+			mapped_data = xe_bo_map(xe, allocated_resources.handle,
+						allocated_resources.size);
+			igt_assert_f(mapped_data != MAP_FAILED,
+				     "Failed to map destination BO for %s\n",
+				     test_variant->test_name);
+
+			print_buffer_data(allocated_resources.src_obj->ptr,
+					  min_t(size_t, 64, allocated_resources.size),
+					  "ORIGINAL", 4);
+			print_buffer_data(mapped_data,
+					  min_t(size_t, 64, allocated_resources.size),
+					  "DECOMPRESSED", 4);
+
+			pattern_matches =
+				verify_test_pattern(mapped_data,
+						    allocated_resources.size,
+						    "DECOMPRESSED");
+			if (!pattern_matches)
+				igt_info("Decompression pattern verification FAILED for %s\n",
+					 test_variant->test_name);
+
+			if (memcmp(mapped_data,
+				   allocated_resources.src_obj->ptr,
+				   allocated_resources.size) != 0) {
+				igt_info("Decompressed data does not match original for %s\n",
+					 test_variant->test_name);
+				print_buffer_data(mapped_data,
+						  min_t(size_t, 256, allocated_resources.size),
+						  "CURRENT_STATE", 4);
+				print_buffer_data(allocated_resources.src_obj->ptr,
+						  min_t(size_t, 256, allocated_resources.size),
+						  "EXPECTED", 4);
+
+				munmap(mapped_data, allocated_resources.size);
+				mapped_data = MAP_FAILED;
+				vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+				igt_assert_f(false,
+					     "Decompressed BO contents differ from original for %s",
+					     test_variant->test_name);
+			}
+
+			igt_info("Decompression content matches original for %s\n",
+				 test_variant->test_name);
+			munmap(mapped_data, allocated_resources.size);
+			mapped_data = MAP_FAILED;
+
+			/* Unmap to keep state clean for next iteration */
+			ret =
+				__xe_vm_bind(xe, allocated_resources.vm, 0, 0, 0, addr,
+					     use_map_size, DRM_XE_VM_BIND_OP_UNMAP,
+					     0, NULL, 0, 0, 0, 0);
+			if (ret != 0)
+				igt_warn("Unmap after VM_BIND (fault-mode) failed: %d (%s)\n", ret,
+					 strerror(errno));
+		}
+	}
+
+	if (fault_exec_queue)
+		xe_exec_queue_destroy(xe, fault_exec_queue);
+	free(fault_ctx);
+
+	/* Final cleanup */
+	vm_bind_decomp_test_cleanup(xe, ahnd, &allocated_resources);
+}
+
 struct blt_copy3_data {
 	int xe;
 	struct blt_copy_object src;
@@ -1740,6 +2082,12 @@ static void single_copy(int xe, const struct test_config *config,
 		vm_bind_decompress_uapi_bad_params(xe, ctx, ahnd, region1, region2,
 						   width, height, tiling, config);
 		put_ahnd(ahnd);
+	} else if (config->vm_bind_decompress_uapi_bad_params_fault_mode) {
+		ahnd = intel_allocator_open(xe, vm, INTEL_ALLOCATOR_RELOC);
+		vm_bind_decompress_uapi_bad_params_fault_mode(xe,
+							      ctx, ahnd, region1, region2,
+							      width, height, tiling, config);
+		put_ahnd(ahnd);
 	} else {
 		copyfns[copy_function].copyfn(xe, ctx,
 					      region1, region2,
@@ -2057,6 +2405,19 @@ int igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
 	}
 
+	igt_describe("Validate uAPI of VM_BIND with DECOMPRESS flag with bad params");
+	igt_subtest("vm-bind-decompress-uapi-bad-params-fault-mode") {
+		struct test_config config = { .compression = true,
+			.vm_bind_decompress_uapi_bad_params_fault_mode = true };
+		u32 region1 = system_memory(xe);
+		u32 region2 = vram_if_possible(xe, 0);
+		int tiling = T_LINEAR;
+		int width = param.width;
+		int height = param.height;
+
+		single_copy(xe, &config, region1, region2, width, height, tiling, BLOCK_COPY);
+	}
+
 	igt_fixture() {
 		xe_device_put(xe);
 		close(xe);
-- 
2.43.0

