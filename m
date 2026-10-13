Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977C1CC6B0E
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 07:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBC210F53E;
	Tue, 13 Oct 2026 07:36:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081D710F53B
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 07:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791876940; x=1823412940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZdGYTM7PTOA8C4uChSoOwnj44dDjIu+TxvbYRkqmNfo=;
 b=g1bz6auB1/q4m8lJYBI1M1dtqnHYJb5iYf7P2o8bFCt27tUs0txTve/o
 lQWUlfUnSGcIY2dKbQcjcSPcw5HWuF9TesASW3uEfau+nTtbTprUm8Ypb
 m2JSiKKbHKU1VPib02IZdRTj/hRaudu8wUai5MzFmxeInEQG77f6+xr4y
 DjULZQ3OVEoKuwiuX0vGHM1yL+RzS0OzgpEO+C2SypgzzNnUoEr2Kkaxt
 ianhfUjSodXvjF9e6rasYkXvLSjv9ScRYJwGZJAcWLnKGAXGEmtT6x4L1
 iMOEt4W6yz881LHhcje8SWuOEu18FUUzhOcGAxT1AChtI/VPnRybcmO8N g==;
X-CSE-ConnectionGUID: Yr+nxcTJT1CJv5F6ZoSPDg==
X-CSE-MsgGUID: I/eBv79GTxGY8kDtmOIG3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="587493"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="587493"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 00:35:39 -0700
X-CSE-ConnectionGUID: ZO6xI9FUR7GCtn9BjbNPiw==
X-CSE-MsgGUID: T4qiyC9dTEG/lG9WPTIs9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1108081"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 00:35:40 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: kamil.konieczny@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/xe_vm: Validate host memory for
 overcommit tests
Date: Tue, 13 Oct 2026 07:35:32 +0000
Message-ID: <20261013073532.2885788-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
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

The amount of VRAM available for the overcommit tests varies
across platforms. As a result, the host RAM space required to
support the overcommit workload also varies based on eviction.

Query the platform RAM space and visible VRAM before running
overcommit tests. Skip if the expected eviction footprint
exceeds 50% of available RAM.

v2:
- Base host-memory requirement based on the run time budget
- Drop use vram and SRAM Handling; all the cases are VRAM

v3:
- Moved BO calculation at the caller side of test_vm_overcommit
- Modified the check keeping total bo size instead of swap
  space check and multiplier (Nishit)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 93 +++++++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 38 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index a0a6616c3..d1157803d 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -20,7 +20,9 @@
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
 #include <string.h>
+
 #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+#define OVERCOMMIT_BO_SIZE SZ_64M
 
 enum overcommit_stage {
 	EXPECT_NONE,
@@ -2385,10 +2387,10 @@ static void invalid_vm_id(int fd)
 }
 
 static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos, int num_bos,
-					     uint64_t nf_bo_size, bool use_vram, uint64_t data_addr,
-					     uint32_t bo_flags, int gt_id, int *num_bound_out)
+					     uint64_t data_addr, uint32_t bo_flags, int gt_id,
+					     int *num_bound_out)
 {
-	uint32_t placement = use_vram ? vram_memory(fd, gt_id) : system_memory(fd);
+	uint32_t placement = vram_memory(fd, gt_id);
 
 	*num_bound_out = 0;
 
@@ -2397,7 +2399,7 @@ static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos,
 		int create_ret = 0;
 
 		/* Create BO using the case's create function */
-		create_ret = __xe_bo_create(fd, vm, nf_bo_size, placement,
+		create_ret = __xe_bo_create(fd, vm, OVERCOMMIT_BO_SIZE, placement,
 					    bo_flags, NULL, &bos[i]);
 
 		if (create_ret) {
@@ -2411,7 +2413,8 @@ static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos,
 		}
 
 		bind_err = __xe_vm_bind_lr_sync(fd, vm, bos[i], 0, data_addr +
-						((uint64_t)i * nf_bo_size), nf_bo_size, 0);
+						((uint64_t)i * OVERCOMMIT_BO_SIZE),
+						OVERCOMMIT_BO_SIZE, 0);
 		if (bind_err) {
 			if (errno == ENOMEM || errno == ENOSPC) {
 				igt_debug("BO bind failed at %d/%d - error %d (%s), %d BOs bound\n",
@@ -2425,21 +2428,21 @@ static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos,
 		*num_bound_out = i + 1;
 		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
 			  i + 1, num_bos,
-			  (unsigned long long)(data_addr + ((uint64_t)i * nf_bo_size)));
+			  (unsigned long long)(data_addr + ((uint64_t)i * OVERCOMMIT_BO_SIZE)));
 	}
 	return EXPECT_NONE;
 }
 
-static void verify_bo(int fd, uint32_t *bos, int num_bos, uint64_t nf_bo_size, uint64_t stride)
+static void verify_bo(int fd, uint32_t *bos, int num_bos, uint64_t stride)
 {
 	for (int i = 0; i < num_bos; i++) {
 		uint32_t *verify_data;
 		int errors = 0;
 
-		verify_data = xe_bo_map(fd, bos[i], nf_bo_size);
+		verify_data = xe_bo_map(fd, bos[i], OVERCOMMIT_BO_SIZE);
 		igt_assert(verify_data);
 
-		for (int off = 0; off < nf_bo_size; off += stride) {
+		for (int off = 0; off < OVERCOMMIT_BO_SIZE; off += stride) {
 			uint32_t expected = 0xBB;
 			uint32_t actual = *(uint32_t *)((char *)verify_data + off);
 
@@ -2451,7 +2454,7 @@ static void verify_bo(int fd, uint32_t *bos, int num_bos, uint64_t nf_bo_size, u
 			}
 		}
 
-		munmap(verify_data, nf_bo_size);
+		munmap(verify_data, OVERCOMMIT_BO_SIZE);
 		igt_assert_f(errors == 0, "Data verification failed for BO %d with %d errors\n",
 			     i, errors);
 	}
@@ -2497,7 +2500,6 @@ struct vm_overcommit_case {
 	const char *name;
 	uint32_t vm_flags;
 	uint32_t bo_flags;
-	bool use_vram;
 	uint64_t data_addr;
 	int overcommit_mult;
 	enum overcommit_stage expected_stage;
@@ -2510,7 +2512,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x1a0000,
 		.overcommit_mult = 2,
 		.expected_stage = EXPECT_BIND,
@@ -2520,7 +2521,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 		.name = "vram-lr-external-nodefer",
 		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x1a0000,
 		.overcommit_mult = 2,
 		.expected_stage = EXPECT_BIND,
@@ -2531,7 +2531,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x300000000,
 		.overcommit_mult = 2,
 		.expected_stage = EXPECT_NONE,
@@ -2541,7 +2540,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 		.name = "vram-no-lr",
 		.vm_flags = 0,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x300000000,
 		.overcommit_mult = 2,
 		.expected_stage = EXPECT_EXEC,
@@ -2553,7 +2551,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x300000000,
 		.overcommit_mult = 2,
 		/*
@@ -2568,17 +2565,16 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 
 static void
 test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
-		   const struct vm_overcommit_case *c,
-		   uint64_t system_size, uint64_t vram_size)
+		   const struct vm_overcommit_case *c, int num_bos)
 {
 	uint32_t vm = 0, *bos, batch_bo = 0, exec_queue = 0, bind_exec_queue = 0;
 	uint64_t sync_addr = 0x1000000000, batch_addr = 0x200000000;
-	int i, num_bos, num_bound = 0, bind_err, create_ret, wait_ret;
-	size_t sync_size, nf_bo_size = 64 * 1024 * 1024;
+	int i, num_bound = 0, bind_err, create_ret, wait_ret;
 	enum overcommit_stage actual_stage = EXPECT_NONE;
-	uint64_t stride = 1024 * 1024, base_size;
-	uint64_t overcommit_size, off, data_addr;
+	uint64_t off, data_addr;
 	int64_t timeout = 20 * NSEC_PER_SEC;
+	uint64_t stride = SZ_1M;
+	size_t sync_size;
 	struct drm_xe_sync bind_sync[1] = {
 		{
 			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -2607,18 +2603,10 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t *user_fence_sync = NULL;
 
 	data_addr = c->data_addr;
-	base_size = c->use_vram ? vram_size : system_size;
-	overcommit_size = ALIGN((uint64_t)(base_size * c->overcommit_mult), 4096);
 
-	num_bos = (overcommit_size / nf_bo_size) + 1;
 	bos = calloc(num_bos, sizeof(*bos));
 	igt_assert(bos);
 
-	igt_debug("Overcommit test: allocating %d BOs of %llu MB each",
-		  num_bos, (unsigned long long)(nf_bo_size >> 20));
-	igt_debug("total=%llu MB, vram=%llu MB\n",
-		  (unsigned long long)(num_bos * nf_bo_size >> 20),
-		  (unsigned long long)(vram_size >> 20));
 	/* Create VM with appropriate flags */
 	vm = xe_vm_create(fd, c->vm_flags, 0);
 	igt_assert(vm);
@@ -2632,8 +2620,10 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 	exec_sync->addr = to_user_pointer(&user_fence_sync[0]);
 
 	/* Create and bind data BOs */
-	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, c->use_vram, data_addr,
+	actual_stage = create_data_bos(fd, vm, bos, num_bos, data_addr,
 				       c->bo_flags, eci->gt_id, &num_bound);
+	igt_debug("Overcommit BO creation: case=%s actual_stage=%d num_bound=%d/%d\n",
+		  c->name, actual_stage, num_bound, num_bos);
 	/*
 	 * On EXPECT_CREATE nothing was bound so bail out entirely.
 	 * On EXPECT_BIND with no BOs bound there is nothing to execute either.
@@ -2680,8 +2670,8 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_debug("Writing to BO %d/%d via GPU\n", i + 1, num_bos);
 		timeout = 20 * NSEC_PER_SEC;
 
-		for (off = 0; off < nf_bo_size; off += stride) {
-			uint64_t target_addr = data_addr + ((uint64_t)i * nf_bo_size) + off;
+		for (off = 0; off < OVERCOMMIT_BO_SIZE; off += stride) {
+			uint64_t target_addr = data_addr + ((uint64_t)i * OVERCOMMIT_BO_SIZE) + off;
 			int b_idx = 0;
 
 			batch_data->batch[b_idx++] = MI_STORE_DWORD_IMM_GEN4;
@@ -2725,7 +2715,7 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 
 	/* Verify GPU writes for bound BOs */
 	if (actual_stage == EXPECT_NONE || (actual_stage == EXPECT_BIND && num_bound > 0))
-		verify_bo(fd, bos, num_bound, nf_bo_size, stride);
+		verify_bo(fd, bos, num_bound, stride);
 
 check_and_cleanup:
 	igt_assert_f(actual_stage == c->expected_stage, "Expected overcommit at stage %d, got %d\n",
@@ -3499,10 +3489,37 @@ int igt_main()
 		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
 					"fault" : "nonfault";
 		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
-			igt_require(xe_has_vram(fd));
-			igt_require(xe_visible_vram_size(fd, 0));
-			test_vm_overcommit(fd, hwe_non_copy, c, (igt_get_avail_ram_mb() << 20),
-					   xe_visible_vram_size(fd, 0));
+			uint64_t vram_size, vram_mb, avail_ram_mb, ram_mb, required_mb;
+			uint64_t overcommit_size, total_bo_size;
+			int num_bos;
+
+			vram_size = xe_visible_vram_size(fd, 0);
+			igt_require(vram_size);
+			vram_mb = vram_size >> 20;
+			avail_ram_mb = igt_get_avail_ram_mb();
+			ram_mb = igt_get_total_ram_mb();
+
+			overcommit_size = ALIGN(vram_size * c->overcommit_mult, 4096);
+			num_bos = overcommit_size / OVERCOMMIT_BO_SIZE + 1;
+			total_bo_size = (uint64_t)num_bos * OVERCOMMIT_BO_SIZE;
+
+			igt_assert_lt_u64(vram_size, total_bo_size);
+
+			igt_debug("Overcommit %s-%s: mult=%d ram=%" PRIu64 "MiB\n",
+				  mode, c->name, c->overcommit_mult, ram_mb);
+			igt_debug("Overcommit avail_ram=%" PRIu64 "MiB vram=%" PRIu64 "MiB\n",
+				  avail_ram_mb, vram_mb);
+			igt_debug("Overcommit size=%" PRIu64 "MiB num_bos=%d\n",
+				  overcommit_size >> 20, num_bos);
+			igt_debug("Overcommit bo_size=%dMiB total=%" PRIu64 "MiB\n",
+				  OVERCOMMIT_BO_SIZE >> 20, total_bo_size >> 20);
+
+			required_mb = ALIGN(DIV_ROUND_UP(total_bo_size - vram_size,
+							 SZ_1M), 64) + 64;
+			igt_require_f(required_mb <= avail_ram_mb * 50 / 100,
+				      "Need %" PRIu64 "MiB, > 50%% of avail RAM %" PRIu64 "MiB\n",
+				      required_mb, avail_ram_mb);
+			test_vm_overcommit(fd, hwe_non_copy, c, num_bos);
 		}
 	}
 
-- 
2.55.0

