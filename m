Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E56C25B7A
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA8810EE84;
	Fri, 17 May 2024 11:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoswZP74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3E810EE84
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946396; x=1747482396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bqW78IHszucBDpKO9rU78bG0iSn2LXFRRzSTR4WZiJI=;
 b=FoswZP74rtcdWmW8/QEnddjFb99bMW3KiK2QdnkO/Xk4OHes1F/5Kozk
 Pu7sfRCR1FW53EQhw3Z4gsDI5O65qj28N/oxlvcPpZ4PbEZC+1dai8/3C
 p+VAjXP1CHnIfr8O83mK2XjuddyeAG/oP9QR+lP0w++dsZv3wA8awVn5g
 1YNbuyJYloXQAtscgIEeCzOo2O7/vaMCQlmj5RX4TqHl58CB8OWqeS9xl
 K/jpk1l90CMY0u+BaR9NhcQrlF9JAuwCl7j9O00bNCjPfD5WSmV5GOEGx
 8DjImIdziU5E8NoZXfYC2y+dPqFtemz/7hBIyrb7Iav4A1tSLMsqMTy5C Q==;
X-CSE-ConnectionGUID: dxFR9BI7Qsmjewfoc7pRdQ==
X-CSE-MsgGUID: itkfOvkISTW883gDwVfZHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29619980"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29619980"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:33 -0700
X-CSE-ConnectionGUID: wyaSdWgMRteUC2pBt/YxFQ==
X-CSE-MsgGUID: QOVQ5lj4TiqmK0Jhkw8dHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977283"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:31 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 02/10] tests/intel/xe_svm: basic xe-basic test
Date: Fri, 17 May 2024 17:16:50 +0530
Message-Id: <20240517114658.810283-3-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
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

Add basic test to validate helper functions introduced in
'lib/xe/xe_util: helper function'. This test writes values
to the destination buffer using GPU (MI_STORE_DWORD_IMM_GEN4).

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 99 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 tests/intel/xe_svm.c

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
new file mode 100644
index 000000000..6302af95b
--- /dev/null
+++ b/tests/intel/xe_svm.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: MIT
+ /*
+  * Copyright © 2024 Intel Corporation
+  */
+
+/** @file xe_svm.c
+ *
+ * Test shared virtual memory.
+ *
+ * Shared virtual memory (SVM) is a xe driver feature
+ * which provide shared virtual address space b/t CPU and GPU
+ * program. This means application writer can just malloc or mmap,
+ * and use the returned ptr for both CPU and GPU program.
+ */
+
+/**
+ * TEST: xe-svm
+ * Description: Test shared virtual memory
+ * Sub-category: Memory management
+ * Functionality: svm
+ *
+ * SUBTEST: xe-basic
+ * Description: Basic test to verify store dword functionality using helper functions
+ */
+
+#include <fcntl.h>
+#include <string.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "lib/xe/xe_util.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+/**
+ *  @brief Verifies basic workload execution on the GPU.
+ *
+ * This function tests writing a value to a GPU buffer using the helper functions
+ * for command submission and buffer management.
+ */
+static void xe_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	uint32_t val = 0xc0ffee;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+
+	struct xe_buffer dst_buf = {
+		.fd = fd,
+		.gpu_addr = (void *)(uintptr_t)gpu_va,
+		.vm = vm,
+		.size = bo_size,
+		.placement = vram_if_possible(fd, eci->gt_id),
+		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+	};
+
+	struct xe_buffer cmd_buf = {
+		.fd = fd,
+		.gpu_addr = (void *)(uintptr_t)gpu_va + bo_size,
+		.vm = vm,
+		.size = bo_size,
+		.placement = vram_if_possible(fd, eci->gt_id),
+		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+	};
+
+	xe_create_buffer(&dst_buf);
+	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst_buf.gpu_addr, val, eci);
+	xe_submit_cmd(&cmd_buf);
+
+	igt_assert_eq(*(uint32_t *)dst_buf.cpu_addr, val);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	xe_destroy_buffer(&dst_buf);
+}
+
+igt_main
+{
+	int fd;
+	uint32_t vm;
+	struct drm_xe_engine_class_instance *hwe;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(xe_supports_faults(fd));
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	}
+
+	igt_subtest_f("xe-basic")
+		xe_for_each_engine(fd, hwe)
+			xe_basic(fd, vm, hwe);
+
+	igt_fixture {
+		xe_vm_destroy(fd, vm);
+		drm_close_driver(fd);
+	}
+}
+
diff --git a/tests/meson.build b/tests/meson.build
index 758ae090c..be792a4fd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -314,6 +314,7 @@ intel_xe_progs = [
 	'xe_vm',
 	'xe_waitfence',
 	'xe_spin_batch',
+	'xe_svm',
 	'xe_sysfs_defaults',
 	'xe_sysfs_scheduler',
 ]
-- 
2.25.1

