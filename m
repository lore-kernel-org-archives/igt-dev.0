Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67F7C0218B
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 09:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F6910E240;
	Thu, 23 Jan 2025 09:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6jlA0QD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A5410E240
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 09:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737622815; x=1769158815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JBXxt1jPFWIkU3Kz8lE9LpuDCrOzqRc9KbcqgxjsE0M=;
 b=X6jlA0QDpohPRq7dq5N9nIKFZfXHKHDAAwX9OoulLxOBVpNK4IicHVsl
 uOZkR17XmguFxXtcE7NKTbGnZhWL1gGQRDCjUivsbRot8wt7WJ7j17Tv/
 q2ol4jpwbcylSfIDBx+z2MEAJkfCqSb1P2BLaxpqdShlwifpmsPWpOx1p
 8DWudchDsk+PqXjCVkiBnQ13RFht3lUUdvqavKacNd9MQuvCyUoLDro2M
 puB+dbmxaatPG3zFEIsRf5IvulQ9ZB/m/72K2ILQJ2Di3lAYVb0Axa38G
 rez3AIoz+58wjKf+UT9txPBQimF3g9eWtWtYT2Q2RBmT6XFyPD56GKPsR w==;
X-CSE-ConnectionGUID: QVtbCVXGT1iPkQ9yv4QvEw==
X-CSE-MsgGUID: j3k6Rk70RoqbH7nUF2tYYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48611235"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="48611235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:00:15 -0800
X-CSE-ConnectionGUID: LUtxQtN5TPSi4sJGy4YqVQ==
X-CSE-MsgGUID: CJQ/3H1ASWm8LtKmq4qwCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111412335"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 01:00:13 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Update modifier to linear for
 display version 30+
Date: Thu, 23 Jan 2025 14:45:46 +0530
Message-Id: <20250123091546.3126819-1-jeevan.b@intel.com>
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

On latest platform tile-X is no longer supported, So for display
version 30+ we can use linear tiling and tile-X for older platform.
This change accounts for the limitations of gem_set_tiling, which
no longer works on recent platforms and will not be supported on
Xe drivers.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_rpm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 990c50915..0f4da426b 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1188,6 +1188,12 @@ static void cursor_subtest(bool dpms)
 	int rc;
 	struct igt_fb cursor_fb1, cursor_fb2, cursor_fb3;
 	uint32_t crtc_id;
+	uint64_t modifier;
+
+	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 30)
+		modifier = DRM_FORMAT_MOD_LINEAR;
+	else
+		modifier = I915_FORMAT_MOD_X_TILED;
 
 	disable_all_screens_and_wait(&ms_data);
 
@@ -1199,7 +1205,7 @@ static void cursor_subtest(bool dpms)
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
+		      modifier, &cursor_fb3);
 
 	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
 	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
-- 
2.25.1

