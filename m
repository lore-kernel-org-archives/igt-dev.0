Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD498C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 11:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E1210E042;
	Wed, 16 Jul 2025 11:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9YJd9gX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE1A10E042
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752666760; x=1784202760;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MqVVGSeKDq/dVXZSuUBeyLtoQ9KVvIjSYRAMeetN13E=;
 b=h9YJd9gXSpLkuiw5xNF0n91/rLdmgtQgfSqWOR9EwFjMnj8HsOCpswpt
 UcRC21wSmPm1t4ZMQiA0NBzLRHUwyCeLhX2RVSLgG+lzRnZuET0vJFGG3
 NUUROJSsON1CRzA/SfK6C00pYOcGIrNtFr/lC5mHb8bxGwbJ4bdwQXus4
 L9u5ehlMOveYFeRokMyYshBPKuOSrd/hSa3pR/lEaJ7EqriiO0O0piv49
 QkTocJgAUtKWgTZq/6oYB8rr1v7h9lUucI1h80SCEWkwyZflNoZaEjZit
 Xj31hvgVycb6pTPsqBM4IsPFwbzOZbFLs3GDFYlis2q2IYHXgIt+t7Dax g==;
X-CSE-ConnectionGUID: UInFAP3xQnKbmGBBBHwcJw==
X-CSE-MsgGUID: wEG0/EUpS2OJDFiYayH3eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72480917"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="72480917"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 04:52:39 -0700
X-CSE-ConnectionGUID: Fp56RjMLRa6vlqBgF3AEdA==
X-CSE-MsgGUID: 1C/n0ru5QwCMzW2Ajq9r1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="158035984"
Received: from unknown (HELO priyanka.iind.intel.com) ([10.190.216.153])
 by fmviesa008.fm.intel.com with ESMTP; 16 Jul 2025 04:52:39 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under memory
 pressure
Date: Wed, 16 Jul 2025 17:22:37 +0530
Message-Id: <20250716115237.3279176-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add a test which create buffer objects on an LR vm and vm_binding
buffer objects in a loop until it reaches OOM.
This is to check that buffer objects on a single vm doesnot get evicted
and instead report with ENOMEM in non fault mode.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_vm.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index c1abb08bb..e808a0b4e 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2368,6 +2368,65 @@ static void invalid_vm_id(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
 }
 
+/**
+ * SUBTEST: out-of-memory
+ * Description: Test if vm_bind ioctl results in oom
+ * when creating and vm_binding buffer objects on an LR vm beyond available visible vram size.
+ * Functionality: oom
+ * Test category: functionality test
+ */
+static void test_oom(int fd)
+{
+#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+#define BO_SIZE xe_bb_size(fd, SZ_512M)
+#define MAX_BUFS (int)(xe_visible_vram_size(fd, 0) / BO_SIZE)
+	uint64_t addr = 0x1a0000;
+	uint64_t vm_sync;
+	uint32_t bo[MAX_BUFS + 1];
+	uint32_t *data[MAX_BUFS + 1];
+	uint32_t vm;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	size_t bo_size = BO_SIZE;
+	int total_bufs = MAX_BUFS;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	for (int iter = 0; iter <= total_bufs; iter++) {
+		bo[iter] = xe_bo_create(fd, 0, bo_size,
+					vram_if_possible(fd, 0),
+					DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+		sync[0].addr = to_user_pointer(&vm_sync);
+		if (iter < total_bufs)
+			xe_vm_bind_async(fd, vm, 0, bo[iter], 0,
+					 addr + bo_size * iter, bo_size, sync, 1);
+		else {
+			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo[iter], 0,
+					           addr + bo_size * iter, bo_size,
+						   DRM_XE_VM_BIND_OP_MAP, 0, sync, 1, 0,
+						   DEFAULT_PAT_INDEX, 0), -ENOMEM);
+			break;
+
+		}
+		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+		vm_sync = 0;
+		data[iter] = xe_bo_map(fd, bo[iter], bo_size);
+		memset(data[iter], 0, bo_size);
+	}
+
+	for (int iter = 0; iter < total_bufs; iter++) {
+		sync[0].addr = to_user_pointer(&vm_sync);
+		xe_vm_unbind_async(fd, vm, 0, 0, addr + bo_size * iter, bo_size,
+				   sync, 1);
+		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+		munmap(data[iter], bo_size);
+		gem_close(fd, bo[iter]);
+	}
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -2759,6 +2818,12 @@ igt_main
 	igt_subtest("invalid-vm-id")
 		invalid_vm_id(fd);
 
+	igt_subtest("out-of-memory") {
+		igt_require(xe_has_vram(fd));
+		igt_assert(xe_visible_vram_size(fd, 0));
+		test_oom(fd);
+	}
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1

