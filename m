Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7F4F5581D
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DF810E50E;
	Mon, 20 Apr 2026 11:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T55w9g2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A029110E514
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776685028; x=1808221028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VRttVK63nO0hElS80v153OuPVt1/B4v80eiSvNWQRTs=;
 b=T55w9g2Am3e2WmrClSlzxdlahq8KKVsj9qv7HNaT22+Xoww8Elyc59do
 SPTz4UBMbT8tfkHTES3bFiMFmzqQDpQrPM5I3c5Kvj/ueLlmU+JSmzTj2
 2k7s+u+ztbVUcfdJHvDdxHj7C03KsJPpu5mw+ziJcuh04OVTsszRIA75r
 gNIGs4ROHDa/VhOBKqFzttXK7HkbGdiaE8h8WztO6w2q9vDcMjKI8MKaO
 W4/aOqY5Q1AZd5hxv8Kk8Mp2twAHWfvQrDS/jF2T7auCzS6DmjUZmcing
 /9gi+6PWpG0YPU03MwDKAcIR943E35ugflUVp8cXi5wAKBK0ZBA7ADCK0 Q==;
X-CSE-ConnectionGUID: C0LgQDT0SaeJi8yGWBZEvw==
X-CSE-MsgGUID: Frc4C7iTRYuB9A/kZ1Vi7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89064538"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="89064538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:37:08 -0700
X-CSE-ConnectionGUID: UEGcgZcVS+y82+dN7Ug2JA==
X-CSE-MsgGUID: gCCgbojoRFGMjv/NdJNgDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228551007"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2026 04:37:06 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, jani.nikula@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 4/6] Revert "tests/intel/kms_pm_dc: Update VRR handling and
 eDP output check"
Date: Mon, 20 Apr 2026 16:58:24 +0530
Message-ID: <20260420112826.35220-5-mohammed.thasleem@intel.com>
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

This reverts commit e08151940f034f976632d99798f2097b2ee5e04e.

v3: Fix compilation issues. (Jani)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index a9f00f21c..51b3b1c9b 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -540,13 +540,12 @@ static void test_deep_pkgc_state(data_t *data)
 	unsigned int pre_val = 0, cur_val = 0;
 	time_t start = time(NULL), duration = 2, delay;
 	bool pkgc_flag = false;
-	bool flip = true;
 	igt_crtc_t *crtc;
+	bool vrr_supported = false, flip = true;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_output_t *output = NULL;
-	drmModeModeInfo *mode;
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
@@ -554,36 +553,26 @@ static void test_deep_pkgc_state(data_t *data)
 		/* Check VRR capabilities before setting up */
 		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
 		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-			/*
-			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
-			 * when KMD allows for such capability.
-			 */
-			igt_crtc_set_prop_value(crtc, IGT_CRTC_VRR_ENABLED, false);
-			igt_assert(igt_display_try_commit_atomic(display,
-								 DRM_MODE_ATOMIC_ALLOW_MODESET,
-								 NULL) == 0);
+			vrr_supported = true;
 			break;
 		}
 	}
+
+	/* Skip the test if no VRR capable output is found */
+	igt_skip_on_f(!vrr_supported,
+		      "No VRR capable output found, skipping the test.\n");
+
 	igt_display_reset(display);
 
 	igt_output_set_crtc(output, crtc);
-	for_each_connector_mode(output, mode) {
-		data->mode = mode;
-		delay = (MSEC / (data->mode->vrefresh));
-		/*
-		 * Should be 5ms vblank time required to program higher
-		 * watermark levels
-		 */
-		if (delay >= (5 * MSEC))
-			break;
-	}
 
 	data->output = output;
+	data->mode = igt_output_get_mode(output);
 	setup_videoplayback(data);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	pre_val = igt_read_pkgc_counter(data->debugfs_root_fd);
+	delay = (MSEC / (data->mode->vrefresh - 10));
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-- 
2.43.0

