Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCB8C87FC9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 05:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D98910E1C3;
	Tue, 29 Jul 2025 05:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKuigQsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B912F10E1C3
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jul 2025 05:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753765879; x=1785301879;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Vfjy1dAKnkVqyhgyOPcT4KUkTkR5KoTyOp3RMhkI2M=;
 b=GKuigQsSQXBLp3v5bKd5rYzkoN0QkLQMYhqYc59NU39OLGm8Hv8+9gG1
 eR7JbN+aiOUVKMJ55JwNWcHNKzMaNxLdZTrniN5sVKWPmFKlDUDqGgjod
 6+4q1k8qK8OKmDzRjhes9aasCnE/ICZJPc0vqdwQw2gQ1mPPhnRT6e5v0
 Qi8zgHQdHBq+PkSZJ/OGQSu3ijnj7J8hn1sNppG1x0zaN/0/6dJm7n3i1
 Y1/B5h+hZV5UkBpkK2n1ROihvJpdbqhQ1tnx/bCjIy448AZ+iPW35JbIf
 ejKmCOuabfNVjzCE4mRzx2dB77jZF5q4Pnqj7tx4B8kXKEMBEjC0fe/VN A==;
X-CSE-ConnectionGUID: YqHyVgXmRuKdrBTrBx6CYQ==
X-CSE-MsgGUID: OAdDVRyXS1yfLFavI89yBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55233151"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55233151"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 22:11:19 -0700
X-CSE-ConnectionGUID: Q+am3xhoQk2+2s3+vHeqQw==
X-CSE-MsgGUID: h2w5ftruQIeO6dTkhTFxQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162945451"
Received: from unknown (HELO priyanka.iind.intel.com) ([10.190.216.153])
 by fmviesa009.fm.intel.com with ESMTP; 28 Jul 2025 22:11:18 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, thomas.hellstrom@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under memory
 pressure
Date: Tue, 29 Jul 2025 10:41:17 +0530
Message-Id: <20250729051117.3322590-1-priyanka.dandamudi@intel.com>
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
and instead report with ENOMEM or ENOSPC in non fault mode.

v2: When vm_bind fails with oom even before the memory allocation goes
beyond visible vram size. Test should still pass when VRAM is smaller than
expected may be due to leaked VRAM memory with a warning.
VM bind error could be ENOMEM or ENOSPC for oom. VM bind should happen
atleast once for sanity check purpose. Modified code to handle
these changes.

Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_vm.c | 89 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index c1abb08bb..0c08b583d 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2368,6 +2368,89 @@ static void invalid_vm_id(int fd)
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
+	int bind_vm = 0;
+	bool oom = false;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	for (int iter = 0; iter <= total_bufs; iter++) {
+		int err = 0;
+		bo[iter] = xe_bo_create(fd, 0, bo_size,
+					vram_if_possible(fd, 0),
+					DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+		sync[0].addr = to_user_pointer(&vm_sync);
+		err = __xe_vm_bind(fd, vm, 0, bo[iter], 0,
+				   addr + bo_size * iter, bo_size,
+				   DRM_XE_VM_BIND_OP_MAP, 0, sync,
+				   1, 0, DEFAULT_PAT_INDEX, 0);
+
+		if (err) {
+			if (err == -ENOMEM || err == -ENOSPC) {
+				oom = true;
+				break;
+			}
+			else
+				igt_assert_f(err, "Unexpected error %d for vm bind\n",
+					     err);
+		}
+		else
+			bind_vm = bind_vm + 1;
+
+		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+		vm_sync = 0;
+		data[iter] = xe_bo_map(fd, bo[iter], bo_size);
+		memset(data[iter], 0, bo_size);
+	}
+
+	igt_assert_f(oom, "OOM scenario is not working as expected\n");
+
+	if (bind_vm < total_bufs - 1) {
+		for (int iter = 0; iter < bind_vm; iter++) {
+			sync[0].addr = to_user_pointer(&vm_sync);
+			xe_vm_unbind_async(fd, vm, 0, 0, addr + bo_size * iter, bo_size,
+					   sync, 1);
+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+			munmap(data[iter], bo_size);
+			gem_close(fd, bo[iter]);
+		}
+		igt_warn("VRAM was smaller than estimated, may due to leaked VRAM memory\n");
+	}
+	else {
+		for (int iter = 0; iter < total_bufs; iter++) {
+			sync[0].addr = to_user_pointer(&vm_sync);
+			xe_vm_unbind_async(fd, vm, 0, 0, addr + bo_size * iter, bo_size,
+					   sync, 1);
+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+			munmap(data[iter], bo_size);
+			gem_close(fd, bo[iter]);
+		}
+	}
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -2759,6 +2842,12 @@ igt_main
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

