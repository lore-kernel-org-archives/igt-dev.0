Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C232E99056
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 08:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A2410E87C;
	Fri, 10 Apr 2026 08:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvSeAnsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E552910E87C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 08:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775809683; x=1807345683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SuwViKHdq1GrRd7bZKvWGbKfbTTv2vV0u+Edy0FRZSE=;
 b=hvSeAnsW1ZP6YuKJHrH6QXmDzLmRDVsZuJfo/5XvIvrOJOpuLF9I/pIq
 3UU1x1MtDUQ28+0CyLjHj1eNpPzb39Cx7x8A0FF2z2vU26Gq1gObNCHqU
 A/ggf9hmJUAEEiH7tMVCh9ziJv3TZd1C0tCGhvwZ92we5EjmRDiWymHPH
 I0ao/tYaIHYy50979PkMTchyqKPbe4m9Q7OXsNk1tS+bH5XA1uiAv0Id7
 2Q1IMqh5INFhoKvwTEZSjvVrtvbvURfbvxnnPuo8EjpVOeMNgNQgcg0vy
 TzAq8DuApuOJGaDyK3rCsfG1jUGZJNy9GNFTK2x+Vd6ZrNXvA0D7OtXvg w==;
X-CSE-ConnectionGUID: l1dU1IaeTMWF1IZT+I6s6Q==
X-CSE-MsgGUID: GON2NBY/TQKxvC4FCqXRFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="64361546"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="64361546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:28:03 -0700
X-CSE-ConnectionGUID: ArhjJsVtSzidsM/Q/RHPJw==
X-CSE-MsgGUID: Z3l9GSa1TQ2UHMIjG0aRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="229301963"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:28:01 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v8 6/8] tests/intel/xe_madvise: Add dontneed-after-exec
 subtest
Date: Fri, 10 Apr 2026 13:57:23 +0530
Message-ID: <20260410082729.2383886-7-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410082729.2383886-1-arvind.yadav@intel.com>
References: <20260410082729.2383886-1-arvind.yadav@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 108 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index b30290f27..18bec198e 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -16,6 +16,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "lib/igt_syncobj.h"
 
 /* Purgeable test constants */
 #define PURGEABLE_ADDR		0x1a0000
@@ -434,6 +435,107 @@ static void test_dontneed_before_exec(int fd, struct drm_xe_engine_class_instanc
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
@@ -470,6 +572,12 @@ int igt_main()
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

