Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F29FA0C30
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 05:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F60A10E0F5;
	Wed, 15 Apr 2026 05:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FH2GfKy7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF7A10E0F5
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 05:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776232020; x=1807768020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C7hmr1yiF/FP0XT/lgQWm9sOz5+aAqmUi9hjNlZ+Bpc=;
 b=FH2GfKy70En3FpSIxm5sfpha9H6r0fFuTN9CasWTfy2xKWlfz9RzU5K7
 FHLPvzT179fepeqW+z353B3/ysNVGtE0zwc9t1W9mtYfLWPWdJ5LVINBk
 oLSREWZ4hyxkc+d7qVllk828kAfn3y8f5WdhOAgMgmz+irHhfdZqqvrSp
 Ye1VvRlbHZmxclXLFuOXe5MLVIdk77RZ6QOPqggAGN2tWNvYISO8tVqo3
 bEt7cQ+57kfSc3eYY6OIL7MhnJ/IsBDajaUdHbC8CJcwsg8bPfT7hYxyg
 oqgYNVofgLlM39CjT3XGSACxPuaWVVn06wzLECtz8pGq1o+oVHqTpFuPg g==;
X-CSE-ConnectionGUID: U55q7ZcxQfivsLANgpdXBQ==
X-CSE-MsgGUID: f6BnhaKVT3ylJMPfNmZCww==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99842545"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="99842545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 22:47:00 -0700
X-CSE-ConnectionGUID: yDfxMHccQ0qY5+89VJU8Zg==
X-CSE-MsgGUID: lOaz+yFTQsK7sBJyDV3hyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="223810098"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2026 22:46:58 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_configfs: Fix ctx-restore subtests register
Date: Wed, 15 Apr 2026 11:51:38 +0530
Message-ID: <20260415062137.745993-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

The ctx-restore-post-bb and ctx-restore-mid-bb subtests fail due to
two independent issues:

1. Register not suitable for software use: The test uses GEN7_GT_SCRATCH
   (0x4f100/0x4f104), which per BSpec is reserved for hardware use and
   must not be used by software. Readback may not return the expected
   value.

2. No render engine on XPC/HPC platforms: The test uses "rcs" (render
   engine class), but XPC platforms like CRI (Xe3p_XPC) and HPC
   platforms like PVC (Xe_HPC) have no Render Command Streamer. The BB
   is stored via configfs but never injected into any engine's LRC.

Fix by:
- Replacing GEN7_GT_SCRATCH with CCS0 CS_GPR3/GPR4 (0x1a618/0x1a620),
  MI_MATH scratch registers safe for software use. LRI writes go
  through global MMIO space, so rcs engine can write to CCS0 register
  addresses.
- Adding igt_require_f(has_rcs) to skip ctx-restore subtests on
  platforms without a render engine instead of failing silently.

Bspec: 53105, 60309

Fixes: b6abdc26e01b ("tests/intel/xe_configfs: Check ctx_restore_post_bb")
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 tests/intel/xe_configfs.c | 46 ++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 755524e7c..1447edf2b 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -276,35 +276,35 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
 		 * previous execution set a specific value in the HW
 		 */
 		{ .test = "cmd-single",
-		  .in = "rcs cmd 11000001 4F100 DEA0BEE0",
-		  .out = "rcs: 11000001 0004f100 dea0bee0\n",
-		  .reg = { 0x4f100 },
+		  .in = "rcs cmd 11000001 1A618 DEA0BEE0",
+		  .out = "rcs: 11000001 0001a618 dea0bee0\n",
+		  .reg = { 0x1a618 },
 		  .reg_val = { 0xdea0bee0 },
 		},
 		{ .test = "cmd-single-multi-values",
-		  .in = "rcs cmd 11000003 4F100 DEA1BEE1 4F104 DEA2BEE2",
-		  .out = "rcs: 11000003 0004f100 dea1bee1 0004f104 dea2bee2\n",
-		  .reg = { 0x4f100, 0x4f104 },
+		  .in = "rcs cmd 11000003 1A618 DEA1BEE1 1A620 DEA2BEE2",
+		  .out = "rcs: 11000003 0001a618 dea1bee1 0001a620 dea2bee2\n",
+		  .reg = { 0x1a618, 0x1a620 },
 		  .reg_val = { 0xdea1bee1, 0xdea2bee2 },
 		},
 		{ .test = "cmd-multi",
-		  .in = "rcs cmd 11000001 4F100 DEA3BEE3\n"
-			"rcs cmd 11000001 4F104 DEA4BEE4",
-		  .out = "rcs: 11000001 0004f100 dea3bee3 11000001 0004f104 dea4bee4\n",
-		  .reg = { 0x4f100, 0x4f104 },
+		  .in = "rcs cmd 11000001 1A618 DEA3BEE3\n"
+			"rcs cmd 11000001 1A620 DEA4BEE4",
+		  .out = "rcs: 11000001 0001a618 dea3bee3 11000001 0001a620 dea4bee4\n",
+		  .reg = { 0x1a618, 0x1a620 },
 		  .reg_val = { 0xdea3bee3, 0xdea4bee4 },
 		},
 		{ .test = "reg-single",
-		  .in = "rcs reg 4F100 DEA5BEE5",
-		  .out = "rcs: 11000001 0004f100 dea5bee5\n",
-		  .reg = { 0x4f100 },
+		  .in = "rcs reg 1A618 DEA5BEE5",
+		  .out = "rcs: 11000001 0001a618 dea5bee5\n",
+		  .reg = { 0x1a618 },
 		  .reg_val = { 0xdea5bee5 },
 		},
 		{ .test = "reg-multi",
-		  .in = "rcs reg 4F100 DEA6BEE6\n"
-			"rcs reg 4F104 DEA7BEE7",
-		  .out = "rcs: 11000001 0004f100 dea6bee6 11000001 0004f104 dea7bee7\n",
-		  .reg = { 0x4f100, 0x4f104 },
+		  .in = "rcs reg 1A618 DEA6BEE6\n"
+			"rcs reg 1A620 DEA7BEE7",
+		  .out = "rcs: 11000001 0001a618 dea6bee6 11000001 0001a620 dea7bee7\n",
+		  .reg = { 0x1a618, 0x1a620 },
 		  .reg_val = { 0xdea6bee6, 0xdea7bee7 },
 		},
 	};
@@ -364,12 +364,22 @@ int igt_main()
 	int fd, configfs_fd, configfs_device_fd;
 	uint32_t devid;
 	bool is_vf_device;
+	bool has_rcs = false;
 
 	igt_fixture() {
+		struct drm_xe_engine_class_instance *hwe;
+
 		fd = drm_open_driver(DRIVER_XE);
 		devid = intel_get_drm_devid(fd);
 		is_vf_device = intel_is_vf_device(fd);
 		set_bus_addr(fd);
+
+		xe_for_each_engine(fd, hwe)
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
+				has_rcs = true;
+				break;
+			}
+
 		drm_close_driver(fd);
 
 		configfs_fd = igt_configfs_open("xe");
@@ -418,6 +428,7 @@ int igt_main()
 	igt_describe("Validate ctx_restore_post_bb");
 	igt_subtest("ctx-restore-post-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
+		igt_require_f(has_rcs, "Platform has no render engine\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "post");
 		close_configfs_group(configfs_fd, configfs_device_fd);
@@ -434,6 +445,7 @@ int igt_main()
 	igt_describe("Validate ctx_restore_mid_bb");
 	igt_subtest("ctx-restore-mid-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
+		igt_require_f(has_rcs, "Platform has no render engine\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "mid");
 		close_configfs_group(configfs_fd, configfs_device_fd);
-- 
2.50.1

