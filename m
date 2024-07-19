Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E873C3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 19:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2336210ECAD;
	Fri, 19 Jul 2024 19:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5kTVcDC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08B010ECAE
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721418023; x=1752954023;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8e82MOYArkpMBzUq6lbMxFX1bqgUhr/yI9HPAz/j9Ek=;
 b=T5kTVcDC/WZJwpTf5XA+1DS7mnPEL5aTTa8aca5sf6Rs1t53y3HCmog5
 2Rki06h3nRyFcVJphz06fa08chhzxIXuZD/JdtYofhrxMtrSbMwZnNnBv
 u4dYejVp/kgwLcO70JhvjUa6rXXYrX6YNk7UC3derqAaXbe4dgpzmPQFM
 n6tuzxYr6larA2qyS+787OPaXnSTQrp5JD8Mtq3WDYnbKl87/8S4obY0u
 Rc85ITtSr9zp1jD0IWDkh2LmA/xVhn+1ttl6LDrd4yviBl+yw0lDU9uz9
 G24bs+fI2P6aR/ZD0sI9ezIrn1khT3GcY+kvkKtFjxLusEfhm2InjcZ5J g==;
X-CSE-ConnectionGUID: cJEYtl3URfCub1JjEQJUow==
X-CSE-MsgGUID: 1zYmNCf1TXGjw9a5qe5AMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29713093"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="29713093"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:40:23 -0700
X-CSE-ConnectionGUID: j6WCh18bS3eBywuUqWbxPQ==
X-CSE-MsgGUID: P6Uy7YbLQ8OQvwr+gQLdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51192323"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:40:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/2] tests/xe/xe_exec_basic: Add section to test zero
 number of BB in exec IOCTL
Date: Fri, 19 Jul 2024 12:41:07 -0700
Message-Id: <20240719194107.1549306-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719194107.1549306-1-matthew.brost@intel.com>
References: <20240719194107.1549306-1-matthew.brost@intel.com>
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

Verify the exec queue ordering works wrt out-sync signaling when zero
number of BB passed to exec IOCTL.

v2;
 - Fix build error

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_basic.c | 108 ++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 0fd1ae062c..02b78d55f6 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -19,6 +19,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 #include <string.h>
 
 #define MAX_N_EXEC_QUEUES 16
@@ -314,6 +315,109 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 }
 
+/**
+ * SUBTEST: zero-execs
+ * Description: Test zero execs in IOCTL
+ * Functionality: exec IOCTL
+ * Run type: BAT
+ */
+
+static void test_zero_execs(int fd, struct drm_xe_engine_class_instance *eci,
+			    int n_execs)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	size_t bo_size;
+	uint32_t bo = 0;
+	uint32_t syncobj;
+	uint32_t exec_queue;
+	struct xe_cork cork;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	xe_cork_init(fd, eci, &cork);
+	xe_cork_wait_started(&cork);
+
+	/* Initial bind behind cork */
+	sync[0].handle = syncobj = syncobj_create(fd, 0);
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = cork.syncobj;
+	sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 2);
+
+	/* Exec behind bind */
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+
+		exec.exec_queue_id = exec_queue;
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+	}
+
+	/* Exec with no batch buffer */
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	exec.num_batch_buffer = 0;
+	exec.address = 0;
+	xe_exec(fd, &exec);
+
+	/* Let jobs runs for a bit */
+	usleep(100000);
+
+	/* both bind and execs are waiting */
+	igt_assert(!syncobj_wait(fd, &syncobj, 1, 0, 0, NULL));
+	igt_assert(!syncobj_wait(fd, &sync[0].handle, 1, 0, 0, NULL));
+
+	/* Release cork */
+	xe_cork_end(&cork);
+	xe_cork_wait_done(&cork);
+	xe_cork_fini(&cork);
+
+	/* both binds are done */
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -383,6 +487,10 @@ igt_main
 				test_exec(fd, hwe, 1, 0, 1, s->flags);
 	}
 
+	igt_subtest("zero-execs")
+		xe_for_each_engine(fd, hwe)
+			test_zero_execs(fd, hwe, 1);
+
 	igt_fixture
 		drm_close_driver(fd);
 
-- 
2.34.1

