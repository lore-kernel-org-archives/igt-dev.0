Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA25C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7916110FDA3;
	Wed, 20 Mar 2024 15:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fR+ux0HH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8196B10FDA3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950129; x=1742486129;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XZpQPZcDF8dMA4gSrNER8dtY8wB7JIWi1NdGsX3rNh8=;
 b=fR+ux0HHMebWNqbZ9mYZHhq5IUVOTicAG4AkUFJgqTYDR9v1sN8yPp0U
 vmw6fpciK1EBdkHBbjxa/ijsuQmKPpriL9xlWcFQHa1s3PlKj7y29Nhxa
 JpIY9a5QmfdW8mXQdQtki1FZZ5ZwPg0wbAnRbrKRYEOtEAB98cRC4UEpJ
 LDx5MEbmaU8XwC3Q+RxOrCItUJrhTHsbpS4mCy/Xp7Le6bh110Lk/0KWf
 UeDcC7UcW/qtAc4hldJJhz+jW0oqS4uIop05IU8rH1avaWpR6ulDR2lDs
 zLtOL2p71acoMjvzK1Dj5bWakm8U9H0O7usaHIoiBuFWgY515IMjvsUDj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5821264"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5821264"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14590090"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa006.jf.intel.com with ESMTP; 20 Mar 2024 08:55:28 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_exec_compute_mode: Test to validate
 LR mode
Date: Wed, 20 Mar 2024 21:24:30 +0530
Message-Id: <20240320155430.11877-4-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
References: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test to validate LR mode flag by submitting workload for
30's.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 80 ++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 7dad71509..30cc7c105 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -400,6 +400,83 @@ static void non_block(int fd, int expect)
 	xe_vm_destroy(fd, vm);
 }
 
+#define LR_SPINNER_TIME 30
+/**
+ * SUBTEST: lr-mode-workload
+ * Description: Stress LR mode workload for 30s.
+ * Test category: functionality test
+ */
+static void lr_mode_workload(int fd)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct xe_spin *spin;
+	struct drm_xe_engine *engine;
+	uint64_t vm_sync;
+	size_t bo_size;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint64_t spin_addr;
+	uint64_t ahnd;
+	uint32_t bo;
+	uint32_t ts_1, ts_2;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	bo_size = xe_bb_size(fd, sizeof(*spin));
+	engine = xe_engine(fd, 1);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
+	spin = xe_bo_map(fd, bo, bo_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
+	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
+							ALLOC_STRATEGY_LOW_TO_HIGH);
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, spin_addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+
+	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true);
+	sync.addr = spin_addr + (char *)&spin->exec_sync - (char *)spin;
+	exec.exec_queue_id = exec_queue;
+	exec.address = spin_addr;
+	xe_exec(fd, &exec);
+	xe_spin_wait_started(spin);
+
+	/* Collect and check Timestamps before stopping the spinner */
+	sleep(LR_SPINNER_TIME);
+	ts_1 = spin->timestamp;
+	sleep(1);
+	ts_2 = spin->timestamp;
+
+	igt_assert(ts_1 != ts_2);
+	xe_spin_end(spin);
+	xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+
+	/* Check timestamps to make sure spinner is stopped */
+	ts_1 = spin->timestamp;
+	sleep(1);
+	ts_2 = spin->timestamp;
+	igt_assert(ts_1 == ts_2);
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, spin_addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	munmap(spin, bo_size);
+	gem_close(fd, bo);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -460,6 +537,9 @@ igt_main
 	igt_subtest("non-blocking")
 		non_block(fd, EWOULDBLOCK);
 
+	igt_subtest("lr-mode-workload")
+		lr_mode_workload(fd);
+
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.39.1

