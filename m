Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C89C021A4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 15:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6861B10EB0B;
	Thu, 13 Feb 2025 15:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVJtXqHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F1510EB0C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 15:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739460312; x=1770996312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZThxURPC415zWj+RLVoUQGVYCOify2C9xXP1F9NVu/c=;
 b=PVJtXqHUbSg1H2msKHoAma07H5TgGtgALcf4Tf2ZMcM8VznF9/UhvzO+
 99ZQRUza2glPMmP8mAh7Chm2WkyF3WUYIMtS70NQWXvnkG80oVfPah7CT
 IRRPNidAOiehfAdJ0lichdErX01qSdQwsywPJEXMTWB8U2LpOyJdsgqCe
 xpn/rWEbv1mG6FkKyeYS2ZiPzWF7cvNuJ9E0RyqP4oijP2n5IaEKtFR9T
 IFpSEwIe/hKBvdbA09GxfFcq5P3sKoF6N4UyKxSLcL2/qjE6NXhPoWfgZ
 /VN0pVYDHykf0qBp8zOnITXUelSKVy/yfK6IPC8auOre2aaV9lzJLIPGK A==;
X-CSE-ConnectionGUID: o82RgZuiST+3d0vS7R9yPw==
X-CSE-MsgGUID: vbAbN80TTs61fpEQnrbm+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57572638"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="57572638"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:25:11 -0800
X-CSE-ConnectionGUID: fiSG1sMvSMa4+IdrIMXYWw==
X-CSE-MsgGUID: dXg2oT7wSXufCdFeEnZ/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144120266"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:25:10 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 4/4] tests/intel/xe_exec_fault_mode: Test scratch page under
 fault mode
Date: Thu, 13 Feb 2025 10:40:48 -0500
Message-Id: <20250213154048.273437-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250213154048.273437-1-oak.zeng@intel.com>
References: <20250213154048.273437-1-oak.zeng@intel.com>
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 63 ++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index ae40e099b..061e2cb6b 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -17,6 +17,7 @@
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
+#include "lib/xe/xe_util.h"
 #include "xe_drm.h"
 
 #include "xe/xe_ioctl.h"
@@ -36,6 +37,60 @@
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
+	struct xe_buffer cmd_buf = {
+		.fd = fd,
+		.size = bb_size,
+		.gpu_addr = 0x10a0000,
+		.placement = vram_if_possible(fd, eci->gt_id),
+		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+	};
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE , 0);
+
+	dst_buf.vm = vm;
+	cmd_buf.vm = vm;
+	/* Submit a command to write 0x1a0000
+	 * Since 0x1a0000 is mapped scratch page, cmd execution should still
+	 * be successful. Write is either be dropped by HW (NULL PTE case) or
+	 * written to scratch page.
+	 */
+	xe_create_cmdbuf(&cmd_buf, insert_store, dst_buf.gpu_addr, 0xc0ffee, eci);
+	xe_submit_cmd(&cmd_buf);
+
+	/* Create a buffer object, vm_bind it to 0x1a0000, then re-submit
+	 * the command buffer. This should write to the buffer object.
+	 * Check the buffer object to see if the write was successful.
+	 */
+	xe_create_buffer(&dst_buf);
+	xe_submit_cmd(&cmd_buf);
+	igt_assert_eq(*(uint64_t *)dst_buf.cpu_addr, 0xc0ffee);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	xe_destroy_buffer(&dst_buf);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: invalid-va
  * Description: Access invalid va and check for EIO through user fence.
@@ -458,6 +513,7 @@ igt_main
 		{ NULL },
 	};
 	int fd;
+	uint32_t dev_id;
 
 	igt_fixture {
 		struct timespec tv = {};
@@ -466,6 +522,7 @@ igt_main
 		int timeout = igt_run_in_simulation() ? 20 : 2;
 
 		fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(fd);
 		do {
 			if (ret)
 				usleep(5000);
@@ -508,6 +565,12 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
 
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

