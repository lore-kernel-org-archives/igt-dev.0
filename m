Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C69C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 09:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548AE10E4BB;
	Mon, 21 Jul 2025 09:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrEzVoRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA16510E4BB
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753090046; x=1784626046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UJ2JGrWBJ0SavRQQwl4rxyvntHHTZBMs1wUYr7SE3kU=;
 b=WrEzVoRPvYsJ0iRY3xyNgATWmhwwwZY0kCyQ0XeCArUoD11vfdjkVX60
 d8j+uuYd+Pe6FCOYd8XIexpuFgxG1J0Yu1cdsyNPecrTLHN31YrYQt0Sy
 Qk/ncMIVM5GMOR6Zgo6v8u0+gc6YVZkF/nhi6IDyD1ioSvmnhuW3r9b16
 +Z2trx2K+UQv7P0Q70Yw+CJdv6hbVA5kTpCDpODR2eO9zJAdtcpmqatwi
 ZWiMN2CessRuikslziWzt/N6GYMAKip7MmQiXVduCFlc3eyJUyH1EpEPu
 xJd0yyWNZVRaCTzDjCq0bjWgYGaflqtgFbNVfyiKPlv50/AzDeVREdhSH g==;
X-CSE-ConnectionGUID: H18LInoATMeDNYBPkPwiXA==
X-CSE-MsgGUID: 0gJjkQubQkCPNEHLJ4cG6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55391036"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="55391036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 02:27:26 -0700
X-CSE-ConnectionGUID: GEkq6CUHRa6KIMIDJ+PZzg==
X-CSE-MsgGUID: LvYefkQATkKp7IkaJRPXMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="159223838"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 02:27:24 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_*: Apply NEEDS_VISIBLE_VRAM in remaining
 affected tests
Date: Mon, 21 Jul 2025 11:27:16 +0200
Message-Id: <20250721092716.11880-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Extend the fix from commit b9a5a4d03955 ("tests/intel/xe_*: Use
NEEDS_VISIBLE_VRAM flag where it's missing") to additional tests that
were missed earlier.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_drm_fdinfo.c            |  3 ++-
 tests/intel/xe_exec_compute_mode.c     |  6 ++++--
 tests/intel/xe_spin_batch.c            | 12 ++++++++----
 tests/intel/xe_sysfs_preempt_timeout.c |  6 ++++--
 tests/intel/xe_waitfence.c             |  3 ++-
 5 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 17f66f1de..264380d99 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -158,7 +158,8 @@ static void mem_active(int fd, struct drm_xe_engine *engine)
 		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
 		pre_size = info.region_mem[memregion->instance + 1].active;
 
-		bo = xe_bo_create(fd, vm, bo_size, region, 0);
+		bo = xe_bo_create(fd, vm, bo_size, region,
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 
 		for (i = 0; i < N_EXEC_QUEUES; i++) {
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index f321e1d76..b904dc76b 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -367,7 +367,8 @@ static void non_block(int fd, int expect)
 	bo_size = xe_bb_size(fd, bo_size);
 
 	engine = xe_engine(fd, 1);
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	data = xe_bo_map(fd, bo, bo_size);
 	memset(data, 0, bo_size);
@@ -464,7 +465,8 @@ static void lr_mode_workload(int fd)
 	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COPY);
 	igt_assert(engine);
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, bo_size);
 
 	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 48a888e35..ee2d0ec3f 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -276,7 +276,8 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 	exec_queue = xe_exec_queue_create(fd, vm, hwe, ext);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 	bo_size = xe_bb_size(fd, sizeof(*spin));
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, bo_size);
 	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
 							ALLOC_STRATEGY_LOW_TO_HIGH);
@@ -347,8 +348,10 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
 					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
 
 	/* Create source and destination objects used for the copy */
-	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
-	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
+	src_handle = xe_bo_create(fd, 0, copy_size, region,
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	dst_handle = xe_bo_create(fd, 0, copy_size, region,
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
 			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
@@ -361,7 +364,8 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
 						   mem_copy.dst->size, 0, mem_copy.dst->pat_index);
 
 	/* Create spinner */
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, bo_size);
 	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
 							ALLOC_STRATEGY_LOW_TO_HIGH);
diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
index 139f68d22..ff58c4d49 100644
--- a/tests/intel/xe_sysfs_preempt_timeout.c
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -86,7 +86,8 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
 	exec_queues[1] = xe_exec_queue_create(fd, vm[1], hwe, to_user_pointer(&ext));
 	ahnd[0] = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 	bo_size = xe_bb_size(fd, sizeof(*spin));
-	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0), 0);
+	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0),
+			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin[0] = xe_bo_map(fd, bo[0], bo_size);
 	xe_vm_bind_async(fd, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
 	xe_spin_init_opts(spin[0], .addr = addr1,
@@ -98,7 +99,8 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
 
 	igt_nsec_elapsed(&ts);
 	ahnd[1] = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
-	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0), 0);
+	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0),
+			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin[1] = xe_bo_map(fd, bo[1], bo_size);
 	xe_vm_bind_sync(fd, vm[1], bo[1], 0, addr2, bo_size);
 	xe_spin_init_opts(spin[1], .addr = addr2);
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 48076ddeb..5fcd4fc74 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -238,7 +238,8 @@ exec_queue_reset_wait(int fd)
 	};
 
 	bb_size = xe_bb_size(fd, 0x40000);
-	bo = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, 0), 0);
+	bo = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bb_size);
 
 	batch_offset = (char *)&data[0].batch - (char *)data;
-- 
2.40.0

