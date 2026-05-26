Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF3ECD5BB4
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 06:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A8910E49A;
	Tue, 26 May 2026 06:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIDyca0D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582A610E49A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 06:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779777776; x=1811313776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NEa60BPNX0iKXHsDEKMdxurdWtxOXEb8FcaWEJoqeB0=;
 b=NIDyca0DOOuWXdJ/AnMtcKFqREq/RcB4fzJX8mzoA8A7jykrL9AvAKDs
 s93sbUonKC3DtYWeY3xgso15LK7BiRnsPT/p/sLTsN3egZYJ0mmvqEekL
 5yrxHv3zIfyPqrPh/umVS1D7XzFCRVAYpXMANv/Cb/ZcNU1r5Jr3/LQpM
 Qq8FDfSoqTSzQpivZ6ENeRIG7g4fNrkRGEkCcY7+uL32jaN+xTIxEmiUz
 aFq72H/VLJOU9jWb7A+SpBZTvkvepXxPuHZdA/MVpbzKe4ejqdUEPljyh
 N1wKK+/NV5PuVcWZxqSEWK6wBrKO5gU38zt2bk77ADdTZ7DySdzJq/JRr Q==;
X-CSE-ConnectionGUID: j8eXY96bQq6pV7AboI0V5A==
X-CSE-MsgGUID: iO8bOTA6ShiwTVxqGfEleQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80617991"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80617991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:56 -0700
X-CSE-ConnectionGUID: 4fPDr692Qvy/3BnQWLvIUQ==
X-CSE-MsgGUID: t5nESYFfQ6SPAumd24KMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265689319"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:54 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v7 7/7] tests/intel/kms_pm_dc: Add dc3co-vpb-framegap
 subtest
Date: Tue, 26 May 2026 12:11:04 +0530
Message-ID: <20260526064105.1818876-8-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526064105.1818876-1-jeevan.b@intel.com>
References: <20260526064105.1818876-1-jeevan.b@intel.com>
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
 tests/intel/kms_pm_dc.c | 91 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 59cb9983d..8cc5f575c 100644
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
@@ -427,6 +431,63 @@ static void test_dc3co_framedrop(data_t *data)
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
+	setup_dc3co(data);
+	setup_videoplayback(data);
+	check_dc3co_with_framegap_load(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -854,6 +915,36 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Validate DC3CO counter increments before and after a delay "
+		     "greater than 6 frame gaps during video-like load with PSR2 active");
+	igt_subtest_with_dynamic("dc3co-vpb-framegap") {
+		static const struct dc3co_test_mode dc3co_modes[] = {
+			{ PSR_MODE_2, "psr2" },
+			{ PR_MODE,    "pr"   },
+		};
+
+		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
+			const char *name = dc3co_modes[i].name;
+			data.op_psr_mode = dc3co_modes[i].mode;
+
+			igt_dynamic_f("%s", name) {
+				igt_require(psr_sink_support(data.drm_fd,
+						     data.debugfs_fd,
+						     data.op_psr_mode, NULL));
+
+				if (data.op_psr_mode == PSR_MODE_2)
+					igt_require_f(IS_TIGERLAKE(data.devid) ||
+						      intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with PSR2\n");
+				else
+					igt_require_f(intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with Panel Replay\n");
+
+				test_dc3co_vpb_framegap(&data);
+			}
+		}
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

