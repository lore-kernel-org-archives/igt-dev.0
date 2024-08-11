Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D66C3DA4A
	for <igt-dev@archiver.kernel.org>; Sun, 11 Aug 2024 20:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBEA10E034;
	Sun, 11 Aug 2024 20:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNiOI4ac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D05010E034
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Aug 2024 20:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723406680; x=1754942680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JRZZy8P8TbSaEQCQJqcIGkjVzF3s0YdeZdpOs2ct76I=;
 b=iNiOI4acjvn8rn+gBdtBiDGexB35gBQe0HhX/fvnu3R1rSNxfLk2T0ZD
 g2JBtru5pJyPX3c3z85ox+F8fuvgXxFK9fe9NcjPhZH/cKxZDcawGhr/1
 ZAjuNE3GMIiQMmD+5zR229Xf6XD1MD37HwhYtPFksIuNZAcmOUvuVRM3d
 sKVUjKz7TLJO0g4YtVOaPYIJJQlc1ga2nB4q1NSqpwiySRDAqNxdtj/r4
 8nQUMm6P5v1zX5ana/8WsuAsmpnr3vNcTKHHd89QnTBB8z3qSVGUg26+n
 Ry4ERIjBBQkx/B8FWiztibV/U/+VTvt5AnpOwvk0I27BfOGZbbVDUYMYC g==;
X-CSE-ConnectionGUID: LU1YdtrdSYGErQM67aVU7w==
X-CSE-MsgGUID: 6JHGJDnbQ5eNGJH/TgzoWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21364035"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; d="scan'208";a="21364035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 13:04:40 -0700
X-CSE-ConnectionGUID: rTNPq9XSQZK/hKYWGQpPXw==
X-CSE-MsgGUID: bHYRIsEOSFC50nTZ4NmApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; d="scan'208";a="88712444"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 13:04:38 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 3/4] tests/intel/kms_pm_dc: Add polling for deep-pkgc
Date: Mon, 12 Aug 2024 01:33:58 +0530
Message-ID: <20240811200359.1086166-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
References: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
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

It should be enhance the test_deep_pkgc_state function to include
the following changes:
- Added an interval variable to control the delay between checks.
- Added a wait for vblank to sync the frame time before reading
  the package C-state counter.
- Introduced a half-frame delay to ensure the flip occurs when
  the frame is active.
- Modified the loop to use igt_wait for better handling of the
  package C-state counter read.
- Removed redundant usleep call to streamline the delay handling.

v2: Address and correct review comments (Suraj, Jeevan)
v3: Update commit subject/message.  (Kamil)
v4: Update commit subject/message and added comments. (Suraj)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 565c3d48d..270912c46 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -596,6 +596,7 @@ static void test_deep_pkgc_state(data_t *data)
 	enum pipe pipe;
 	bool pkgc_flag = false;
 	bool flip = true;
+	unsigned int interval = 5;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
@@ -640,22 +641,25 @@ static void test_deep_pkgc_state(data_t *data)
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
+	/* Waiting for the vblank to sync the frame time */
+	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
+	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+	/* Added a half-frame delay to ensure the flip occurs when the frame is active. */
+	usleep(delay * 0.5);
 
 	while (time(NULL) - start < duration) {
 		flip = !flip;
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
-
-		cur_val = read_pkgc_counter(data->debugfs_root_fd);
+		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
+						      delay * 2, interval);
 		if (cur_val > pre_val) {
 			pkgc_flag = true;
 			break;
 		}
-		usleep(delay);
 	}
 
 	cleanup_dc3co_fbs(data);
-- 
2.43.0

