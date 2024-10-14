Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D780AD1A45F
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 15:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857A010E48F;
	Mon, 14 Oct 2024 15:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/J1xduw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7994010E47A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728918047; x=1760454047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Eib4DWD8QMI4tV80MqXF5e8exzIkJBs0cArb00uHlFM=;
 b=X/J1xduwh2gTKC/jbjx5oFUtJLg9GfxRC2pntxtBCfNVykbVKCH38mIH
 nUFOdT4+AGgPcV48BidXvn5jqdoK8LbSNrj8Hpmx5ZMX2vF5h2khr7y6Q
 VcwfYZ5XEg4gjM/Ja1uOZL1ye9CF7+864YHDKykh5Iw54RqMDmCPFGVBC
 O9bEKaeVm4ldw6Kwk2Si7BuZVyhUosYGsAgyRTJPhXfO+nC1670el2Q/H
 LJ6EEgrwtDRyPfpWlM6Te2s8vH4UKdQyIrh/Z4Tk19Yxq6pWsSTQAfe4H
 +a9AEfLbuKOH/Os81appJs/3BNslj0hAG9XDr37/HMSkjsw82veQvBbNt Q==;
X-CSE-ConnectionGUID: cEjt/RLeSgGeJi13DCMPqA==
X-CSE-MsgGUID: +Up+0IT0RzOxmUHZ7uQGJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28154034"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28154034"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 08:00:47 -0700
X-CSE-ConnectionGUID: zeLKYPvGSCuztAU5eMpwSg==
X-CSE-MsgGUID: aqfQ4QWdScKMXoW/DR/dtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77258203"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 08:00:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_vm: Test vm bind fails with invalid
 ufence
Date: Mon, 14 Oct 2024 16:18:39 +0200
Message-ID: <20241014141839.1618518-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Bind ioctl accepts user addr for ufence which could be bogus.
Add a test to make sure such calls fails.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_vm.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7a8740b69..234b3f98a 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -336,6 +336,54 @@ static void unbind_all(int fd, int n_vmas)
 }
 
 #define	MAP_ADDRESS	0x00007fadeadbe000
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+
+/**
+ * SUBTEST: bind-invalid-ufence
+ * Description:
+ *	Verifies that binding with invalid ufence addr is rejected.
+ * Functionality: userptr
+ * Test category: negative test
+ */
+static void invalid_ufence(int fd)
+{
+	size_t size = xe_get_default_alignment(fd);
+	uint32_t vm;
+	int64_t fence_timeout;
+	void *data, *unmapped_addr;
+	struct drm_xe_sync sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE
+		}
+	};
+	int ret;
+
+	fence_timeout = (igt_run_in_simulation() ? 100 : 1) * NSEC_PER_SEC;
+	data = mmap((void *)MAP_ADDRESS, size, PROT_READ |
+		    PROT_WRITE, MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(data != MAP_FAILED);
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	unmapped_addr = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	igt_assert(unmapped_addr != MAP_FAILED);
+	munmap(unmapped_addr, size);
+
+	sync[0].addr = to_user_pointer(unmapped_addr);
+	ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), MAP_ADDRESS,
+			   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, sync, 1, 0,
+			   DEFAULT_PAT_INDEX, 0);
+	igt_assert(ret == -EFAULT);
+
+	sync[0].addr = to_user_pointer(data);
+	xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), 0x40000, size, sync, 1);
+
+	xe_wait_ufence(fd, data, USER_FENCE_VALUE, 0, fence_timeout);
+
+	xe_vm_destroy(fd, vm);
+}
 
 /**
  * SUBTEST: userptr-invalid
@@ -2373,6 +2421,9 @@ igt_main
 	igt_subtest("userptr-invalid")
 		userptr_invalid(fd);
 
+	igt_subtest("bind-invalid-ufence")
+		invalid_ufence(fd);
+
 	igt_subtest("bind-flag-invalid")
 		bind_flag_invalid(fd);
 
-- 
2.46.0

