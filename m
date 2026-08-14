Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE65C5CFDB
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 12:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A2489906;
	Fri, 14 Aug 2026 12:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHoYFHEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F7010F5C4
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786709249; x=1818245249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZALsfCo8GLeJ0/eJq6hr7WiA6TGHaheTa2RRbUfH2u0=;
 b=VHoYFHEn/JVkc9Ngej1rPT0HWspnzpzBhvgbn2j56K+SfgXfmKt6fqeS
 eogzu554KYBwN8KzaoKfJu8vTW1WiqX6khf3l9KlVEEea8px2I1lUrGzD
 ka9Z8zmDnnbGkYmBvovdObuZlJfPx/l3WQ+zTl6oDwiD2vjeFWmUVSDBM
 zXbBuCyIPYbhisoNfUAUJYbH42YuIF66RBp0D+DS9PR6f/f4afl0oYU8u
 TMRxVMlfwwi00wCEQRAX+rzbK9O/3rvFDJyYAt7evpMINbwJ16TMgmXZv
 Pg1pxMK9vkdFUW4eAiiUf5/8NeWa7Nz5S0iQjVTLMhME7E8Hg9fZ6aVV2 A==;
X-CSE-ConnectionGUID: Ht9aVL9aTcmovn0IesdUIw==
X-CSE-MsgGUID: mEbGFzJAQlC/MvsrQCqZPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98442603"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98442603"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 05:07:29 -0700
X-CSE-ConnectionGUID: juwCrOEvSAe4C0ENkr41RA==
X-CSE-MsgGUID: UwacWcu2RuC6BxNI3nbx9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="257988280"
Received: from unknown (HELO linux-X299-AORUS-Gaming-3-Pro.iind.intel.com)
 ([10.223.34.115])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 05:07:27 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel: Add mode-rejected-max-dotclock subtest
 to kms_cdclk
Date: Fri, 14 Aug 2026 17:46:35 +0530
Message-Id: <20260814121635.168645-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add a subtest that verifies the driver rejects a modeset when the
requested pixel clock exceeds the platform's maximum dotclock
capability. The test reads the max dotclock from debugfs via
igt_get_max_dotclock(), sets the mode clock 50 MHz above, and
asserts the atomic commit fails.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Assisted-by: GitHub Copilot:Claude Opus 4.6
---
 tests/intel/kms_cdclk.c | 64 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 070fba400..33007f6b3 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -44,6 +44,10 @@
  *
  * SUBTEST: plane-scaling
  * Description: Plane scaling test to validate cdclk frequency change.
+ *
+ * SUBTEST: mode-rejected-max-dotclock
+ * Description: Verify that a mode exceeding the maximum pixel clock
+ *              frequency is rejected by the driver.
  */
 
 IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
@@ -354,6 +358,62 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	}
 }
 
+static void test_mode_rejected_max_dotclock(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	int max_dotclock, ret;
+	struct igt_fb fb;
+
+	max_dotclock = igt_get_max_dotclock(data->drm_fd);
+	igt_require_f(max_dotclock > 0,
+		      "Could not read max pixel clock\n");
+
+	for_each_crtc_with_valid_output(display, crtc, output) {
+		drmModeModeInfo mode = *igt_output_get_mode(output);
+
+		igt_output_set_crtc(output, crtc);
+		if (!intel_pipe_output_combo_valid(display)) {
+			igt_output_set_crtc(output, NULL);
+			continue;
+		}
+
+		/* Set clock above PHY max */
+		mode.clock = max_dotclock + 50000;
+
+		igt_display_reset(display);
+		igt_output_set_crtc(output, crtc);
+		igt_output_override_mode(output, &mode);
+
+		igt_create_pattern_fb(data->drm_fd,
+				      mode.hdisplay, mode.vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_plane_set_fb(igt_output_get_plane_type(output,
+				 DRM_PLANE_TYPE_PRIMARY), &fb);
+
+		ret = igt_display_try_commit_atomic(display,
+						    DRM_MODE_ATOMIC_ALLOW_MODESET,
+						    NULL);
+
+		igt_info("Output %s: clock=%dkHz (max=%dkHz) -> %s\n",
+			 output->name, mode.clock, max_dotclock,
+			 ret ? "rejected" : "accepted");
+
+		igt_assert_f(ret != 0,
+			     "Mode with clock=%dkHz exceeding max=%dkHz "
+			     "should be rejected on %s\n",
+			     mode.clock, max_dotclock, output->name);
+
+		igt_plane_set_fb(igt_output_get_plane_type(output,
+				 DRM_PLANE_TYPE_PRIMARY), NULL);
+		igt_output_set_crtc(output, NULL);
+		igt_remove_fb(data->drm_fd, &fb);
+		break;
+	}
+}
+
 int igt_main()
 {
 	data_t data = {};
@@ -384,6 +444,10 @@ int igt_main()
 	igt_subtest("mode-transition-all-outputs")
 		test_mode_transition_on_all_outputs(&data);
 
+	igt_describe("Verify that a mode exceeding max pixel clock is rejected.");
+	igt_subtest("mode-rejected-max-dotclock")
+		test_mode_rejected_max_dotclock(&data);
+
 	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

