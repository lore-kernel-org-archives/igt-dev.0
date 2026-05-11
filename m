Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31123CD4840
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 17:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D937610E1DF;
	Mon, 11 May 2026 17:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzBHK0EH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C5510E837
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778520024; x=1810056024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nK1Pj+LqynZIrhL30YjFjEsuuq/nRv4mEDVBvIYkbNA=;
 b=jzBHK0EHzVlCRFbaUCgAkieTh0nM5BhpJ9MD84OTYh9fbnLn9vdUzcWs
 V67w5uUu2FdBjrqJ43cCVwQNhTyD5odNhiwZFAOIXXx4Br4fVH3XPogrU
 pZtxysyMMlPup3YdpLZuGRzfbe+/QPRtX1OWmQca6QMH9hi8l080neogn
 UylAUgZs8oP2+WKtaY+vpsNS3I7ZOcDk60JU573uvWPDEL/jSaQ7FW6N8
 rra4OQM0G+drFRVhw+JzWjobiDWRCTB9SxowJu5f7n6loV5sBkO01pBzd
 ZRsr2Phu6vJWHAR/yokuQNj2vOqxbn5qndOcdw+ECzmC8NwTFfyuciU2H g==;
X-CSE-ConnectionGUID: vSoOoaxoQLCoVp9Qjpminw==
X-CSE-MsgGUID: nc6y0KlmRnCCCGYP5pcB0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="81979871"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="81979871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:20:24 -0700
X-CSE-ConnectionGUID: IsY9dCjxTAibmNr54RMeQg==
X-CSE-MsgGUID: wjfDzj4nQjW0megfnoyUQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="233192592"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:20:22 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v4 7/7] tests/intel/kms_pm_dc: Add dc3co-vpb-framegap
 subtest
Date: Mon, 11 May 2026 22:48:20 +0530
Message-ID: <20260511171820.461666-8-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511171820.461666-1-jeevan.b@intel.com>
References: <20260511171820.461666-1-jeevan.b@intel.com>
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

Add a new subtest to validate DC3CO counter increments across
frame gaps exceeding the threshold during a video-like workload
with PSR2 enabled.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 6d2bd0ee1..b8d903fd5 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -60,6 +60,10 @@
  *              exit cycle, ensuring DC3CO is not broken by deeper power state
  *              transitions.
  *
+ * SUBTEST: dc3co-vpb-framegap
+ * Description: Validate DC3CO counter increments before and after a delay greater
+ *              than 6 frame gaps during video-like load with PSR2 active.
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -433,6 +437,63 @@ static void test_dc3co_framedrop(data_t *data, enum psr_mode mode)
 	cleanup_dc3co_fbs(data);
 }
 
+static void check_dc3co_with_framegap_load(data_t *data)
+{
+	igt_plane_t *primary;
+	uint32_t dc3co_cnt_before, dc3co_cnt_after_gap;
+	int delay, long_gap_us;
+	time_t secs = 3;
+	time_t start_time;
+
+	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+
+	delay = 1.5 * ((1000 * 1000) / data->mode->vrefresh);
+
+	dc3co_cnt_before = igt_read_dc_counter(data->debugfs_fd,
+			   IGT_INTEL_CHECK_DC3CO);
+	start_time = time(NULL);
+	while (time(NULL) - start_time < secs) {
+		igt_plane_set_fb(primary, &data->fb_rgb);
+		igt_display_commit(&data->display);
+		usleep(delay);
+
+		igt_plane_set_fb(primary, &data->fb_rgr);
+		igt_display_commit(&data->display);
+		usleep(delay);
+	}
+
+	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_before);
+
+	long_gap_us = 7 * ((1000 * 1000) / data->mode->vrefresh);
+	usleep(long_gap_us);
+
+	dc3co_cnt_after_gap = igt_read_dc_counter(data->debugfs_fd,
+						  IGT_INTEL_CHECK_DC3CO);
+	start_time = time(NULL);
+	while (time(NULL) - start_time < secs) {
+		igt_plane_set_fb(primary, &data->fb_rgb);
+		igt_display_commit(&data->display);
+		usleep(delay);
+
+		igt_plane_set_fb(primary, &data->fb_rgr);
+		igt_display_commit(&data->display);
+		usleep(delay);
+	}
+
+	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_after_gap);
+}
+
+static void test_dc3co_vpb_framegap(data_t *data)
+{
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	setup_output(data);
+	setup_dc3co(data, PSR_MODE_2);
+	setup_videoplayback(data);
+	check_dc3co_with_framegap_load(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -864,6 +925,14 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Validate DC3CO counter increments before and after a delay "
+		     "greater than 6 frame gaps during video-like load with PSR2 active");
+	igt_subtest("dc3co-vpb-framegap") {
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_2, NULL));
+		test_dc3co_vpb_framegap(&data);
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

