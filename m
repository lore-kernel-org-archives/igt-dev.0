Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33958C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 06:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEAA10E070;
	Tue,  8 Sep 2026 06:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOj0fyWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BC710E070
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 06:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788848194; x=1820384194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8elDUp0afEU1Iv2ybRjbtv2FnxaKjwtZAHiJ+dPczmE=;
 b=lOj0fyWYO9Z6mLNesELygF6Ui76MQzJkqWGJv0rA3tqeeil7ob/kXKI1
 pDcerPsQ8Y7skGdQ9Sz7grLDAV4WBpXmiOvNpKVJXPmCf1rfW/NO0R/kB
 1UFOm0rZjejktz58UCl0MrdvuJclmY2SnkrxENt1/hmT4L8vJaRc3lFs7
 avFpDF0DuoHYdsu2JjgmCSVDeUqGmvO8Azyp8u+jSWMNEB3FhKX2JHuQp
 M2pq1mhNrqPzTFQ43j4ccIsCPv4ZMFRDSzRTdzUTNfC3upTcQfFsfr9A+
 FPBOggKjqjuhz9i81kBZxHTxjDbzzdDG1CpHQ0fsMllb5pJ7xaIcN4KAT g==;
X-CSE-ConnectionGUID: qFMXAt+0TTOc0Qw/0vM8Jw==
X-CSE-MsgGUID: hLkscAiETxq5evlRKkvpWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88998246"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="88998246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:16:34 -0700
X-CSE-ConnectionGUID: kS5wwHL0S9muZa7tdX/2Bw==
X-CSE-MsgGUID: Lo/e6y6eQUG3fy/i1+dzhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274679727"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 23:16:33 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 2/2] tests/intel: Add mode-rejected-max-dotclock subtest to
 kms_cdclk
Date: Tue,  8 Sep 2026 11:55:41 +0530
Message-Id: <20260908062541.490631-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260908062541.490631-1-swati2.sharma@intel.com>
References: <20260908062541.490631-1-swati2.sharma@intel.com>
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

v2:
- Call do_cleanup_display() before igt_display_reset()
- Cache the primary plane pointe

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Assisted-by: GitHub Copilot:Claude Opus 4.6
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/intel/kms_cdclk.c | 65 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 070fba400..ce6b8eec6 100644
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
@@ -354,6 +358,63 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	}
 }
 
+static void test_mode_rejected_max_dotclock(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	igt_plane_t *primary;
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
+		do_cleanup_display(display);
+		igt_display_reset(display);
+		igt_output_set_crtc(output, crtc);
+		igt_output_override_mode(output, &mode);
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		igt_create_pattern_fb(data->drm_fd,
+				      mode.hdisplay, mode.vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_plane_set_fb(primary, &fb);
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
+		igt_plane_set_fb(primary, NULL);
+		igt_output_set_crtc(output, NULL);
+		igt_remove_fb(data->drm_fd, &fb);
+		break;
+	}
+}
+
 int igt_main()
 {
 	data_t data = {};
@@ -384,6 +445,10 @@ int igt_main()
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

