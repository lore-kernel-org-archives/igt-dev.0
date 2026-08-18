Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C125C5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 04:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4197410E9D4;
	Tue, 18 Aug 2026 04:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fU44KZlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656D710E4F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 04:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026131; x=1818562131;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JhLkZ69XUdkn6PBmBwxO5/lcUSpDvHmwcxSDQjjU1WI=;
 b=fU44KZlg2EVLBlFkmdmK4hYkkondThcCpZfIQcZiJy6WpnP9+C/bCeXd
 Mhz0vgZotA2IZzl7sFKhlt/EkFbuHH/OziLbtmuPPY6Qh1rj2WvMyIhsW
 qX+UpDkqu+L9U7xGP7SoG4RiMxRAVtZpYzcjaQyVQK1Iu1iEFqVS88xZA
 aqxZR+bQmggtJWQ7Gz1Dm7ZEoOfrV9r6J6kbxJiN71vzbXVsqiK9hW5VO
 fs5oh1/UnxZN35UjYBKwQ6Df7sv/BRNVF+ZPih4ffQdZjqQ/Kf+SEYeX9
 nRRR0cNakIaWaJJAtib1u8cK8dQwfa42xVI8j3WsLBqnaDDVqfZdyJjBf w==;
X-CSE-ConnectionGUID: EitMaS+0TDK1M0OZohKGMg==
X-CSE-MsgGUID: udfo1TaES8W2H5gHUzXzdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870377"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870377"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:08:51 -0700
X-CSE-ConnectionGUID: keRejkDrRpK6aioW6VbQlw==
X-CSE-MsgGUID: IHTD62d8S4CU0L98hVoblw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477272"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 21:08:50 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v2 3/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-memory-pressure subtest
Date: Tue, 18 Aug 2026 04:08:39 +0000
Message-ID: <20260818040845.548727-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818040845.548727-1-nishit.sharma@intel.com>
References: <20260818040845.548727-1-nishit.sharma@intel.com>
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
index 407775cfc..825fc6aa1 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -29,6 +29,7 @@
 
 #define SYNC_OBJ_SIGNALED	(0x1 << 0)
 #define LEGACY_MODE_ADDR	0x1a0000
+#define PRESSURE_COUNT		32
 
 static void ignore_gt_reset_warnings_in_dmesg(void)
 {
@@ -133,6 +134,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define MULTI_QUEUE			(0x1 << 14)
 #define SECONDARY_QUEUE			(0x1 << 15)
 #define RESET_SYNC_MODE			(0x1 << 16)
+#define MEM_PRESSURE_STRESS		(0x1 << 17)
 
 /**
  * SUBTEST: %s-cat-error
@@ -657,6 +659,30 @@ struct gt_thread_data {
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
@@ -676,7 +702,10 @@ static void submit_jobs(struct gt_thread_data *t)
 	uint64_t addr = 0x1a0000;
 	size_t bo_size = xe_bb_size(fd, SZ_4K);
 	uint32_t bo;
+	uint32_t pressure_bos[PRESSURE_COUNT];
 	uint32_t *data;
+	int pressure_count;
+	int i = 0;
 
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, t->gt),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -685,6 +714,9 @@ static void submit_jobs(struct gt_thread_data *t)
 
 	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
 
+	if (t->flags & MEM_PRESSURE_STRESS)
+		pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
+
 	while (!*(t->exit)) {
 		struct drm_xe_engine_class_instance instance = {
 			.engine_class = DRM_XE_ENGINE_CLASS_COPY,
@@ -707,8 +739,19 @@ static void submit_jobs(struct gt_thread_data *t)
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
@@ -744,6 +787,10 @@ static void *gt_reset_thread(void *data)
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
@@ -962,6 +1009,7 @@ int igt_main()
 	const struct section ssections[] = {
 		{ "reset-concurrent-submit", 0 },
 		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
+		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

