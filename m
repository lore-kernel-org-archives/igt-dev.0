Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2C0C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 09:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B996110E7AA;
	Fri, 20 Feb 2026 09:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IV4E2Lgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE0710E7A9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771579848; x=1803115848;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bus4ixbCrzWg5HOflnduICXmVNVm5WSeo85n68LApZI=;
 b=IV4E2LgoU4HLyZvcAZWmoj/dCPgai4ttL1eefuw3hG1jTbsfteO5OKyT
 NhwzQxZYceF6b8t03hNNZwjQ0sHUuJU5gjfUgDkrRBfuYJENN/Wz1kr76
 nEK9WX8kRkHBOAE31Ej+kdJ0wF1HikpDugqtEQWZcFE4YXaRFoJ6bAHME
 PXf5MRV4tDsQX5SOuEK1+kDKlhK2dXzoz+NwuptCZQJO/YKvQZFKspxhy
 ihqZza+AcN/LRW/i+TsOcLIwMqgjNyRW9z84mCTCJNxXnFPs4vRFQCZwC
 I4Rob6Js6eYue7SUGZR040PTrfAzBjmHr9w29BWnPCuVt5z5fLv9T1S+M g==;
X-CSE-ConnectionGUID: Wnaq2nUwSney1/RfxtkR7w==
X-CSE-MsgGUID: HG7CHgsbSkK/iZ6brLTfsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72373789"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72373789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 01:30:48 -0800
X-CSE-ConnectionGUID: u1IM8CejTNqAsB4Hrp6R7g==
X-CSE-MsgGUID: XynRt9mfR8mGAfUZ8AW8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214030431"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.6])
 by orviesa010.jf.intel.com with ESMTP; 20 Feb 2026 01:30:47 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_exec_store: Extending test scope for
 PCIE6 relax ordering
Date: Fri, 20 Feb 2026 09:30:41 +0000
Message-Id: <20260220093041.1911492-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220093041.1911492-1-nishit.sharma@intel.com>
References: <20260220093041.1911492-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This is extension of validating PCIe relax ordering to run on all possible
memory region available in a device. Currently VRAM region is utilized for
memory operations for discrete platforms. This extension utilizes both
System and VRAM region of discrete GPU for performing memory operations.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_store.c | 107 ++++++++++++++++++++++--------------
 1 file changed, 66 insertions(+), 41 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 5930f16e5..f65c22779 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -114,7 +114,7 @@ static void persistance_batch(struct data *data, uint64_t addr)
  * Description: Test to verify store dword on all available engines.
  */
 static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci,
-		       uint16_t dev_id)
+		       uint16_t dev_id, uint32_t region)
 {
 	struct drm_xe_sync sync[2] = {
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
@@ -143,8 +143,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	bo_size = sizeof(*data);
 	bo_size = xe_bb_size(fd, bo_size);
 
-	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
+	bo = xe_bo_create(fd, vm, bo_size, region,
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
@@ -193,7 +192,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
  * @page-sized: page-sized
  */
 static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
-			     unsigned int flags)
+			     unsigned int flags, uint32_t region)
 {
 	struct drm_xe_sync sync[2] = {
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
@@ -225,8 +224,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 	sync[0].handle = syncobj_create(fd, 0);
 
 	for (i = 0; i < count; i++) {
-		bo[i] = xe_bo_create(fd, vm, bo_size,
-				     vram_if_possible(fd, eci->gt_id),
+		bo[i] = xe_bo_create(fd, vm, bo_size, region,
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		bo_map[i] = xe_bo_map(fd, bo[i], bo_size);
 		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
@@ -282,7 +280,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
  * SUBTEST: persistent
  * Description: Validate MI_PRT_BATCH_BUFFER_START functionality
  */
-static void persistent(int fd)
+static void persistent(int fd, uint32_t region)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
@@ -309,12 +307,10 @@ static void persistent(int fd)
 	batch_size = xe_bb_size(fd, batch_size);
 
 	engine = xe_engine(fd, 1);
-	sd_batch = xe_bo_create(fd, vm, batch_size,
-			      vram_if_possible(fd, engine->instance.gt_id),
-			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	prt_batch = xe_bo_create(fd, vm, batch_size,
-			      vram_if_possible(fd, engine->instance.gt_id),
-			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	sd_batch = xe_bo_create(fd, vm, batch_size, region,
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	prt_batch = xe_bo_create(fd, vm, batch_size, region,
+				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	xe_vm_bind_sync(fd, vm, sd_batch, 0, addr, batch_size);
 	sd_data = xe_bo_map(fd, sd_batch, batch_size);
@@ -419,7 +415,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
  * Test category: functionality test
  *
  */
-static void mem_transection_ordering(int fd, size_t bo_size, bool fence)
+static void mem_transaction_ordering(int fd, size_t bo_size, bool fence, uint32_t region)
 {
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
@@ -456,8 +452,7 @@ static void mem_transection_ordering(int fd, size_t bo_size, bool fence)
 	sync[0].handle = syncobj_create(fd, 0);
 
 	for (i = 0; i < count; i++) {
-		bo[i] = xe_bo_create_caching(fd, vm, bo_size, system_memory(fd), 0,
-					     DRM_XE_GEM_CPU_CACHING_WC);
+		bo[i] = xe_bo_create_caching(fd, vm, bo_size, region, 0, DRM_XE_GEM_CPU_CACHING_WC);
 		bo_map[i] = xe_bo_map(fd, bo[i], bo_size);
 		offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
 								bo_size, 0,
@@ -493,7 +488,6 @@ static void mem_transection_ordering(int fd, size_t bo_size, bool fence)
 	}
 	if (fence)
 		batch_map[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
-
 	batch_map[b++] = MI_BATCH_BUFFER_END;
 	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
@@ -538,44 +532,72 @@ int igt_main()
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 	uint16_t dev_id;
+	uint32_t region;
+	uint64_t memreg;
 	struct drm_xe_engine *engine;
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		xe_device_get(fd);
 		dev_id = intel_get_drm_devid(fd);
+		memreg = all_memory_regions(fd);
 	}
 
-	igt_subtest("basic-store") {
-		engine = xe_engine(fd, 1);
-		basic_inst(fd, STORE, &engine->instance, dev_id);
+	igt_subtest_with_dynamic("basic-store") {
+		xe_for_each_mem_region(fd, memreg, region) {
+			igt_dynamic_f("region-%s", xe_region_name(region)) {
+				engine = xe_engine(fd, 1);
+				basic_inst(fd, STORE, &engine->instance, dev_id, region);
+			}
+		}
 	}
 
-	igt_subtest("basic-cond-batch") {
-		engine = xe_engine(fd, 1);
-		basic_inst(fd, COND_BATCH, &engine->instance, dev_id);
+	igt_subtest_with_dynamic("basic-cond-batch") {
+		xe_for_each_mem_region(fd, memreg, region) {
+			igt_dynamic_f("region-%s", xe_region_name(region)) {
+				engine = xe_engine(fd, 1);
+				basic_inst(fd, COND_BATCH, &engine->instance, dev_id, region);
+			}
+		}
 	}
 
 	igt_subtest_with_dynamic("basic-all") {
-		xe_for_each_engine(fd, hwe) {
-			igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d",
-				      xe_engine_class_string(hwe->engine_class),
-				      hwe->engine_instance,
-				      hwe->gt_id);
-			basic_inst(fd, STORE, hwe, dev_id);
+		xe_for_each_mem_region(fd, memreg, region) {
+			xe_for_each_engine(fd, hwe) {
+				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-Region-%s",
+					      xe_engine_class_string(hwe->engine_class),
+					      hwe->engine_instance,
+					      hwe->gt_id,
+					      xe_region_name(region))
+					basic_inst(fd, STORE, hwe, dev_id, region);
+			}
 		}
 	}
 
-	igt_subtest("cachelines")
-		xe_for_each_engine(fd, hwe)
-			store_cachelines(fd, hwe, 0);
+	igt_subtest_with_dynamic("cachelines") {
+		xe_for_each_mem_region(fd, memreg, region) {
+			xe_for_each_engine(fd, hwe) {
+				igt_dynamic_f("region-%s", xe_region_name(region))
+					store_cachelines(fd, hwe, 0, region);
+			}
+		}
+	}
 
-	igt_subtest("page-sized")
-		xe_for_each_engine(fd, hwe)
-			store_cachelines(fd, hwe, PAGES);
+	igt_subtest_with_dynamic("page-sized") {
+		xe_for_each_mem_region(fd, memreg, region) {
+			xe_for_each_engine(fd, hwe) {
+				igt_dynamic_f("region-%s", xe_region_name(region))
+					store_cachelines(fd, hwe, PAGES, region);
+			}
+		}
+	}
 
-	igt_subtest("persistent")
-		persistent(fd);
+	igt_subtest_with_dynamic("persistent") {
+		xe_for_each_mem_region(fd, memreg, region) {
+			igt_dynamic_f("region-%s", xe_region_name(region))
+				persistent(fd, region);
+		}
+	}
 
 	igt_subtest_with_dynamic("long-shader-bb-check") {
 		struct igt_collection *set;
@@ -604,6 +626,7 @@ int igt_main()
 		igt_collection_destroy(set);
 	}
 
+	igt_describe("Verify memory relax ordering using copy/write operations");
 	igt_subtest_with_dynamic("mem-write-ordering-check") {
 		struct {
 			size_t size;
@@ -614,10 +637,12 @@ int igt_main()
 			{ SZ_8M,  "8M" },
 		};
 
-		for (size_t i = 0; i < ARRAY_SIZE(sizes); i++) {
-			igt_dynamic_f("size-%s", sizes[i].label) {
-				mem_transection_ordering(fd, sizes[i].size, true);
-				mem_transection_ordering(fd, sizes[i].size, false);
+		xe_for_each_mem_region(fd, memreg, region) {
+			for (size_t i = 0; i < ARRAY_SIZE(sizes); i++) {
+				igt_dynamic_f("region-%s", xe_region_name(region)) {
+					mem_transaction_ordering(fd, sizes[i].size, true, region);
+					mem_transaction_ordering(fd, sizes[i].size, false, region);
+				}
 			}
 		}
 	}
-- 
2.34.1

