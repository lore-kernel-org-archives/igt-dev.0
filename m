Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9220BCD4F25
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 15:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422BB10F56A;
	Fri, 15 May 2026 15:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+tH76Cl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCAA10F56A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778859633; x=1810395633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aqtNHfXvcvcIbGtlXnR+VvZjNOMDp4oLGBrv3MjDr8M=;
 b=N+tH76ClltXi7dAYetDHBfEHrhR1aO7kW1fZxoTco3XR62VQNjU9Kdkk
 AAf8iVE4J7gAscH0V3Lz3DSKrq1Gm/wd5I/nHCsXjKmMpdK05otq2dhIz
 tQTOCzG/BQTLmRRchQ8+wGE0Phn3xLFjmsGHlDI5PngsTSXYnepok4Art
 dH+SSkUrddVtqviIHxDs+UjuVzZ2rKo1Gdj2rwnmC7Rl+9mXJarBsSj4J
 KfOvivV1bdg1HYe5J6ELeP3onA3zNxIpRt6EsPHZiKgpuhuewZ2WRZKpl
 cg85kWOUTo7JlnXlWp2Hofn/eb4MbUMuegGRXFDoyeDvVEkwV3VPmoLaP g==;
X-CSE-ConnectionGUID: Is288xGDSHuEon8tuWAdew==
X-CSE-MsgGUID: PiHOp7xHSliW5DuJ2klqZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79936319"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79936319"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:40:32 -0700
X-CSE-ConnectionGUID: At14ULjORa+znSABFz3ahA==
X-CSE-MsgGUID: uzvzTAA9SvaYPZ0X+VMxTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242720031"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 08:40:31 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v6 7/7] tests/intel/kms_pm_dc: Add dc3co-vpb-framegap
 subtest
Date: Fri, 15 May 2026 21:08:37 +0530
Message-ID: <20260515153838.841048-8-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515153838.841048-1-jeevan.b@intel.com>
References: <20260515153838.841048-1-jeevan.b@intel.com>
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
 tests/intel/kms_pm_dc.c | 73 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 0f216d9eb..4ce7c94be 100644
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
@@ -432,6 +436,64 @@ static void test_dc3co_framedrop(data_t *data)
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
+	data->op_psr_mode = PSR_MODE_2;
+	setup_output(data);
+	setup_dc3co(data);
+	setup_videoplayback(data);
+	check_dc3co_with_framegap_load(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -852,6 +914,17 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Validate DC3CO counter increments before and after a delay "
+		     "greater than 6 frame gaps during video-like load with PSR2 active");
+	igt_subtest("dc3co-vpb-framegap") {
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_2, NULL));
+		igt_require_f(IS_TIGERLAKE(data.devid) ||
+			      intel_display_ver(data.devid) >= 35,
+			      "Platform does not support DC3CO with PSR2\n");
+		test_dc3co_vpb_framegap(&data);
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

