Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC9FC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C7910E232;
	Tue, 14 May 2024 07:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qu3NLml+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF2310E232
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670603; x=1747206603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AvRd95QGqypKp1WnvsiIw+c5WjOOLbIsLgUBBhS7t1o=;
 b=Qu3NLml+xJk/kO6PnFNPw8LhqO3czvx/7Rmt+9cYUfJpKzWb4LaGbmgt
 enVFUIBU30BHfhvMN6TFAVZoiry5oXF2vSMTAjhy1j4Ws887Ob/pbtVS+
 t1ek+dhqS9qc8NakshUnUc43BgNEnybnAN2GzfkoD19SNZWN+9li2eUE9
 /q2+9yRgjl6N/p/lAXUk01WRoCSzBuqGgCkh34HKR78h0PQHN3hn7/5nu
 ZVyK3G907ObM+gRTs5We5rY6u7pKoeqGwMQJBTmeEX+VTIGVIqgog6fVa
 0cxYsxK/BAvaUub7GIoAr9uMjyXBlGWD9yQOtcigFK9KdxpuN1haje8Yb A==;
X-CSE-ConnectionGUID: Bz1bIKGbQEWzS7AbtHYw0g==
X-CSE-MsgGUID: yl+mXky8SjWC3jHE/syoxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15473006"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15473006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:10:02 -0700
X-CSE-ConnectionGUID: b++GXoPlSIOp09LJ9yFBKQ==
X-CSE-MsgGUID: xCtSeaocRF2ae2GadBlynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30427681"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:10:02 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v2 02/10] tests/intel/xe_svm: basic xe_svm test
Date: Tue, 14 May 2024 12:40:18 +0530
Message-Id: <20240514071026.748257-3-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
References: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
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
 tests/intel/xe_svm.c | 92 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 tests/intel/xe_svm.c

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
new file mode 100644
index 000000000..7d0892a3d
--- /dev/null
+++ b/tests/intel/xe_svm.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: MIT
+ /*
+  * Copyright © 2024 Intel Corporation
+  */
+
+/** @file xe_svm.c
+ *
+ * Test shared virtual memory.
+ *
+ * Shared virtual memory (svm in short) is a xe driver feature
+ * which provide shared virtual address space b/t CPU and GPU
+ * program. This means application writer can just malloc or mmap,
+ * and use the returned ptr for both CPU and GPU program.
+ */
+
+/**
+ * TEST: xe_basic
+ * Description: Basic test to verify store dword by using helper funtions
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
+ *  Verifies xe basic work load on gpu
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

