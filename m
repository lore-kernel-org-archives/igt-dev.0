Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4040CA9EBE
	for <igt-dev@archiver.kernel.org>; Sat, 10 Oct 2026 13:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A6110E5CC;
	Sat, 10 Oct 2026 13:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMClr+oE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBB210E5CC
 for <igt-dev@lists.freedesktop.org>; Sat, 10 Oct 2026 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791640105; x=1823176105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2useUkbbdydF/8U/wf+3PPO7fqYNS/AQRLWWluIDeRc=;
 b=TMClr+oEqTnJ4qrBGkPmAj5Z70WMD4rnF+JGoLIv4BJw9Flhkalfm+Ab
 sxa+OM9GIMXY1EybvaVa/j9vlFh3T2yc/HFWI8bSWAJ5OY56AaEnMVrbq
 GZ2RmZPno80IwDefe8MBQdzteFIri25riGzlOjv2XpnM2kg50R+7X/r55
 5NC2dORfHsV8kHlBAYU22pcbRdSRxLITgGabPfMyYWnxi9PZNsoMnZIuD
 ANs3f7tS8mG+uM0tTXM8+4yG90LYGmHZzNF+aapqhpTfL/uWswoUAzbOV
 mYPz2//dsb4MkoZ9PBQhz47WzNYBGCSNT7CnueIqTC2sD2r5mbAYrRHW8 A==;
X-CSE-ConnectionGUID: lzQV0nNkQpWhQWiH3l4SRA==
X-CSE-MsgGUID: 1O9st1S2Rt+wiYRAhTYkBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="296955"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="296955"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2026 06:48:25 -0700
X-CSE-ConnectionGUID: MloQEvA6QCGxzN92pdxTQA==
X-CSE-MsgGUID: Njgt9nBQTeODA1drQsivPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="531602"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2026 06:48:25 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: kamil.konieczny@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_vm: Validate host memory for
 overcommit tests
Date: Sat, 10 Oct 2026 13:48:09 +0000
Message-ID: <20261010134809.2844905-1-sobin.thomas@intel.com>
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
across platforms. As a result the host RAM space required to
support the overcommit workload also varies based on eviction.

Query the platform RAM space and visible VRAM before running
overcommit tests. Limit the overcommit working set to 50% of
the currently available RAM.

v2:
- Base host-memory requirement based on the run time budget
- Drop user_vram and SRAM Handling; all the cases are VRAM

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 48 ++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 1d109e783..5598c8ae7 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2385,10 +2385,10 @@ static void invalid_vm_id(int fd)
 }
 
 static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos, int num_bos,
-					     uint64_t nf_bo_size, bool use_vram, uint64_t data_addr,
+					     uint64_t nf_bo_size, uint64_t data_addr,
 					     uint32_t bo_flags, int gt_id, int *num_bound_out)
 {
-	uint32_t placement = use_vram ? vram_memory(fd, gt_id) : system_memory(fd);
+	uint32_t placement = vram_memory(fd, gt_id);
 
 	*num_bound_out = 0;
 
@@ -2497,7 +2497,6 @@ struct vm_overcommit_case {
 	const char *name;
 	uint32_t vm_flags;
 	uint32_t bo_flags;
-	bool use_vram;
 	uint64_t data_addr;
 	int overcommit_mult;
 	enum overcommit_stage expected_stage;
@@ -2510,7 +2509,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x1a0000,
 		.overcommit_mult = 2,
 		.expected_stage = EXPECT_BIND,
@@ -2520,7 +2518,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 		.name = "vram-lr-external-nodefer",
 		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x1a0000,
 		.overcommit_mult = 2,
 		.expected_stage = EXPECT_BIND,
@@ -2531,7 +2528,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x300000000,
 		.overcommit_mult = 2,
 		.expected_stage = EXPECT_NONE,
@@ -2541,7 +2537,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 		.name = "vram-no-lr",
 		.vm_flags = 0,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x300000000,
 		.overcommit_mult = 2,
 		.expected_stage = EXPECT_EXEC,
@@ -2553,7 +2548,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
 		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
 			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
-		.use_vram = true,
 		.data_addr = 0x300000000,
 		.overcommit_mult = 2,
 		/*
@@ -2568,15 +2562,14 @@ static const struct vm_overcommit_case overcommit_cases[] = {
 
 static void
 test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
-		   const struct vm_overcommit_case *c,
-		   uint64_t system_size, uint64_t vram_size)
+		   const struct vm_overcommit_case *c, uint64_t vram_size)
 {
 	uint32_t vm = 0, *bos, batch_bo = 0, exec_queue = 0, bind_exec_queue = 0;
 	uint64_t sync_addr = 0x1000000000, batch_addr = 0x200000000;
 	int i, num_bos, num_bound = 0, bind_err, create_ret, wait_ret;
 	size_t sync_size, nf_bo_size = 64 * 1024 * 1024;
 	enum overcommit_stage actual_stage = EXPECT_NONE;
-	uint64_t stride = 1024 * 1024, base_size;
+	uint64_t stride = 1024 * 1024;
 	uint64_t overcommit_size, off, data_addr;
 	int64_t timeout = 20 * NSEC_PER_SEC;
 	struct drm_xe_sync bind_sync[1] = {
@@ -2607,10 +2600,15 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t *user_fence_sync = NULL;
 
 	data_addr = c->data_addr;
-	base_size = c->use_vram ? vram_size : system_size;
-	overcommit_size = ALIGN((uint64_t)(base_size * c->overcommit_mult), 4096);
+	overcommit_size = ALIGN((uint64_t)(vram_size * c->overcommit_mult), 4096);
 
 	num_bos = (overcommit_size / nf_bo_size) + 1;
+	igt_debug("Overcommit sizing: case=%s multiplier=%d "
+		  "vram_size=%" PRIu64
+		  " MiB overcommit_size=%" PRIu64 " MiB "
+		  "bo_size=%" PRIu64 " MiB num_bos=%d\n",
+		  c->name, c->overcommit_mult, vram_size >> 20,
+		  overcommit_size >> 20, nf_bo_size >> 20, num_bos);
 	bos = calloc(num_bos, sizeof(*bos));
 	igt_assert(bos);
 
@@ -2632,8 +2630,10 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 	exec_sync->addr = to_user_pointer(&user_fence_sync[0]);
 
 	/* Create and bind data BOs */
-	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, c->use_vram, data_addr,
+	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, data_addr,
 				       c->bo_flags, eci->gt_id, &num_bound);
+	igt_debug("Overcommit BO creation: case=%s actual_stage=%d num_bound=%d/%d\n",
+		  c->name, actual_stage, num_bound, num_bos);
 	/*
 	 * On EXPECT_CREATE nothing was bound so bail out entirely.
 	 * On EXPECT_BIND with no BOs bound there is nothing to execute either.
@@ -3499,10 +3499,22 @@ int igt_main()
 		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
 					"fault" : "nonfault";
 		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
-			igt_require(xe_has_vram(fd));
-			igt_require(xe_visible_vram_size(fd, 0));
-			test_vm_overcommit(fd, hwe_non_copy, c, (igt_get_avail_ram_mb() << 20),
-					   xe_visible_vram_size(fd, 0));
+			uint64_t vram_mb = xe_visible_vram_size(fd, 0) >> 20;
+			uint64_t avail_ram_mb = igt_get_avail_ram_mb();
+			uint64_t ram_mb = igt_get_total_ram_mb();
+			uint64_t required_mb = 0, budget_mb = 0;
+
+			igt_require(vram_mb);
+			igt_debug("Overcommit sizing: case=%s multi=%d ram=%" PRIu64 " MiB\n",
+				  c->name, c->overcommit_mult, ram_mb);
+			igt_debug("Overcommit sizing: mode=%s avail_ram=%" PRIu64 "MiB vram=%" PRIu64 "MiB\n",
+				  mode, avail_ram_mb, vram_mb);
+
+			required_mb = ALIGN(vram_mb * (c->overcommit_mult - 1), 64) + 64;
+			igt_require_f(required_mb <= avail_ram_mb * 50 / 100,
+				      "Overcommit needs %" PRIu64 " MiB, over 50%% of RAM + swap %" PRIu64 " MiB)\n",
+				       required_mb, avail_ram_mb);
+			test_vm_overcommit(fd, hwe_non_copy, c, xe_visible_vram_size(fd, 0));
 		}
 	}
 
-- 
2.55.0

