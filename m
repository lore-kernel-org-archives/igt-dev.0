Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EF2F4644F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A807810E3B9;
	Mon, 16 Mar 2026 11:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlvHnMaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F9910E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773659729; x=1805195729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AC4dQVIAqCdcv4yF/6qKspQ75GVUj0mcUr6juLs+OK4=;
 b=hlvHnMaWJIExQpdm1dHKKgov5dSC3gPN9jBNldeL3LO8QbPexUTsZLdA
 j9xxvxgzxUlpDTPoF+a5UUV7+wOsevynnPbOdjS2nmIeqtGGFtcjReq40
 5H+0WIpmhkzz3ExQD22ur3BgITjw50m8h6tWGisIvTnU7KFS84tgwawR4
 7LS09LXNmt/vy8ukIalpuEhz8pMvaODQpAQ4zUk2fAgQKYLNoUJel74Zn
 p8mXeQqeveVGla0QYZj+JtSpfSZJM4kpaUHGZryxjPTdeV2q0qCu6CzvE
 DXqAua+A7g2q35V/iEX0zcR9DQxNb86aT9d1Fw1eA+hEd8hp0knQ1hEWP Q==;
X-CSE-ConnectionGUID: CRcQPQ4lRX6vL0vG812vrg==
X-CSE-MsgGUID: tlwce0wWTfual8/MGo6sHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="84988668"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="84988668"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:15:29 -0700
X-CSE-ConnectionGUID: MkoR9FLFStCyI5YzI14xdQ==
X-CSE-MsgGUID: cIVJ57WYRbSbkgmG9B5XOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="259785385"
Received: from lnl1-rocket-lake-client-platform.iind.intel.com ([10.223.55.16])
 by orviesa001.jf.intel.com with ESMTP; 16 Mar 2026 04:15:23 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 negative test for
 continuous page-flip activity
Date: Mon, 16 Mar 2026 16:45:17 +0530
Message-ID: <20260316111517.24452-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
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

This test validates that DC5 entry that shouldn't entered when the display
engine is kept continuously busy with back-to-back page-flips. The test
performs a tight flip loop for 10 seconds, alternating between two fb's
with no delays between flips.

It monitors the DC5 counter to ensure no state transitions occur during
active display operations, validating proper power management behavior.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 57 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 39e94f36b..0d0e09780 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -77,6 +77,9 @@
  *
  * SUBTEST: dc5-retention-flops
  * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
+ *
+ * SUBTEST: dc5-negative-tight-flip
+ * Description: This test validates that DC5 state is not entered during continuous tight page-flips
  */
 
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
@@ -601,6 +604,49 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
 }
 
+static void test_dc5_negative_tight_flip(data_t *data, int dc_flag)
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
+	 * Tight flip loop for 10 seconds.
+	 * no delay in between flips - here display engine remains continuously busy.
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
+		     "DC5 state not achived during tight flip loop\n%s:\n%s\n",
+		     PWR_DOMAIN_INFO, data->debugfs_dump = igt_sysfs_get(data->debugfs_fd,
+		     PWR_DOMAIN_INFO));
+
+	cleanup_dc3co_fbs(data);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -695,6 +741,17 @@ int igt_main()
 		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
 	}
 
+	igt_describe("This test validates that DC5 state is not entered during "
+		     "continuous tight page-flips");
+	igt_subtest("dc5-negative-tight-flip") {
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_1, NULL));
+		data.op_psr_mode = PSR_MODE_1;
+		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
+		igt_require(!psr_disabled_check(data.debugfs_fd));
+		test_dc5_negative_tight_flip(&data, IGT_INTEL_CHECK_DC5);
+	}
+
 	igt_describe("This test validates negative scenario of DC5 display "
 		     "engine entry to DC5 state while all connectors's DPMS "
 		     "property set to ON");
-- 
2.25.1

