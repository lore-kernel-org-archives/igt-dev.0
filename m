Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA04EC19F4F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 18:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741F4112E11;
	Tue, 30 Apr 2024 18:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2/999J+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA21E112E11
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 18:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714501652; x=1746037652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xlnyDTt5RBk1j9fmDn0t/KPuOjPuJCaHquch+jiPzuY=;
 b=M2/999J+Umn3RLYZ/zOcHoE7YfToHODNyaba0g5fmt7O/jDF8BQS6d1z
 yngf2lFJ96Nl2+KJXN60Eu50/fWj55kJyPRRwI2xrYa52j2kSu1aB8WOK
 6d4wVkgp9TaC83Bp0GGsOdUTQYTRNzFSYV8jz7UYTvnxmDz3Aj2hUEP+5
 8c7ZWrEvVk0JuRF09werEuW+dHJUgFlewY8zyE6gPaCwh8OowKbb63DPZ
 /futF4wbMbk53gMWIHeX4pgKG3ie/mz2CgaJpm2gPZItycIeV4ZUHRuXY
 j+2PMq8gM115vvb+gnaF2rLUP/DX86r1XQQfSVwpPf1TsrZFt3gZAG9kK A==;
X-CSE-ConnectionGUID: nSktC3ERQgqgrdOHOnAySw==
X-CSE-MsgGUID: gK7nb6FeSBOWxYsP1jzcYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14052101"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="14052101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 11:27:32 -0700
X-CSE-ConnectionGUID: v4psuLMzSkOGBz9QfO5/tQ==
X-CSE-MsgGUID: vMLHNQ56SGylWZ9c/Asq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="57726929"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa001.fm.intel.com with ESMTP; 30 Apr 2024 11:27:30 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH RFC i-g-t 2/2] tests/intel/xe_svm: basic xe_svm test
Date: Tue, 30 Apr 2024 23:57:47 +0530
Message-Id: <20240430182747.589234-3-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
References: <20240430182747.589234-1-krishnaiah.bommu@intel.com>
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
index 000000000..a954861bc
--- /dev/null
+++ b/tests/intel/xe_svm.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: MIT
+ /*
+  * Copyright © 2023 Intel Corporation
+  */
+
+/** @file xe_svm.c
+ *
+ * Test shared virtual memory.
+ *
+ * Shared virtual memory(svm in short) is a xe driver feature
+ * which provide shared virtual address space b/t CPU and GPU
+ * program. This means application writer can just malloc or mmap,
+ * and use the returned ptr for both CPU and GPU program.
+ *
+ * This test the shared virtual memory functions. This includes
+ * basic malloc, mmap test, an invalid va tess, a mprotect test and a
+ * random access test.
+ */
+
+/**
+ * TEST: xe_svm
+ * Description: Test shared virtual memory
+ * Sub-category: Memory management
+ * Functionality: svm
+ * Run type: FULL
+ *
+ * SUBTEST: svm-basic-malloc
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "lib/xe/xe_util.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+/**
+ * Use malloc or mmap memory for direct GPU submission
+ */
+static void svm_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	uint32_t val = 0xc0ffee;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+
+	struct xe_buffer dst_buf = {
+           .fd = fd,
+           .gpu_addr = (uint64_t)gpu_va,
+	   .vm = vm,
+	   .size = bo_size,
+	   .placement = vram_if_possible(fd, eci->gt_id),
+	   .flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+     };
+
+     struct xe_buffer cmd_buf = {
+           .fd = fd,
+           .gpu_addr = (uint64_t)gpu_va + bo_size,
+	   .vm = vm,
+	   .size = bo_size,
+	   .placement = vram_if_possible(fd, eci->gt_id),
+	   .flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+     };
+
+     xe_create_buffer(&dst_buf);
+     xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst_buf.gpu_addr, val, eci);
+     xe_submit_cmd(&cmd_buf);
+     igt_assert_eq(*(uint32_t *)dst_buf.cpu_addr, val);
+     xe_destroy_cmdbuf(&cmd_buf);
+     xe_destroy_buffer(&dst_buf);
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
+	igt_subtest_f("svm-basic-malloc")
+		xe_for_each_engine(fd, hwe)
+			svm_basic(fd, vm, hwe);
+
+	igt_fixture {
+		xe_vm_destroy(fd, vm);
+		drm_close_driver(fd);
+	}
+}
+
diff --git a/tests/meson.build b/tests/meson.build
index 65b8bf23b..6bdd76343 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -316,6 +316,7 @@ intel_xe_progs = [
 	'xe_spin_batch',
 	'xe_sysfs_defaults',
 	'xe_sysfs_scheduler',
+	'xe_svm',
 ]
 
 msm_progs = [
-- 
2.25.1

