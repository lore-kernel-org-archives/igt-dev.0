Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B35C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 12:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F92710E840;
	Mon, 29 Jun 2026 12:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/bNMC8E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6541410E840
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782734498; x=1814270498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VJ9Km3cA68V9Ue77ZD5a6i1t0JpAbCEx3SOlui5wuxA=;
 b=R/bNMC8ESHnaLJVIeCGU+7H9E/qUBe2QFwWq0mZ1T9RUlrH6Y1Q001ST
 fx+FxlbUiSXuhNuqEw1FN3gONJiUFyVSaBi2vPbjG9rjuL78+mUD7/ySf
 HtGc8Qzq0Ts33wH3B4JX+ysApp1Im6xSvEZRRRLx5GfE6896g1xMhlfc0
 rNfVESRQbA7jAwGb6khocwoBz7V6ylm9J619Vtid0meY+hanoOLmLjqwk
 fCVTSH8BI3rVTdSF7Qd8IiKsrbmPoa3OqyrdMHH63NbmTb1lU+A/6tsYf
 +UArn6dii2qBeWMD5IWqC4TZZ9Rx6Nl3EpmJDK6Qo3//nMPf8Gmn+KX3t A==;
X-CSE-ConnectionGUID: XgC0HaRaRCyyA3dP2bFiGg==
X-CSE-MsgGUID: ZaOeJ0R5TU2B7ZsP4bvcmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94075768"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94075768"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 05:01:38 -0700
X-CSE-ConnectionGUID: LLee1bCRROaszUiOWzHEJg==
X-CSE-MsgGUID: MhPMhFXtSca74+ik3q/u3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="252071646"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:01:37 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, pranay.samala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add suspend/resume
 audio tests
Date: Mon, 29 Jun 2026 17:31:29 +0530
Message-ID: <20260629120129.3412130-1-jeevan.b@intel.com>
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

Add test to validate audio works after suspend/resume on HDMI/DP
connector.

v2: Perform a single suspend/resume for all audio combinations.
    Re-enable chamelium after suspend and separate pre-suspend
    and post-resume validation paths for clearer failure diagnostics.
v3: Drop commit and use igt_assert_f with explicit messages to
    distinguish failure in audio tests.
v4: Updated test to avoid false-pass on zero executed configs.
    Replace post-suspend forced re-enable with connector
    re-probe/connected checks.
v5: Remove unused variable and add chamelium_assert_reachable check.
v6: Skip suspend/resume subtest when pre-suspend audio validation fails,
    and update suspend subtest descriptions.
v7: Update fixture handles cleanup regardless of skip/assert.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c  | 158 ++++++++++++++++++++++++-
 tests/chamelium/kms_chamelium_helper.h |   3 +
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index df8d27c0c..e3c0e4b86 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -52,6 +52,12 @@
  * SUBTEST: hdmi-audio-edid
  * Description: Plug a connector with an EDID suitable for audio, check ALSA's
  *              EDID-Like Data reports the correct audio parameters
+ *
+ * SUBTEST: dp-audio-after-suspend
+ * Description: Verify audio works after system suspend/resume
+ *
+ * SUBTEST: hdmi-audio-after-suspend
+ * Description: Verify audio works after system suspend/resume
  */
 
 /* Playback parameters control the audio signal we synthesize and send */
@@ -695,6 +701,66 @@ static bool check_audio_configuration(struct alsa *alsa,
 	return true;
 }
 
+static bool run_audio_test_once(chamelium_data_t *data,
+				struct alsa *alsa,
+				struct chamelium_port *port,
+				snd_pcm_format_t format,
+				int channels,
+				int sampling_rate)
+{
+	struct audio_state state;
+	bool success;
+
+	audio_state_init(&state, data, alsa, port, format, channels,
+			 sampling_rate);
+	success = test_audio_frequencies(&state);
+	success &= test_audio_flatline(&state);
+	audio_state_fini(&state);
+
+	return success;
+}
+
+static bool run_audio_tests(chamelium_data_t *data,
+			    struct alsa *alsa,
+			    struct chamelium_port *port,
+			    const char *audio_device)
+{
+	bool run = false;
+	bool success = true;
+	int ret, i, j;
+	int channels, sampling_rate;
+	snd_pcm_format_t format;
+
+	for (i = 0; i < test_sampling_rates_count; i++) {
+		for (j = 0; j < test_formats_count; j++) {
+			ret = alsa_open_output(alsa, audio_device);
+			igt_assert_f(ret >= 0,
+				     "Failed to open ALSA output\n");
+
+			format = test_formats[j];
+			channels = PLAYBACK_CHANNELS;
+			sampling_rate = test_sampling_rates[i];
+
+			if (!check_audio_configuration(alsa, format,
+						       channels,
+						       sampling_rate)) {
+				alsa_close_output(alsa);
+				continue;
+			}
+
+			run = true;
+
+			success &= run_audio_test_once(data, alsa, port,
+					      format, channels,
+					      sampling_rate);
+
+			alsa_close_output(alsa);
+		}
+	}
+
+	return run && success;
+}
+
 static const char test_display_audio_desc[] =
 	"Playback various audio signals with various audio formats/rates, "
 	"capture them and check they are correct";
@@ -762,8 +828,10 @@ static void test_display_audio(chamelium_data_t *data,
 			sampling_rate = test_sampling_rates[i];
 
 			if (!check_audio_configuration(alsa, format, channels,
-						       sampling_rate))
+						       sampling_rate)) {
+				alsa_close_output(alsa);
 				continue;
+			}
 
 			run = true;
 
@@ -789,6 +857,75 @@ static void test_display_audio(chamelium_data_t *data,
 	free(alsa);
 }
 
+static const char test_display_audio_suspend_resume_desc[] =
+	"Verify audio works after system suspend/resume";
+static void test_display_audio_suspend_resume(
+				chamelium_data_t *data,
+				struct chamelium_port *port,
+				const char *audio_device,
+				enum igt_custom_edid_type edid)
+{
+	struct alsa *alsa;
+	igt_output_t *output;
+	struct igt_fb fb;
+	drmModeModeInfo *mode;
+	drmModeConnector *connector;
+	int fb_id;
+
+	igt_require(alsa_has_exclusive_access());
+
+	igt_require(chamelium_has_audio_support(data->chamelium,
+						port));
+
+	alsa = alsa_init();
+	igt_assert(alsa);
+	data->audio_alsa = alsa;
+
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+			      port, data->ports,
+			      data->port_count);
+	output = chamelium_prepare_output(data, port, edid);
+
+	connector = chamelium_port_get_connector(data->chamelium,
+						 port, false);
+	data->audio_connector = connector;
+	igt_assert(connector->count_modes > 0);
+
+	mode = &connector->modes[0];
+
+	fb_id = igt_create_color_pattern_fb(data->drm_fd,
+					    mode->hdisplay,
+					    mode->vdisplay,
+					    DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
+					    0, 0, 0, &fb);
+	igt_assert(fb_id > 0);
+	data->audio_fb = fb;
+
+	chamelium_enable_output(data, port, output,
+				mode, &fb);
+
+	igt_skip_on_f(!run_audio_tests(data, alsa, port, audio_device),
+		      "Audio test setup failed, skipping suspend/resume audio test\n");
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+				      SUSPEND_TEST_NONE);
+	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
+
+	/* Re-probe connector state after resume instead of forcing a re-enable. */
+	drmModeFreeConnector(connector);
+	connector = chamelium_port_get_connector(data->chamelium, port, true);
+	data->audio_connector = connector;
+	igt_assert_f(connector->connection == DRM_MODE_CONNECTED,
+		     "Connector disconnected after suspend/resume\n");
+	igt_assert_f(connector->count_modes > 0,
+		     "No modes available after suspend/resume\n");
+
+	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
+		     "Audio test failed after suspend\n");
+}
+
 static const char test_display_audio_edid_desc[] =
 	"Plug a connector with an EDID suitable for audio, check ALSA's "
 	"EDID-Like Data reports the correct audio parameters";
@@ -854,6 +991,9 @@ int igt_main()
 
 	igt_fixture() {
 		chamelium_init_test(&data);
+		data.audio_alsa = NULL;
+		data.audio_connector = NULL;
+		data.audio_fb.fb_id = 0;
 	}
 
 	igt_describe("DisplayPort tests");
@@ -866,6 +1006,11 @@ int igt_main()
 	connector_subtest("dp-audio-edid", DisplayPort, &data, test_display_audio_edid,
 			  IGT_CUSTOM_EDID_DP_AUDIO);
 
+	igt_describe(test_display_audio_suspend_resume_desc);
+	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
+			  test_display_audio_suspend_resume,
+			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
+
 	igt_describe("HDMI tests");
 
 	igt_describe(test_display_audio_desc);
@@ -876,7 +1021,18 @@ int igt_main()
 	connector_subtest("hdmi-audio-edid", HDMIA, &data, test_display_audio_edid,
 			  IGT_CUSTOM_EDID_HDMI_AUDIO);
 
+	igt_describe(test_display_audio_suspend_resume_desc);
+	connector_subtest("hdmi-audio-after-suspend", HDMIA, &data,
+			  test_display_audio_suspend_resume,
+			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
+
 	igt_fixture() {
+		if (data.audio_fb.fb_id)
+			igt_remove_fb(data.drm_fd, &data.audio_fb);
+		if (data.audio_connector)
+			drmModeFreeConnector(data.audio_connector);
+		free(data.audio_alsa);
+
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/chamelium/kms_chamelium_helper.h b/tests/chamelium/kms_chamelium_helper.h
index 606079666..65c6067db 100644
--- a/tests/chamelium/kms_chamelium_helper.h
+++ b/tests/chamelium/kms_chamelium_helper.h
@@ -81,6 +81,9 @@ typedef struct {
 	int drm_fd;
 
 	struct chamelium_edid *edids[IGT_CUSTOM_EDID_COUNT];
+	struct alsa *audio_alsa;
+	struct igt_fb audio_fb;
+	drmModeConnector *audio_connector;
 } chamelium_data_t;
 
 void chamelium_init_test(chamelium_data_t *data);
-- 
2.43.0

