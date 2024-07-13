Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E6DC3DA45
	for <igt-dev@archiver.kernel.org>; Sat, 13 Jul 2024 07:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B212810E08F;
	Sat, 13 Jul 2024 07:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdaXgWBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F9110E08F
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Jul 2024 07:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720855365; x=1752391365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lmu2BOS1bdmA52uXuot4XszF11CJbYF5PNwWqwmxEB0=;
 b=gdaXgWBaiO3AuYJLJgocZ0V4pxOapnupSx07/NFMfxhS8hNO+NUQFord
 PUgHlhEg5Boj6SyNjtS0ETeVxBQosDuf0PnLHrlSFC6oBbFkpj3OX0Jew
 0sAI+2d9sJn8aEsoBBN/hAstxlzZB6p5bcFCKc9KfgyFcQDgIyCZUgqVg
 fw14QGNhFuYMwCDTwJGOULyK+wEVf9fwgxInPghQp0RLUmGmEGotY0kbq
 1wcb1N2PuAZ5QxxTXLUp1lILRNrFz952RiJG1PtI1mAdmzWLHSCa7pSZL
 oWWFjzo1h8A9Am2pOW7O3UlSKVwwrbbpuVbwUV5XoBMyGmEkkfSe5k30+ A==;
X-CSE-ConnectionGUID: lGWXFD/JRMOe7IAY+pkmmg==
X-CSE-MsgGUID: 2mpUJsw5QHWFalJ0cVIZHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22067030"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; d="scan'208";a="22067030"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 00:22:44 -0700
X-CSE-ConnectionGUID: bMraEPreQX6ipGsSpcC1Rg==
X-CSE-MsgGUID: TVvQMrIDQ2ixHBIf2jS6Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; d="scan'208";a="48861347"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 00:22:42 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the deep-pkgc
Date: Sat, 13 Jul 2024 12:56:46 +0530
Message-ID: <20240713072646.551590-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
References: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
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

Add tuned delays to check deep-pkgc pkgc10 counters

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index bca5bfa58..2155b4625 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL), duration = 2, vb_delay, delay;
+	time_t start = time(NULL), duration = 4, vb_delay, delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
 	bool flip = true;
@@ -618,6 +618,7 @@ static void test_deep_pkgc_state(data_t *data)
 			igt_assert(igt_display_try_commit_atomic(display,
 						DRM_MODE_ATOMIC_ALLOW_MODESET,
 						NULL) == 0);
+			break;
 		}
 	}
 
@@ -638,23 +639,26 @@ static void test_deep_pkgc_state(data_t *data)
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
-
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
+	/* Waiting for the vblank to sync the frame time */
+	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
+	/* measure delay for half frame */
+	delay = vb_delay*0.5;
+	usleep(delay);
+	pre_val = read_pkgc_counter(data->debugfs_root_fd);
 
 	while (time(NULL) - start < duration) {
 		flip = !flip;
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
-
-		cur_val = read_pkgc_counter(data->debugfs_root_fd);
+		/* For every 1ms polling for pkgc10 counter change till 1 frame time */
+		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
+				vb_delay*2, 5);
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
 		}
-		usleep(delay);
 	}
 
 	cleanup_dc3co_fbs(data);
-- 
2.43.0

