Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620E0EFB805
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 05:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF94510E4AF;
	Tue, 24 Feb 2026 05:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zp69hOZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F67110E4AF
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 05:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771911209; x=1803447209;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YBp29ZgZJ/Nw93LGBM76CB92DpWaYpdFcEt6aAMUuqM=;
 b=Zp69hOZOQcDkiVcjtFUItwRvJ/eWupZF68p3SO54+SsEQ6Z+twjLvZE+
 J8aCOUyRUchsMEIo72aO71gnN5xM2cMiGY47G2ABNyKMUCdOLYJXQnf2Y
 41HZMlt5U4wTjftZVtSGFZ0MZQxewUMdVNg5VcEoJ8bkOV/RVD49Q7db1
 3DCk0Qo8f4PKqgWqVbUVC9ITW5byUuMvs9ilEzWS63z8A/dmgFNrT4cGl
 mtrndZHzaE+Wm/H2/r8T3OhYx1bVh37uQiA546FNPDKdv03w7WacPoCUn
 cKVzpvAim5fW/cKEFSTrdcvqz2qznDfVQkSIPrGcnMdOilYZuFvBVnmKt Q==;
X-CSE-ConnectionGUID: N+joGK9RRKy4EH6uBf3daQ==
X-CSE-MsgGUID: 9r4nGH5oR5O/IkEMKShbFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83541473"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83541473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 21:33:28 -0800
X-CSE-ConnectionGUID: ohqPU2qTQ0+q9yjTIJ6Wyg==
X-CSE-MsgGUID: swMlaKgnSUakl+1iPo/fYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220354353"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.6])
 by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2026 21:33:28 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_store: Extend test coverage to
 all memory regions
Date: Tue, 24 Feb 2026 05:33:24 +0000
Message-Id: <20260224053324.2354159-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224053324.2354159-1-nishit.sharma@intel.com>
References: <20260224053324.2354159-1-nishit.sharma@intel.com>
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

This change generalizes the test to run on all available memory regions
(e.g., system and VRAM) in the device, instead of only VRAM. All relevant
subtests now iterate over each memory region, improving coverage and
validation.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_store.c | 106 ++++++++++++++++++++++--------------
 1 file changed, 65 insertions(+), 41 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 1acaa5aaa..faf2c7fa8 100644
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
-static void mem_transaction_ordering(int fd, size_t bo_size, bool fence)
+static void mem_transaction_ordering(int fd, size_t bo_size, bool fence, uint32_t region)
 {
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
@@ -456,8 +452,7 @@ static void mem_transaction_ordering(int fd, size_t bo_size, bool fence)
 	sync[0].handle = syncobj_create(fd, 0);
 
 	for (i = 0; i < count; i++) {
-		bo[i] = xe_bo_create_caching(fd, vm, bo_size, system_memory(fd), 0,
-					     DRM_XE_GEM_CPU_CACHING_WC);
+		bo[i] = xe_bo_create_caching(fd, vm, bo_size, region, 0, DRM_XE_GEM_CPU_CACHING_WC);
 		bo_map[i] = xe_bo_map(fd, bo[i], bo_size);
 		offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
 								bo_size, 0,
@@ -493,7 +488,6 @@ static void mem_transaction_ordering(int fd, size_t bo_size, bool fence)
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
@@ -615,10 +637,12 @@ int igt_main()
 			{ SZ_8M,  "8M" },
 		};
 
-		for (size_t i = 0; i < ARRAY_SIZE(sizes); i++) {
-			igt_dynamic_f("size-%s", sizes[i].label) {
-				mem_transaction_ordering(fd, sizes[i].size, true);
-				mem_transaction_ordering(fd, sizes[i].size, false);
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

