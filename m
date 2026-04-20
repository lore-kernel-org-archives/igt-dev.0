Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15453F55810
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B796010E50E;
	Mon, 20 Apr 2026 11:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkVUkxw/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1F610E50E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776685025; x=1808221025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FDHghTlYKSspXzFkvaMIrjFOA5hUBINFUhTq7sxoon8=;
 b=DkVUkxw/EPuhyRxs2f0F/gmXrMysaeDbxlskpKdTJ0U0neNw8PucAUy+
 m5lQObsEVBKHDM2yI+PCvC362MfnXB7KjzBfgacEWxU/cHuLqMrSI36Dv
 mOzDAB4KR12RH9J5msF5bbGahoxhO51QM0h45VqEBkQsiBTIYf+JZYSCe
 RDRz8JnY3/nODALpr9a790EGG306mUXdWPTUxeXf8VoFzfrq5Cp5RwRw4
 yfo/G9oTpJgKmXVFceu3wWywmMHS2CGjeqioGFLWv9enc8D7Q2JPiIczW
 FCir6CQ2/69PdlKqLUj5uZYtxOdxy57oZBpYrwxJn51q4dV8zMV3QJBzF A==;
X-CSE-ConnectionGUID: UCfmCJMMRH++lbJbDwaKLQ==
X-CSE-MsgGUID: Fvp6RlTHToKT9KmieabQNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89064534"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="89064534"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:37:05 -0700
X-CSE-ConnectionGUID: qK4OUxUlSXahwdO3l9SBkg==
X-CSE-MsgGUID: t08qoFMER+WI9kPRxd4mZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228550987"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2026 04:37:03 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, jani.nikula@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 2/6] Revert "tests/intel/kms_pm_dc: Add polling for
 deep-pkgc"
Date: Mon, 20 Apr 2026 16:58:22 +0530
Message-ID: <20260420112826.35220-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420112826.35220-1-mohammed.thasleem@intel.com>
References: <20260420112826.35220-1-mohammed.thasleem@intel.com>
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

This reverts commit 0e443bec0ccfb56c2754437b465fc197ee4fd481.

v3: Fix compilation issues. (Jani)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 2d6fa794f..1eade8f1f 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -585,26 +585,22 @@ static void test_deep_pkgc_state(data_t *data)
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+	pre_val = igt_read_pkgc_counter(data->debugfs_root_fd);
+
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-	/* Wait for the vblank to sync the frame time */
-	igt_wait_for_vblank_count(crtc, 1);
-	pre_val = igt_read_pkgc_counter(data->debugfs_root_fd);
-	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
-	usleep(delay * 0.5);
 
 	while (time(NULL) - start < duration) {
 		flip = !flip;
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
 
-		igt_wait((cur_val = igt_read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
-			 (delay * 2), (5 * MSEC));
-
+		cur_val = igt_read_pkgc_counter(data->debugfs_root_fd);
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
 		}
+		usleep(delay);
 	}
 
 	cleanup_dc3co_fbs(data);
-- 
2.43.0

