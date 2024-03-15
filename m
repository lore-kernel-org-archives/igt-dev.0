Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F97C54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 05:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BBD10F2D6;
	Fri, 15 Mar 2024 05:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxUJLFh+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C6110F2B9
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 05:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710479129; x=1742015129;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Z8hoVeeBYxNRhdUTQemKHVrqDZCjbslXNqAyhFDR/qA=;
 b=DxUJLFh+6WyrZUDv+KTTjBlKqufwrmWTknbjCAn3iYqNaIG5IUiTniQz
 M6HVRRG0HkjU5Bp4WrA/VDdWInGdeOJigj1x6hqfqCNBieopGrpICItxV
 EslemNqq54ebxY1wpm+zCN6LDVTrQKWa38IAA5PKNc94xpMmJOLYlfvRZ
 SmPzkK0KoNfuAoXSKJCygXeOJcfrX0qO1mZ3BUeyTfm96FXVYAV8neSDi
 Hfe0mIjet84HGt6/yF84B0hmHalX5/+PP8xowqo+bH6TzDuev5O8/BHfW
 SVwNIUjHT1XNTiQ4Phlg4TGlvCUfnVodtk2gKZamwG3rySALcIIRgi4ko g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15884256"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="15884256"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 22:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="35679297"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2024 22:05:27 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: Test to validate
 LR mode
Date: Fri, 15 Mar 2024 10:34:38 +0530
Message-Id: <20240315050438.21245-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240315050438.21245-1-sai.gowtham.ch@intel.com>
References: <20240315050438.21245-1-sai.gowtham.ch@intel.com>
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

Test to validate LR mode flag by submitting workload for
30's.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 76 ++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 7dad71509..7170bc746 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -400,6 +400,79 @@ static void non_block(int fd, int expect)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: lr-mode-workload
+ * Description: Stress LR mode workload for 30s.
+ * Test category: functionality test
+ */
+static void lr_mode_workload(int fd)
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
+	struct drm_xe_engine *engine;
+	size_t bo_size;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t bo;
+	uint32_t ts_1, ts_2;
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
+	spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	data[0].vm_sync = 0;
+
+	spin_opts.write_timestamp = true;
+	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
+	sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
+	exec.exec_queue_id = exec_queue;
+	exec.address = spin_opts.addr;
+	xe_exec(fd, &exec);
+	xe_spin_wait_started(&data[SPIN_DATA].spin);
+	sleep(30);
+	ts_1 = data[SPIN_DATA].spin.time_stamp;
+	sleep(10);
+	ts_2 = data[SPIN_DATA].spin.time_stamp;
+	xe_spin_end(&data[SPIN_DATA].spin);
+	igt_assert(ts_1 != ts_2);
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
@@ -460,6 +533,9 @@ igt_main
 	igt_subtest("non-blocking")
 		non_block(fd, EWOULDBLOCK);
 
+	igt_subtest("lr-mode-workload")
+		lr_mode_workload(fd);
+
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.39.1

