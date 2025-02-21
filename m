Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBB7C021B2
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 00:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43AC10E9F9;
	Fri, 21 Feb 2025 00:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sxe3kO6G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2481F10E9FC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 00:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740097576; x=1771633576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rmTDwGALo/0DvM6O8accd+UEx0Ln5/w/4yRJpPdAEWY=;
 b=Sxe3kO6GLGZzoGLUrTU7Dsig4rf0eV0o6u8vTntzzc0JhlDnYLanerI6
 5eiKMsaHyZLvZroiKBZxcVzyYkWW1nj5l3d705fPAs39xwdBAWc1YQgDx
 uPlhCZWgXULAuWSYVmf5Mklwqu4U2xk7xMm1dDel905uD65KH89U2B8CQ
 uDrYkp6bY3g8GNIGWl9/COIOl/1OQbmtHFOwwTcv2XHDT8AEUg7Hb1ymk
 ErCJptkMQj+OcXOM/RICnEr2f9CLmwPCoA7k5uOpqKYeMVCcbUSlD3TEL
 KlHFm3hsyVgglbvGQu1ZJuAue86YNxEVCBiy9wbnUbpoi3Ju+0Sg3kpkd Q==;
X-CSE-ConnectionGUID: qMTWbADDQ3uz/z7FzXOnKg==
X-CSE-MsgGUID: 6FVTX+jyRqSMqeJL20vprw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44548845"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="44548845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:26:16 -0800
X-CSE-ConnectionGUID: RUHfq5sERcuedRWXC6ak+g==
X-CSE-MsgGUID: IYHHJOZtTR+CnKbXgND2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115408295"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:26:15 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v4 4/4] tests/intel/xe_exec_fault_mode: Test scratch page
 under fault mode
Date: Thu, 20 Feb 2025 19:42:02 -0500
Message-Id: <20250221004202.369505-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250221004202.369505-1-oak.zeng@intel.com>
References: <20250221004202.369505-1-oak.zeng@intel.com>
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
---
 tests/intel/xe_exec_fault_mode.c | 69 ++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index ae40e099b..7e1bdca01 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -17,6 +17,7 @@
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
+#include "lib/xe/xe_util.h"
 #include "xe_drm.h"
 
 #include "xe/xe_ioctl.h"
@@ -36,6 +37,65 @@
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
+	struct xe_buf dst_buf = {
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
+	xe_create_cmdbuf(&cmdbuf, eci);
+	xe_fill_cmdbuf(&cmdbuf, xe_cmdbuf_insert_store,
+		       dst_buf.gpu_addr, 0xc0ffee);
+	xe_close_cmdbuf(&cmdbuf);
+	xe_submit_cmd(&cmdbuf);
+
+	/* Create a buffer object, vm_bind it to 0x1a0000, then re-submit
+	 * the command buffer. This should write to the buffer object.
+	 * Check the buffer object to see if the write was successful.
+	 */
+	xe_create_buffer(&dst_buf);
+	xe_submit_cmd(&cmdbuf);
+	igt_assert_eq(*(uint64_t *)dst_buf.cpu_addr, 0xc0ffee);
+
+	xe_destroy_cmdbuf(&cmdbuf);
+	xe_destroy_buffer(&dst_buf);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: invalid-va
  * Description: Access invalid va and check for EIO through user fence.
@@ -458,6 +518,7 @@ igt_main
 		{ NULL },
 	};
 	int fd;
+	uint32_t dev_id;
 
 	igt_fixture {
 		struct timespec tv = {};
@@ -466,6 +527,7 @@ igt_main
 		int timeout = igt_run_in_simulation() ? 20 : 2;
 
 		fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(fd);
 		do {
 			if (ret)
 				usleep(5000);
@@ -508,6 +570,13 @@ igt_main
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

