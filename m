Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861AECD98F6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 05:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D3910E021;
	Fri, 19 Jun 2026 05:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYhz8vQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D41C10F467
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 05:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781847505; x=1813383505;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SJE/L+EQY1i11hO3uFCyL6XsRDbeXi2VZTQ5HvJ+FvY=;
 b=FYhz8vQW1bppvUax5Rwhd7MDinEDEVTZo1gC7qlhDzuyU1G+SqO/x3Gk
 M7oTuKF0WcJGyjgi0gEvs7rF4EaLZRRK0BeknNj+zKZV6yKGd4bDtg5QX
 loslbc9RSuJ1e51xWNL0SdWSwhbpLYu3WszPr/M0rTvFK0x6J794g4kT5
 2oDAQaAUyXlrrGC4ouvo3p5IhxNRw35Q6O35zz1fJAAnpE46e+DQpKNvg
 Dl2faxqH746AVSESbuboOCN+K/SHxgjOKNksM6LikaoJYQl42noB84ybi
 EZB4n21021g3wh+r+kxQGTKYD76yzrgdy5zgnIs+bmjwT4nOAcZvXANtK w==;
X-CSE-ConnectionGUID: k9Grd8sOTkOjjREDERAPsQ==
X-CSE-MsgGUID: osMFMZabTpKCUak4rcs4ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="100125676"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="100125676"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:38:24 -0700
X-CSE-ConnectionGUID: BLepRDIMQqa+aKOkGElTLw==
X-CSE-MsgGUID: QvrewsDLQrWfVthu43hfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="247676518"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 22:38:22 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, pranay.samala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add suspend/resume
 audio tests
Date: Fri, 19 Jun 2026 11:08:15 +0530
Message-ID: <20260619053815.2881138-1-jeevan.b@intel.com>
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

Add test to validate audio works before and after suspend/resume on
HDMI/DP connector.

v2: Perform a single suspend/resume for all audio combinations.
    Re-enable chamelium after suspend and separate pre-suspend
    and post-resume validation paths for clearer failure diagnostics.
v3: Drop commit and use igt_assert_f with explicit messages to
    distinguish failure in audio tests.
v4: Updated test to avoid false-pass on zero executed configs.
    Replace post-suspend forced re-enable with connector
    re-probe/connected checks.
v5: Remove unused variable and add chamelium_assert_reachable check.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c | 155 +++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index df8d27c0c..144f6a038 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -52,6 +52,12 @@
  * SUBTEST: hdmi-audio-edid
  * Description: Plug a connector with an EDID suitable for audio, check ALSA's
  *              EDID-Like Data reports the correct audio parameters
+ *
+ * SUBTEST: dp-audio-after-suspend
+ * Description: Verify audio works before and after system suspend/resume
+ *
+ * SUBTEST: hdmi-audio-after-suspend
+ * Description: Verify audio works before and after system suspend/resume
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
+					       sampling_rate)) {
+				alsa_close_output(alsa);
 				continue;
+			}
 
 			run = true;
 
@@ -789,6 +857,81 @@ static void test_display_audio(chamelium_data_t *data,
 	free(alsa);
 }
 
+static const char test_display_audio_suspend_resume_desc[] =
+	"Verify audio works before and after system suspend/resume";
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
+
+	igt_modeset_disable_all_outputs(&data->display);
+
+	chamelium_reset_state(&data->display, data->chamelium,
+			      port, data->ports,
+			      data->port_count);
+
+	output = chamelium_prepare_output(data, port, edid);
+
+	connector = chamelium_port_get_connector(data->chamelium,
+						 port, false);
+
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
+
+	igt_assert(fb_id > 0);
+
+	chamelium_enable_output(data, port, output,
+				mode, &fb);
+
+	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
+		     "Audio test failed before suspend\n");
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+				      SUSPEND_TEST_NONE);
+	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
+
+	/* Re-probe connector state after resume instead of forcing a re-enable. */
+	drmModeFreeConnector(connector);
+	connector = chamelium_port_get_connector(data->chamelium, port, true);
+	igt_assert_f(connector->connection == DRM_MODE_CONNECTED,
+		     "Connector disconnected after suspend/resume\n");
+	igt_assert_f(connector->count_modes > 0,
+		     "No modes available after suspend/resume\n");
+
+	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
+		     "Audio test failed after suspend\n");
+
+	igt_remove_fb(data->drm_fd, &fb);
+
+	drmModeFreeConnector(connector);
+
+	free(alsa);
+}
+
 static const char test_display_audio_edid_desc[] =
 	"Plug a connector with an EDID suitable for audio, check ALSA's "
 	"EDID-Like Data reports the correct audio parameters";
@@ -866,6 +1009,11 @@ int igt_main()
 	connector_subtest("dp-audio-edid", DisplayPort, &data, test_display_audio_edid,
 			  IGT_CUSTOM_EDID_DP_AUDIO);
 
+	igt_describe(test_display_audio_suspend_resume_desc);
+	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
+			  test_display_audio_suspend_resume,
+			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
+
 	igt_describe("HDMI tests");
 
 	igt_describe(test_display_audio_desc);
@@ -876,6 +1024,11 @@ int igt_main()
 	connector_subtest("hdmi-audio-edid", HDMIA, &data, test_display_audio_edid,
 			  IGT_CUSTOM_EDID_HDMI_AUDIO);
 
+	igt_describe(test_display_audio_suspend_resume_desc);
+	connector_subtest("hdmi-audio-after-suspend", HDMIA, &data,
+			  test_display_audio_suspend_resume,
+			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
+
 	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.43.0

