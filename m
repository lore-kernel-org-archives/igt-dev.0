Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C04CD6E79
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 03:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9076410E077;
	Tue,  9 Jun 2026 03:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxxtAwyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E28C10E075
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 03:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780976833; x=1812512833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CtY38hudnIv6NACF3o6sSUx2zMnVD2mHbAzxpGZ2YLU=;
 b=KxxtAwyq+Eu4FMWcyYsxvt6bW0zyGBWBv/B2h437EA2fc9PNj0BfC0YC
 hQuhdrjruG0hp+rCNed//vM18kmyXOewOw+HvSgt2eJgNGmTW6zl7USle
 paqlCWmKPvMIQNgZ+203hDo7exlPl3JyWvu1k934SZS0VLAP/6qxC7DHn
 AhpeadZe28uH3XzbLCSyV/vxe9K3cVWRnslxtpNlCzkxcy69ttCuONheR
 B53n9y5QMv1ESUSXVG7Y+1R2LXHu/IynuqgBh2/6aUB6S7KoRSMHxZGh3
 bTDnfO0Fns9C6ZeMRu2PCm0ROVNeGDyEEDT/pJUltaqMrviLcZ89vsTva g==;
X-CSE-ConnectionGUID: hRj3V2AIT9mSjdynJdh2mA==
X-CSE-MsgGUID: NhY5vUP8SoaWaM7WkaD7QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92050901"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92050901"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:47:13 -0700
X-CSE-ConnectionGUID: Q43+KBYwSBiYYuaDq1hbCw==
X-CSE-MsgGUID: LeNygbTMST+7HbqHzOXxzw==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 20:47:11 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v9 7/7] tests/intel/kms_pm_dc: Add dc3co-vpb-framegap
 subtest
Date: Tue,  9 Jun 2026 09:16:50 +0530
Message-ID: <20260609034650.2281712-8-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609034650.2281712-1-jeevan.b@intel.com>
References: <20260609034650.2281712-1-jeevan.b@intel.com>
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
with PSR2/PR enabled.

v2: Update commit message and test description.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 91 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 697dd3047..23e0820f8 100644
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
@@ -435,6 +439,63 @@ static void test_dc3co_framedrop(data_t *data)
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
@@ -862,6 +923,36 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Validate DC3CO counter increments before and after a delay "
+		     "greater than 6 frame gaps during video-like load with PSR2/PR active");
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

