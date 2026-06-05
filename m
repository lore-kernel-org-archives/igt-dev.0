Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222E6CD6E7D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B104E11A90F;
	Fri,  5 Jun 2026 14:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsBCdQm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D2911A90F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670420; x=1812206420;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LgMo3kudSUiMDTRmJTFvnxYeoZ+lfgn3l5BFRKcKqeA=;
 b=BsBCdQm0CHM2AE2ntVsJw87EK8F+TF0aIOFxaITp595nxCnqTDwOWiBb
 ftHuIDQziURih3YQAtS8SSPFo0HHsOv1AUfP4Q9HnC/jBzvLuRMn2i3vM
 OSROzfdxbOTSuQW+qtt/HiLWMs+P8pRNSjFBcQs99944zTD4FGeiC+017
 cp0/7Zya0BVBO50xlN/7JnxwIJRjc4KeiHFv8Jsn0QghGNyHfKboOTUFE
 2IogTk/brvPvuO4EWgsXRtHWdwloYPpJqFa+HxecMzEzUYtFK7Arg5N0F
 aqhrrE16165Rc5V86W9DAbOFXG3g9Txpm+uRF8YqWXhBx7J7rXKQIVpDv Q==;
X-CSE-ConnectionGUID: 3cJ+GP7lSOWeiW51wacSPQ==
X-CSE-MsgGUID: xMcsrj9aQ7yW6/oX5utysA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81483819"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81483819"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:39:59 -0700
X-CSE-ConnectionGUID: G/3Mdu+oRaOshYJJEMFWMw==
X-CSE-MsgGUID: siTz+Xx8RI6qYsy89Pk9VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242384383"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 07:39:57 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t v1 3/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-memory-pressure subtest
Date: Fri,  5 Jun 2026 14:39:47 +0000
Message-ID: <20260605143953.1122688-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605143953.1122688-1-nishit.sharma@intel.com>
References: <20260605143953.1122688-1-nishit.sharma@intel.com>
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

Add memory-pressure coverage for the GT reset stress harness. This extends
concurrent reset+submission testing to include BO memory pressure while
preserving default behavior for existing subtests.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 8e8e4e27d..7507d65e0 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -28,6 +28,7 @@
 
 #define SYNC_OBJ_SIGNALED	(0x1 << 0)
 #define LEGACY_MODE_ADDR	0x1a0000
+#define PRESSURE_COUNT		32
 
 /**
  * SUBTEST: spin
@@ -127,6 +128,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define MULTI_QUEUE			(0x1 << 14)
 #define SECONDARY_QUEUE			(0x1 << 15)
 #define RESET_SYNC_MODE			(0x1 << 16)
+#define MEM_PRESSURE_STRESS		(0x1 << 17)
 
 /**
  * SUBTEST: %s-cat-error
@@ -611,6 +613,30 @@ struct gt_thread_data {
 	bool do_reset;
 };
 
+static void pressure_bo_create(int fd, uint32_t vm, int gt,
+			       uint32_t *bos, int *count)
+{
+	int i;
+
+	*count = 0;
+	for (i = 0; i < PRESSURE_COUNT; i++) {
+		bos[i] = xe_bo_create(fd, vm, xe_bb_size(fd, SZ_2M),
+				      vram_if_possible(fd, gt),
+				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		if (!bos[i])
+			break;
+		(*count)++;
+	}
+}
+
+static void pressure_bo_destroy(int fd, uint32_t *bos, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		gem_close(fd, bos[i]);
+}
+
 static void do_resets(struct gt_thread_data *t)
 {
 	while (!*(t->exit)) {
@@ -630,7 +656,10 @@ static void submit_jobs(struct gt_thread_data *t)
 	uint64_t addr = 0x1a0000;
 	size_t bo_size = xe_bb_size(fd, SZ_4K);
 	uint32_t bo;
+	uint32_t pressure_bos[PRESSURE_COUNT];
 	uint32_t *data;
+	int pressure_count;
+	int i = 0;
 
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, t->gt),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -639,6 +668,9 @@ static void submit_jobs(struct gt_thread_data *t)
 
 	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
 
+	if (t->flags & MEM_PRESSURE_STRESS)
+		pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
+
 	while (!*(t->exit)) {
 		struct drm_xe_engine_class_instance instance = {
 			.engine_class = DRM_XE_ENGINE_CLASS_COPY,
@@ -661,8 +693,19 @@ static void submit_jobs(struct gt_thread_data *t)
 		xe_exec(fd, &exec);
 		xe_exec_queue_destroy(fd, exec.exec_queue_id);
 		(*t->num_submit)++;
+
+		if ((t->flags & MEM_PRESSURE_STRESS) && !(i % 128)) {
+			pressure_bo_destroy(fd, pressure_bos, pressure_count);
+			pressure_count = 0;
+			pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
+		}
+
+		i++;
 	}
 
+	if (t->flags & MEM_PRESSURE_STRESS)
+		pressure_bo_destroy(fd, pressure_bos, PRESSURE_COUNT);
+
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 	xe_vm_destroy(fd, vm);
@@ -698,6 +741,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions with sync resets
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-memory-pressure
+ * Description: Stress concurrent GT resets and job submissions under memory pressure
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -913,6 +960,7 @@ int igt_main()
 	const struct section ssections[] = {
 		{ "reset-concurrent-submit", 0 },
 		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
+		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

