Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D909AC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 21:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C70210ED46;
	Fri, 14 Feb 2025 21:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwW+knrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190EF10E37B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 21:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739569421; x=1771105421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9FP/M69AsXHT60kGv8PIdMMFCdKNj6dZ/zJWLqGT26c=;
 b=bwW+knrHHR3MQclfpcrvIgLYGbOV3JVjg3vBlbOgKjZ6opt252n2jN30
 Fm0PWqllAQdkJTQBjpetQx0kwiHh3Gd4qaBa6uag5GF6C/baF4AwlZcHR
 LfoJHPS78RMzzDSZnW28PezWG6xfFgtzGijE1MeGhc9bcP98QRHmTPS8d
 ybNJ5Qq9XTJVni/gfkU9XXefaTr2TXPOR9Gf7V8drrCQ0VVqSbPjui4Ed
 K84gc4VbQpX3pHn66jJRdPN30BHCuRowzWoEt1m0GZjOpebLxg3xX7xaG
 ESTULU8VSBd3itrABMskuWdTpcv8YTqUWJhy4Stv/n8F+9InWp3ve7U0b g==;
X-CSE-ConnectionGUID: gTnjdKwzQrypRoVh2zdJQQ==
X-CSE-MsgGUID: CTSYIi7PS92uHTmns21k1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40449643"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40449643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:43:41 -0800
X-CSE-ConnectionGUID: NbxxkcgLSl6Yc15V3uF41w==
X-CSE-MsgGUID: cl7PuY7zRKu8HlcN3rj4nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144489057"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:43:41 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v2 4/4] tests/intel/xe_exec_fault_mode: Test scratch page
 under fault mode
Date: Fri, 14 Feb 2025 16:59:20 -0500
Message-Id: <20250214215920.282425-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250214215920.282425-1-oak.zeng@intel.com>
References: <20250214215920.282425-1-oak.zeng@intel.com>
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
 tests/intel/xe_exec_fault_mode.c | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index ae40e099b..f0d508f6c 100644
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
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	dst_buf.vm = vm;
+	cmd_buf.vm = vm;
+	/* Submit a command to write 0x1a0000
+	 * Since 0x1a0000 is mapped scratch page, cmd execution should still
+	 * be successful. Write is either be dropped by HW (NULL PTE case) or
+	 * written to scratch page.
+	 */
+	xe_create_cmdbuf(&cmd_buf, xe_insert_store, dst_buf.gpu_addr, 0xc0ffee, eci);
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
@@ -508,6 +565,13 @@ igt_main
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

