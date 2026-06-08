Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB88CD8C92
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 07:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C3610EE58;
	Mon,  8 Jun 2026 07:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JauZe4MI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABF410EE57
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 07:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780904412; x=1812440412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qef2mVQTbcAgfm99qNqnudEMCK58nKiQLgzzrxdYtFs=;
 b=JauZe4MI7zsQZ8PDZjotpnDJzu/kFLP3u1CwzdNf8ZxEyWJ56tQj2Jl5
 mcqt1W+4EmIV7zACUTo9FaCUZ83KTDJR4g6YNQVPNwjcDO8gr+iG2b/GS
 NbNv0qTiECb2ZPzFz2imDK8NVZHtcRlIMYX6rHmce1g7rZORuqXEqm9JJ
 IKI/MuBJZszpVMusBwV01QPqupI5/Qyc+q8xp7d3Elkn7Kdu7WS569Qb0
 SxFI6gJH/d1MMQNOW8HGZRHpwZuq44Lr2/S+QDjVRppvBhKmhaRRzGpPZ
 +u27/nCtsAKgTgj3d3topU7lw9aU/s6q4KyGXKyhppvirC2hTL2D+5oPW A==;
X-CSE-ConnectionGUID: XlxV3tkBSwWaIdricsEhjQ==
X-CSE-MsgGUID: yQBZpw69T6+gpnj0qNiG9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="91958651"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="91958651"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 00:40:11 -0700
X-CSE-ConnectionGUID: oGZESRDkTHyDitGw6glGwA==
X-CSE-MsgGUID: mlUppQNfSymBAMYd0P3GhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="241295420"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa010.fm.intel.com with ESMTP; 08 Jun 2026 00:40:09 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 negative test for
 continuous page-flip activity
Date: Mon,  8 Jun 2026 13:00:19 +0530
Message-ID: <20260608073019.9011-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316111517.24452-1-mohammed.thasleem@intel.com>
References: <20260316111517.24452-1-mohammed.thasleem@intel.com>
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

This test validates that DC5 entry should not occur when the display engine
is kept continuously busy with back-to-back page-flips. The test performs
a tight flip loop for 10 seconds, alternating between two fb's with no
delays between flips.

It monitors the DC5 counter to ensure no state transitions occur during
active display operations, validating proper power management behavior.

v2: Update test description and test name. (Uma)
    Update test assert message and minor changes. (Uma)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 58 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 423a5c4a4..90df8ee37 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -77,6 +77,9 @@
  *
  * SUBTEST: dc5-retention-flops
  * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
+ *
+ * SUBTEST: dc5-pageflip-negative
+ * Description: This test validates that DC5 entry should not occur during continuous page-flips
  */
 
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
@@ -622,6 +625,49 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
 }
 
+static void test_dc5_pageflip_negative(data_t *data, int dc_flag)
+{
+	igt_plane_t *primary;
+	uint32_t dc5_prev_counter;
+	time_t duration = 10;
+	bool flip = false;
+	time_t start;
+
+	igt_require_dc_counter(data->debugfs_fd, dc_flag);
+
+	setup_output(data);
+	setup_videoplayback(data);
+
+	primary = igt_output_get_plane_type(data->output,
+					     DRM_PLANE_TYPE_PRIMARY);
+
+	igt_plane_set_fb(primary, &data->fb_rgb);
+	igt_display_commit(&data->display);
+
+	dc5_prev_counter = igt_read_dc_counter(data->debugfs_fd, dc_flag);
+
+	/*
+	 * Page-flip loop for 10 seconds.
+	 * No delay in between flips - here display engine remains continuously busy.
+	 */
+	start = time(NULL);
+	while (time(NULL) - start < duration) {
+		flip = !flip;
+
+		igt_plane_set_fb(primary,
+				 flip ? &data->fb_rgb : &data->fb_rgr);
+
+		igt_display_commit(&data->display);
+	}
+
+	igt_assert_f(igt_read_dc_counter(data->debugfs_fd, dc_flag) == dc5_prev_counter,
+		     "DC5 state incorrectly entered during continuous page-flips\n%s:\n%s\n",
+		     PWR_DOMAIN_INFO, data->debugfs_dump = igt_sysfs_get(data->debugfs_fd,
+		     PWR_DOMAIN_INFO));
+
+	cleanup_dc3co_fbs(data);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -717,6 +763,18 @@ int igt_main()
 		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
 	}
 
+	igt_describe("This test validates that DC5 entry should not occur during "
+		     "continuous page-flips");
+	igt_subtest("dc5-pageflip-negative") {
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_1, NULL));
+		data.op_psr_mode = PSR_MODE_1;
+		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
+		igt_require(!psr_disabled_check(data.debugfs_fd));
+		test_dc5_pageflip_negative(&data, IGT_INTEL_CHECK_DC5);
+		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
+	}
+
 	igt_describe("This test validates negative scenario of DC5 display "
 		     "engine entry to DC5 state while all connectors's DPMS "
 		     "property set to ON");
-- 
2.43.0

