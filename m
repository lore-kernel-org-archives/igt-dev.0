Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98DDC44508
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 15:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5988510E355;
	Tue, 14 Jul 2026 15:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIKlIP8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FA810E355
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784041772; x=1815577772;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cJFpNS89rVrMgxNbku9VabObvJItEjtWsGuFq604kcE=;
 b=bIKlIP8CQ76H6URSuGYW/BONUn2HC9g8wxICHweFw0otc67W8tu0oUPQ
 Ca8q/028xvXacraDSVdl2iiJ33TPPlQ1t4MM2afBo0xsrIDuuM2tJdReG
 BeNAEJtLhTiWC7tvvIECoCmRpyAaHXokM+fg5WzPKfsUt19w8PjaL3AMz
 Zpr1v2FrFiVI+nMS0bZIQHP7R+2kMxMJxByBJhSob6vB1CAa+QI1xYpf7
 btM8U5Myng7mQXYxfdpVMtXiXi0xebWIGuh3ti3pFOuqx/ZArQsMDs08V
 PVdfx6+d5W4gqngxljXp2NlrmU1ztxnAKwR2PjNz1AJRDBHoQ2EhfhlGl Q==;
X-CSE-ConnectionGUID: wMDsnK8MRSO56oSe2u/xrw==
X-CSE-MsgGUID: dD/WBwYKT0yhwxG+8xV4nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88488857"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="88488857"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:09:32 -0700
X-CSE-ConnectionGUID: rRzkOZOjRcWpRh+TaQyphA==
X-CSE-MsgGUID: fz7x4qMFTTSkIdTVuxjESA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="257839050"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 14 Jul 2026 08:09:30 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/2] Revert "lib/kms: Set
 display->has_plane_color_pipeline automatically"
Date: Tue, 14 Jul 2026 20:15:31 +0530
Message-Id: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

This reverts commit be4e98c3b79e8bb843f7bb762616742691fee72e.

Enabling DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE from the common
igt_display_require() path makes all IGT display clients opt into the
new plane color pipeline UAPI.

With the color pipeline client cap enabled, legacy plane COLOR_ENCODING
and COLOR_RANGE properties are ignored during commit preparation.
The driver cannot distinguish this case, because enum drm_color_encoding
and enum drm_color_range do not provide an explicit uninitialized value.

Revert the global opt-in and keep the cap enablement local to the
color-pipeline-aware tests. kms_properties colorop coverage shall be
preserved separately.

Cc: John Harrison <John.Harrison@Igalia.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kms.c              | 2 --
 tests/kms_color_pipeline.c | 5 +++++
 tests/kms_colorop.c        | 4 ++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2eefb773b..c56127c42 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3201,8 +3201,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
-	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-		display->has_plane_color_pipeline = 1;
 
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 6119a830f..78860a845 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -349,6 +349,7 @@ run_tests_for_plane(data_t *data)
 
 int igt_main()
 {
+	int has_plane_color_pipeline = 0;
 	data_t data = {};
 
 	igt_fixture() {
@@ -363,9 +364,13 @@ int igt_main()
 		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
 			data.display.is_atomic = 1;
 
+		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+			has_plane_color_pipeline = 1;
+
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
+		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
 		igt_require(data.display.is_atomic);
 	}
 
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 4db83470d..16db0b8ad 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -418,10 +418,14 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
 
 		igt_display_require(&display, display.drm_fd);
+		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+			display.has_plane_color_pipeline = 1;
 
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&display, display.drm_fd);
+		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+			display.has_plane_color_pipeline = 1;
 
 		igt_require(display.is_atomic);
 	}
-- 
2.25.1

