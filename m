Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E07C36000
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 22:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0255A10E276;
	Wed, 19 Mar 2025 22:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNXuK/sR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F7610E25D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742423159; x=1773959159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4MO35GGhzaZ92gIMGJfYczwOUAlLWi1HJeaPmLbdsuM=;
 b=FNXuK/sRhsPzxIFx7QLmvWwyyYPEyJBssM6t88oskrgGF1WUXwxmgj5n
 p+J8p3tVf38pFxIVK7sN7R8vHyDnEAwFE8JLzctV4olh99iB2czq40qFF
 sPA+MpBU7FPMSleV/EsfFP/QqeUpRl0w+rjd5GhQqotDYIm3E3+4y+tZt
 EYlomsF6JMFQpWxfgO8UqqxGbvk/vlq2+Smu3iHVq403DXmWd+DwGwyUB
 XX4CFVnOC/lM4se1gqpsAvHIZidLtVE8L4ZfV1jF82BOOKXYW0JA3dEHP
 CS8YS0AqU+BXqqMvlAS8kfo3a9N8cE5wCAgHaSN4N2ASSLaR3MlwVR2kU A==;
X-CSE-ConnectionGUID: 038Y8NH7T9CY6Q7cec7nMg==
X-CSE-MsgGUID: SHRVasyiQxCPLzDzrn9+pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43510776"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43510776"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:58 -0700
X-CSE-ConnectionGUID: LWSw03eVSPa/lVH+dxvsgQ==
X-CSE-MsgGUID: VPPq/AM7S/eKo1tiO91Lmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122540403"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:59 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, matthew.brost@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Subject: [i-g-t v7 3/4] tests/intel/xe_exec_fault_mode: Test scratch page
 under fault mode
Date: Wed, 19 Mar 2025 18:42:30 -0400
Message-Id: <20250319224231.1909393-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250319224231.1909393-1-oak.zeng@intel.com>
References: <20250319224231.1909393-1-oak.zeng@intel.com>
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

On certain HW (such as lunarlake and battlemage), driver now allows
scratch page be enabled under fault mode. Test this functionality

v1: Move the test to separate function.
    Write to scratch page before rebind (Matt)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index ae40e099b..6cc27102a 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -17,6 +17,7 @@
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
+#include "lib/xe/xe_util.h"
 #include "xe_drm.h"
 
 #include "xe/xe_ioctl.h"
@@ -36,6 +37,64 @@
 #define INVALID_VA	(0x1 << 8)
 #define ENABLE_SCRATCH  (0x1 << 9)
 
+
+/**
+ * SUBTEST: scratch-fault
+ * Description: Test scratch page functionality
+ * Test category: functionality test
+ */
+static void test_scratch(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	size_t bb_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+	uint32_t vm;
+
+	struct xe_buffer dst_buf = {
+		.fd = fd,
+		.size = bb_size,
+		.gpu_addr = 0x1a0000,
+		.placement = vram_if_possible(fd, eci->gt_id),
+		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+	};
+
+	struct xe_cmdbuf cmdbuf = {
+		.buf = {
+			.fd = fd,
+			.gpu_addr = 0x10a0000,
+			.placement = vram_if_possible(fd, eci->gt_id),
+			.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		},
+		.cmd_size = bb_size,
+	};
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	dst_buf.vm = vm;
+	cmdbuf.buf.vm = vm;
+	/* Submit a command to write 0x1a0000
+	 * Since 0x1a0000 is mapped scratch page, cmd execution should still
+	 * be successful. Write is either be dropped by HW (NULL PTE case) or
+	 * written to scratch page.
+	 */
+	xe_cmdbuf_create(&cmdbuf, eci);
+	xe_cmdbuf_insert_store(&cmdbuf, dst_buf.gpu_addr, 0xc0ffee);
+	xe_cmdbuf_insert_bbe(&cmdbuf);
+	xe_cmdbuf_submit(&cmdbuf);
+
+	/* Create a buffer object, vm_bind it to 0x1a0000, then re-submit
+	 * the command buffer. This should write to the buffer object.
+	 * Check the buffer object to see if the write was successful.
+	 */
+	xe_buffer_create(&dst_buf);
+	xe_cmdbuf_submit(&cmdbuf);
+	igt_assert_eq(*(uint64_t *)dst_buf.cpu_addr, 0xc0ffee);
+
+	xe_cmdbuf_destroy(&cmdbuf);
+	xe_buffer_destroy(&dst_buf);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: invalid-va
  * Description: Access invalid va and check for EIO through user fence.
@@ -458,6 +517,7 @@ igt_main
 		{ NULL },
 	};
 	int fd;
+	uint32_t dev_id;
 
 	igt_fixture {
 		struct timespec tv = {};
@@ -466,6 +526,7 @@ igt_main
 		int timeout = igt_run_in_simulation() ? 20 : 2;
 
 		fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(fd);
 		do {
 			if (ret)
 				usleep(5000);
@@ -508,6 +569,13 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
 
+	igt_describe("Check if scratch page works under fault mode");
+	igt_subtest("scratch-fault") {
+		igt_skip_on(!IS_LUNARLAKE(dev_id) && !IS_BATTLEMAGE(dev_id));
+		xe_for_each_engine(fd, hwe)
+			test_scratch(fd, hwe);
+	}
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.26.3

