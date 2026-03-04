Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10325EDEC04
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 04:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E5010E0EA;
	Wed,  4 Mar 2026 04:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcc8B5Jm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6DC10E0EA
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 04:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772599092; x=1804135092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bo1+bm32uNuw7oJMUy/NhmhUX1HBoUNNl3G+5m9iq+k=;
 b=bcc8B5JmPPrWXj//19jXvRdmMdVMy8ycz4LYHaBZIA3SSqgRCY6RdfZG
 FXQ9x6RLJOgwmSISlxPDOzOt/4cHULFEatkw8UaFCAkvs6tVvWUZk7vzr
 Gx7Uvzxvoo25HeBwC7mKLB3lwgbplBsnKmm8m3rY1P1YdUjvhWiT2WrwE
 xReMs0oOaXPeNy/NoJUbW58UDBgT3yYpAK64olvqFS/YvZ9qdtAcxhbjW
 roT9Pci8UhAyyv1nJ6fmyry8LnhdlmHSexB5BxgyGiKF8awY/P5acUJuB
 /wlM5iEVbQK8WwSs4kQMu7BxJ4GkEZoqAIYV8c+8IhWeEhCEHdju3a8dC w==;
X-CSE-ConnectionGUID: hzpu6p/ZSYq+8v6GhcPUVA==
X-CSE-MsgGUID: wb5V8GE8TqOvvp0++wXkpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73560259"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73560259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 20:38:12 -0800
X-CSE-ConnectionGUID: J1FZDfUpT6u14g+pszt+ag==
X-CSE-MsgGUID: et/YaM33QQW+7nWIt0+Oaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218332636"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 20:38:10 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/kms_pm_dc: Add new test for dc3co
 framedrop validation
Date: Wed,  4 Mar 2026 10:08:05 +0530
Message-ID: <20260304043805.572087-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304043805.572087-1-jeevan.b@intel.com>
References: <20260304043805.572087-1-jeevan.b@intel.com>
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

Add a new subtest to validate that no frame drops occur during
DC3CO entry, ensuring that no frame drops are detected and DC3CO
is successfully triggered during the test.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 83 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 10450474a..b0e35dca1 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -51,6 +51,10 @@
  * Description: Make sure that system enters DC3CO when PSR2 is active and system
  *              is in SLEEP state
  *
+ * SUBTEST: dc3co-framedrop-check
+ * Description: Verify that DC3CO entry does not cause frame drops and successfully
+ * 		enters the power state
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -315,6 +319,50 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 	check_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
+static void check_framedrop(data_t *data)
+{
+	igt_plane_t *primary;
+	uint32_t dc3co_prev_cnt, dc3co_cnt;
+	int delay, frame_count, max_count = 100, ret;
+	bool dc3co_flag = false;
+	drmVBlank wait;
+
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd,
+					     IGT_INTEL_CHECK_DC3CO);
+
+	/* Calculate delay to generate idle frame in usec*/
+	delay = 1.5 * ((1000 * 1000) / data->mode->vrefresh);
+
+	for (int i = 0; i < max_count; i++) {
+		if (i % 2 == 0)
+			igt_plane_set_fb(primary, &data->fb_rgb);
+		else
+			igt_plane_set_fb(primary, &data->fb_rgr);
+
+		igt_display_commit(&data->display);
+		frame_count++;
+
+		memset(&wait, 0, sizeof(wait));
+		wait.request.type = DRM_VBLANK_RELATIVE;
+		wait.request.sequence = 1;
+
+		ret = drmWaitVBlank(data->drm_fd, &wait);
+		igt_assert_eq(ret, 0);
+		dc3co_cnt = igt_read_dc_counter(data->debugfs_fd,
+						IGT_INTEL_CHECK_DC3CO);
+		if (dc3co_cnt > dc3co_prev_cnt)
+			dc3co_flag = true;
+
+		usleep(delay);
+	}
+
+	igt_assert_f(dc3co_flag, "DC3CO entry failed.\n");
+	igt_assert_f(frame_count == max_count, "Framedrop seen during vpb scenario.\n");
+}
+
 static void setup_dc3co(data_t *data, enum psr_mode mode)
 {
 	data->op_psr_mode = mode;
@@ -333,6 +381,16 @@ static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
 	cleanup_dc3co_fbs(data);
 }
 
+static void test_framedrop_dc3co(data_t *data, enum psr_mode mode)
+{
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	setup_output(data);
+	setup_dc3co(data, mode);
+	setup_videoplayback(data);
+	check_framedrop(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -660,6 +718,31 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Verify that DC3CO entry does not cause frame drops "
+		     "and successfully enters the power state");
+	igt_subtest_with_dynamic("dc3co-framedrop-check") {
+		int modes[] = {PSR_MODE_2, PR_MODE};
+		const char *append_subtest_name[2] = {
+			"psr2-",
+			"pr-",
+		};
+
+		for (int i = 0; i < ARRAY_SIZE(modes); i++) {
+			igt_dynamic_f("%s-dc3co-framedrop", append_subtest_name[i]) {
+				igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+							     modes[i], NULL));
+
+				if (modes[i] == PSR_MODE_2)
+					igt_require(IS_TIGERLAKE(data.devid) ||
+						    intel_display_ver(data.devid) >= 35);
+				else if (modes[i] == PR_MODE)
+					igt_require(intel_display_ver(data.devid) >= 35);
+
+				test_framedrop_dc3co(&data, modes[i]);
+			}
+		}
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

