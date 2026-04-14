Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C4DED7B93
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEFD10E58E;
	Tue, 14 Apr 2026 09:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTAU1dRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF9A10E58E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776160341; x=1807696341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZBzSuceOVhzz/bUDYHYUmm4RtfgBY7C0gYYsiQYY5KA=;
 b=RTAU1dRHBxHLlwFUG5v7zQveA1D9xOFdPqNaOrEIGgJyZ2dyvlae4+No
 QGVfDHqxOFflSRChb3jK4RkpOkqSZaAHeVgS3BRuMGo0ugaP436ftcU51
 V7lvXsWI8WUeM4Z+RLSubR/yTs2BB9XXd0wD4Axz3Y/j1SOtji6m57U7z
 CaHRvGepe7dVd57QGHoBBOTmp5TbkqbxzeSDtiK2Upm8zpwBR+sDBvJRg
 RvSOzvGic9EmN4VLIMLJiyhJriURWEWYAiN/4cB7on53+ktVfaVvzQuhX
 phHUNAezJGoa8EkqBmqQfpxd0Fgd9o7CnW3aMtPethimdpYvNg6dSz+2g g==;
X-CSE-ConnectionGUID: DTpJFOZBQ76jB4ABMgh+Jg==
X-CSE-MsgGUID: QQj8f8B2RwCGELfTqIr8Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77293513"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77293513"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:52:21 -0700
X-CSE-ConnectionGUID: 5M/cA1WiQE6EG0/8ykWk7w==
X-CSE-MsgGUID: Z5dHeWRESCSWjzduN9iYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234979991"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:52:19 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 4/4] tests/intel/kms_pm_dc: Add new test for dc3co
 framedrop validation
Date: Tue, 14 Apr 2026 15:20:14 +0530
Message-ID: <20260414095014.55950-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414095014.55950-1-jeevan.b@intel.com>
References: <20260414095014.55950-1-jeevan.b@intel.com>
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

v2: update check_dc3co_framedrop for detecting frame drops via
    drmWaitVBlank vblank sequence numbers, checks DC3CO counter
    to confirm entry and cast variable 'delay'.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 109 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 910263c9f..ff7bc84ec 100644
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
@@ -338,6 +342,91 @@ static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
 	cleanup_dc3co_fbs(data);
 }
 
+static void setup_dc3co_for_framedrop(data_t *data, enum psr_mode mode)
+{
+	data->op_psr_mode = mode;
+	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
+	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
+		      "%s is not enabled\n",
+		      mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
+}
+
+static void check_dc3co_framedrop(data_t *data)
+{
+	igt_plane_t *primary;
+	uint32_t dc3co_prev_cnt;
+	uint32_t prev_seq = 0, cur_seq = 0, diff = 0;
+	int delay;
+	int frame_count = 0, frame_drops = 0;
+	int max_count = 60;
+	bool dc3co_flag = false;
+	drmVBlank wait;
+	igt_crtc_t *crtc = data->output->pending_crtc;
+	uint32_t vbl_flags;
+
+	igt_require_f(data->mode->vrefresh != 0, "Invalid vrefresh rate of 0\n");
+
+	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+
+	/* Calculate delay to generate idle frame in usec */
+	delay = (int)(1.5 * ((1000 * 1000) / data->mode->vrefresh));
+
+	vbl_flags = kmstest_get_vbl_flag(crtc->pipe);
+
+	/* Get initial vblank sequence number */
+	memset(&wait, 0, sizeof(wait));
+	wait.request.type = vbl_flags | DRM_VBLANK_RELATIVE;
+	wait.request.sequence = 1;
+	drmWaitVBlank(data->drm_fd, &wait);
+	prev_seq = wait.reply.sequence;
+
+	while (frame_count < max_count) {
+		igt_plane_set_fb(primary, &data->fb_rgb);
+		igt_display_commit(&data->display);
+		usleep(delay);
+
+		igt_plane_set_fb(primary, &data->fb_rgr);
+		igt_display_commit(&data->display);
+		usleep(delay);
+
+		memset(&wait, 0, sizeof(wait));
+		wait.request.type = vbl_flags | DRM_VBLANK_RELATIVE;
+		wait.request.sequence = 1;
+		drmWaitVBlank(data->drm_fd, &wait);
+		cur_seq = wait.reply.sequence;
+
+		diff = cur_seq - prev_seq;
+		if (diff > 1)
+			frame_drops += diff - 1;
+		prev_seq = cur_seq;
+
+		if (!dc3co_flag &&
+		    igt_read_dc_counter(data->debugfs_fd,
+					IGT_INTEL_CHECK_DC3CO) > dc3co_prev_cnt)
+			dc3co_flag = true;
+
+		frame_count++;
+	}
+
+	igt_assert_f(dc3co_flag, "DC3CO was not entered during the test\n");
+	igt_assert_f(frame_drops == 0,
+		     "Frame drops detected: frame_drops=%d, frame_count=%d, max_count=%d, "
+		     "last measured vblank diff=%u\n",
+		     frame_drops, frame_count, max_count, diff);
+}
+
+static void test_dc3co_framedrop(data_t *data, enum psr_mode mode)
+{
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	setup_output(data);
+	setup_dc3co_for_framedrop(data, mode);
+	setup_videoplayback(data);
+	check_dc3co_framedrop(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -687,6 +776,26 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Validate that no frame drops occur during DC3CO entry "
+		     "while alternating framebuffers with PSR2 or Panel Replay active");
+	igt_subtest_with_dynamic("dc3co-framedrop-check") {
+		igt_dynamic("psr2-dc3co-framedrop") {
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+						     PSR_MODE_2, NULL));
+			igt_require_f(IS_TIGERLAKE(data.devid) ||
+				      intel_display_ver(data.devid) >= 35,
+				      "Platform does not support DC3CO with PSR2\n");
+			test_dc3co_framedrop(&data, PSR_MODE_2);
+		}
+		igt_dynamic("pr-dc3co-framedrop") {
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+						     PR_MODE, NULL));
+			igt_require_f(intel_display_ver(data.devid) >= 35,
+				      "Platform does not support DC3CO with Panel Replay\n");
+			test_dc3co_framedrop(&data, PR_MODE);
+		}
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

