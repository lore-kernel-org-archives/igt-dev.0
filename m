Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA7C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 06:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1AA10E10E;
	Mon, 11 Mar 2024 06:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmCSNGoX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1E710E10E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710139512; x=1741675512;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jca24feJ5w8h10ojiCTeqxOb2F6o4B0trIdjEQaLm5k=;
 b=mmCSNGoXoMgGJSsFH2bMg06Djl31B33j9Kr6oFArX0MLtQGlZrD4X8tb
 v4bczx5NvzZr5LqPDMpscXU37bkLIJqM8P9ZZd8gWc4wHVKSEE/CETnhp
 AxjRnGKnocVO3VrMMymefj2+a5kD+zVx3eDDgeOro42cPRs/e2HrhtDDf
 2W3zWiOPwFYmO7M30WkWChN4sikgPQDJuBAZKe5CB18DZGHXEFCK52lb3
 87DBlEb4Ikch3RoOVPzFMMy1ehwglUXt6pawpiSQuOwYjAVg/C7w8HHYc
 PnHhSNDtKaKdj8YHWdewTBgh1UyP4J75XgHvqDyvUF5p1xWTF0NToSJOG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4665372"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4665372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 23:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="15716163"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa003.jf.intel.com with ESMTP; 10 Mar 2024 23:45:09 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Long running test for
 fix duration of time.
Date: Mon, 11 Mar 2024 12:14:26 +0530
Message-Id: <20240311064426.4985-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test to validate LR mode flag for fixed duration of time.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 75 ++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 7dad71509..01850d2b7 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -400,6 +400,78 @@ static void non_block(int fd, int expect)
 	xe_vm_destroy(fd, vm);
 }
 
+#define DURATION_NS ((unsigned int)30000*NSEC_PER_SEC)
+/**
+ * SUBTEST: lr-with-duration
+ * Description: Stress LR mode workload for 30s.
+ * Test category: functionality test
+ */
+static void lr_with_duration(int fd)
+{
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[1] = {
+		{.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		 .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		 .timeline_value = USER_FENCE_VALUE},
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct  {
+		struct xe_spin spin;
+		uint64_t vm_sync;
+		uint32_t data;
+		uint64_t exec_sync;
+	} *data;
+	struct xe_spin_opts spin_opts;
+	const uint64_t duration_ns = DURATION_NS;
+	struct drm_xe_engine *engine;
+	size_t bo_size;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t bo;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	bo_size = sizeof(*data);
+	bo_size = xe_bb_size(fd, bo_size);
+
+	engine = xe_engine(fd, 1);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
+
+	data = xe_bo_map(fd, bo, bo_size);
+	memset(data, 0, bo_size);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
+	spin_opts.addr = addr + (char *)&data[0].spin - (char *)data;
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
+				spin_opts.addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	data[0].vm_sync = 0;
+
+	spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
+	xe_spin_init(&data[0].spin, &spin_opts);
+	sync[0].addr = addr + (char *)&data[0].exec_sync - (char *)data;
+	exec.exec_queue_id = exec_queue;
+	exec.address = spin_opts.addr;
+	xe_exec(fd, &exec);
+	xe_spin_wait_started(&data[0].spin);
+
+	xe_spin_end(&data[0].spin);
+	xe_wait_ufence(fd, &data[0].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -460,6 +532,9 @@ igt_main
 	igt_subtest("non-blocking")
 		non_block(fd, EWOULDBLOCK);
 
+	igt_subtest("lr-with-duration")
+		lr_with_duration(fd);
+
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.39.1

