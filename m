Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA87CD3427
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 18:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775BC10E13C;
	Tue,  5 May 2026 18:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdIbcVBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D4A10E45B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 18:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778004316; x=1809540316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jIVGOl+Y9S/S8mhec+H98Q5e2Oguetn7p6E/muBxqsE=;
 b=CdIbcVBf7WdjwPvLxI/wKvQnix2n7AWjsPzh6pmV/mGVehx8B9wLy24W
 e6CLibrOnONxeF/yI1eUgv6SriaCQvO6MRU607Wu9F+D2ebwx7oaac2Jm
 gQTSr8ieKVCcp6Nl5ziHb1tHtAVaedORJkkKPRXv06L/dqBkovvw9D2GB
 /wC5tbQPAC3bFWonD4AuVBwJ5lpVpZ6vpyqKve2IuPJ5RNCI4z942eADn
 ZmAckx3+pPn08h3sQKXt4FGP95VoP9TfZVTVUFKsRfm8nB03VM4C9Jisb
 cxEmur8RcfeFQXACBKNBooa26golsJ4yzVFwejt3m9bmuu/5ga4BAECaZ Q==;
X-CSE-ConnectionGUID: IwFcLy1KSk+dvLrhQeB1iA==
X-CSE-MsgGUID: OKx7Le5FS1WtBvIgzVHOfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90344408"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="90344408"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:05:16 -0700
X-CSE-ConnectionGUID: RraNlXxxQ0mZuO2xYrPwWw==
X-CSE-MsgGUID: woNEaOvSTsakijOqwU6l/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="239869178"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 11:05:13 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add suspend/resume
 audio tests
Date: Tue,  5 May 2026 23:33:27 +0530
Message-ID: <20260505180327.172380-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c | 121 ++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index df8d27c0c..ed8c9de7b 100644
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
@@ -695,6 +701,23 @@ static bool check_audio_configuration(struct alsa *alsa,
 	return true;
 }
 
+static bool run_audio_test_once(chamelium_data_t *data, struct alsa *alsa,
+				struct chamelium_port *port,
+				snd_pcm_format_t format,
+				int channels, int sampling_rate)
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
 static const char test_display_audio_desc[] =
 	"Playback various audio signals with various audio formats/rates, "
 	"capture them and check they are correct";
@@ -789,6 +812,94 @@ static void test_display_audio(chamelium_data_t *data,
 	free(alsa);
 }
 
+static const char test_display_audio_suspend_resume_desc[] =
+	"Verify audio works before and after system suspend/resume";
+static void test_display_audio_suspend_resume(chamelium_data_t *data,
+					      struct chamelium_port *port,
+					      const char *audio_device,
+					      enum igt_custom_edid_type edid)
+{
+	bool run, success;
+	struct alsa *alsa;
+	int ret;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	struct igt_fb fb;
+	drmModeModeInfo *mode;
+	drmModeConnector *connector;
+	int fb_id, i, j;
+	int channels, sampling_rate;
+	snd_pcm_format_t format;
+
+	igt_require(alsa_has_exclusive_access());
+
+	igt_require(chamelium_has_audio_support(data->chamelium, port));
+
+	alsa = alsa_init();
+	igt_assert(alsa);
+
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+
+	output = chamelium_prepare_output(data, port, edid);
+	connector = chamelium_port_get_connector(data->chamelium, port, false);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_assert(primary);
+
+	igt_assert(connector->count_modes > 0);
+	mode = &connector->modes[0];
+
+	fb_id = igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay,
+					    mode->vdisplay, DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR, 0, 0, 0,
+					    &fb);
+	igt_assert(fb_id > 0);
+
+	chamelium_enable_output(data, port, output, mode, &fb);
+
+	run = false;
+	success = true;
+	for (i = 0; i < test_sampling_rates_count; i++) {
+		for (j = 0; j < test_formats_count; j++) {
+			ret = alsa_open_output(alsa, audio_device);
+			igt_assert_f(ret >= 0, "Failed to open ALSA output\n");
+
+			format = test_formats[j];
+			channels = PLAYBACK_CHANNELS;
+			sampling_rate = test_sampling_rates[i];
+
+			if (!check_audio_configuration(alsa, format, channels,
+						       sampling_rate)) {
+				alsa_close_output(alsa);
+				continue;
+			}
+
+			run = true;
+
+			success &= run_audio_test_once(data, alsa, port, format,
+						       channels, sampling_rate);
+
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+						      SUSPEND_TEST_NONE);
+
+			success &= run_audio_test_once(data, alsa, port, format,
+						       channels, sampling_rate);
+
+			alsa_close_output(alsa);
+		}
+	}
+
+	igt_assert(run);
+	igt_assert(success);
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
@@ -866,6 +977,11 @@ int igt_main()
 	connector_subtest("dp-audio-edid", DisplayPort, &data, test_display_audio_edid,
 			  IGT_CUSTOM_EDID_DP_AUDIO);
 
+	igt_describe(test_display_audio_suspend_resume_desc);
+	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
+			  test_display_audio_suspend_resume,
+			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
+
 	igt_describe("HDMI tests");
 
 	igt_describe(test_display_audio_desc);
@@ -876,6 +992,11 @@ int igt_main()
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

