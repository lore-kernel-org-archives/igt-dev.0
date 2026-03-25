Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609BF106B51F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 12:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A9910E230;
	Wed, 25 Mar 2026 12:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nygj6Am2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470E410E230
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774442695; x=1805978695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gGC9OEwyy3Uek0kOk0kJ/v4Un/PzAQ5g68M9uD9aweY=;
 b=nygj6Am2bH9cEB+RqBB1eSF30ae/nB3ytPrpmWf1okFnnnAIlOsyMm/n
 Pouyap8/IpTy/itJZ5uKKMh9p7Q//wtdslzYvszuIdPko3md7hdKw2kKP
 AqKk72oQxpWbT4y4nHoXBHJGAh4ajA3/5MTfurKOhy29lYGKyPdz1s3nC
 pEga1uRVzU8SZUGt4x8hf2ayw1qclJVsysiElV+5GPjEfoafQzBMJlRD1
 +RO9aI9AYem53wCWgpBaa6uIHXxmzQB1Jcf8MQfkUcPXkHpgLFuc4evq8
 WTyHqlrKO4okrafHI+UdDg6UzBPZM00iSEc56r/FR5zgyApJWRx2w1fBT g==;
X-CSE-ConnectionGUID: XX4S2VhfSAOnm3QGYoyh2A==
X-CSE-MsgGUID: xE2lbjeATYOgamaurnGsZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86555516"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86555516"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:55 -0700
X-CSE-ConnectionGUID: G3BPyLDSTve6Rfc5ADln1Q==
X-CSE-MsgGUID: j7w/gHS/SGGf0ugCuNEV/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="223876394"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:54 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v6 7/9] tests/intel/xe_madvise: Add dontneed-after-exec
 subtest
Date: Wed, 25 Mar 2026 18:14:21 +0530
Message-ID: <20260325124426.3265234-8-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325124426.3265234-1-arvind.yadav@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
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

This test verifies that memory can be marked purgeable and reclaimed
after successful GPU execution. The test first executes a batch that
writes to a data BO and verifies the result. It then marks the BO as
DONTNEED, triggers memory pressure to purge it, and attempts a second
execution. The second execution may fail or succeed with scratch
rebind, validating that the kernel correctly handles purged BOs in
GPU submissions.

v4:
   - Added proper resource cleanup before calling igt_skip(). (Nishit)
   - Added assertion for xe_bo_map. (Nishit)
   - Now using sync[0] consistently. (Nishit)
   - Added clarifying comment. (Nishit)

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 108 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index d126db9ed..28ea81442 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -16,6 +16,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "lib/igt_syncobj.h"
 
 static bool xe_has_purgeable_support(int fd)
 {
@@ -444,6 +445,107 @@ static void test_dontneed_before_exec(int fd, struct drm_xe_engine_class_instanc
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: dontneed-after-exec
+ * Description: Mark BO as DONTNEED after GPU exec, verify memory becomes inaccessible
+ * Test category: functionality test
+ */
+static void test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
+	uint64_t data_addr = PURGEABLE_ADDR;
+	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
+	size_t data_size = PURGEABLE_BO_SIZE;
+	size_t batch_size = PURGEABLE_BO_SIZE;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = PURGEABLE_FENCE_VAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t *data, *batch;
+	uint32_t syncobj;
+	int b, ret;
+
+	purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo,
+				       &bo, &batch, &data, batch_addr,
+				       data_addr, batch_size, data_size);
+	memset(data, 0, data_size);
+
+	syncobj = syncobj_create(fd, 0);
+
+	/* Prepare batch to write to data BO */
+	b = 0;
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = data_addr;
+	batch[b++] = data_addr >> 32;
+	batch[b++] = 0xfeed0001;
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	/* Use only syncobj for exec (not USER_FENCE) */
+	sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[0].handle = syncobj;
+	exec.num_syncs = 1;
+	exec.syncs = to_user_pointer(&sync[0]);
+
+	ret = __xe_exec(fd, &exec);
+	igt_assert_eq(ret, 0);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	munmap(data, data_size);
+	data = xe_bo_map(fd, bo, data_size);
+	igt_assert(data != MAP_FAILED);
+	igt_assert_eq(data[0], 0xfeed0001);
+
+	if (!purgeable_mark_and_verify_purged(fd, vm, data_addr, data_size)) {
+		munmap(data, data_size);
+		munmap(batch, batch_size);
+		gem_close(fd, bo);
+		gem_close(fd, batch_bo);
+		syncobj_destroy(fd, syncobj);
+		xe_exec_queue_destroy(fd, bind_engine);
+		xe_exec_queue_destroy(fd, exec_queue);
+		xe_vm_destroy(fd, vm);
+		igt_skip("Unable to induce purge on this platform/config");
+	}
+
+	/* Prepare second batch (different value) */
+	b = 0;
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = data_addr;
+	batch[b++] = data_addr >> 32;
+	batch[b++] = 0xfeed0002;
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	/*
+	 * Second exec with purged BO - may succeed (scratch rebind) or fail.
+	 * Either is valid, so don't check results.
+	 */
+	ret = __xe_exec(fd, &exec);
+	if (ret == 0)
+		syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
+
+	munmap(data, data_size);
+	munmap(batch, batch_size);
+	gem_close(fd, bo);
+	gem_close(fd, batch_bo);
+	syncobj_destroy(fd, syncobj);
+	xe_exec_queue_destroy(fd, bind_engine);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -480,6 +582,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("dontneed-after-exec")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_after_exec(fd, hwe);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

