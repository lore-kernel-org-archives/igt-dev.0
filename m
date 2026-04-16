Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C7DF8A140
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 07:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A581310E834;
	Thu, 16 Apr 2026 07:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAkaacgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B7910E834
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776326157; x=1807862157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iOC62DB0pnLNMWerdOG49Q9sJME6A/1grn9t5rMQ3YQ=;
 b=QAkaacgUYD8eAPZC7jB4m5H1MEhyRJtsKNozUNzBOLLIlzrHANGrtSVu
 oMSMsFIPmuGrK93+bOl99YmHpAlWLzuKC+eWGSdS3qTBgOBzrn3GbHlaf
 7XHBHjqvJ2VUDywebjN3Y2HXVcUigQ1PIRXAV+maJAUgfO/uBHGgQkegZ
 x8RZPQsGMoay8dyFcD+f1gF8uTnHqR/uezZaETecWQTLgAGL53eIBC/in
 kFgLVnPPTkwIxEWDDQMnZunaX/DVMKuq0nKOkGYalT/cucWawyEzoyNZc
 qc3Hssgz3vJNeonKxvpO03F+nA8DWfZoFSmCnpcbafHiO84mClcN3/B5R w==;
X-CSE-ConnectionGUID: syv0qhl9TleAz2UW+iDSBQ==
X-CSE-MsgGUID: iU6UM1fkR0mqDRxaVSXvWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87938309"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="87938309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 00:55:54 -0700
X-CSE-ConnectionGUID: 6JIYM3bdQh+/l7sb+NDrZA==
X-CSE-MsgGUID: oI7/JxJETyC71ExPZNv+lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253908923"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa002.fm.intel.com with ESMTP; 16 Apr 2026 00:55:53 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	nitin.r.gote@intel.com
Subject: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on
 platforms without RCS
Date: Thu, 16 Apr 2026 14:00:04 +0530
Message-ID: <20260416083004.2723418-2-nitin.r.gote@intel.com>
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

The ctx-restore-post-bb and ctx-restore-mid-bb subtests inject a batch
buffer via configfs using the "rcs" (render) engine class. However,
platforms like CRI, PVC don't have render. The BB is stored via configfs
but never injected into any engine's LRC, causing the subsequent register
readback to fail.

Fix by adding runtime detection of the render engine using
xe_for_each_engine() and skip the ctx-restore subtests with
igt_require_f(has_rcs) on platforms without a render engine instead
of failing silently.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Fixes: b6abdc26e01b ("tests/intel/xe_configfs: Check ctx_restore_post_bb")
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 tests/intel/xe_configfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 755524e7c..445f35431 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
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

