Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4F6CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 04:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6554610E466;
	Mon, 11 May 2026 04:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kng7bnne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20D410E466
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 04:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778473227; x=1810009227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H+b1h6S0sYfIVs61pKHdqBuTDmgy/34x2YGhCdFD+is=;
 b=kng7bnne6T/wI4CJMcRmS5wvl0hdP3SpOsn/lCjCid0oVdX5mP80Cgah
 zQNFH1yu49hwGgPRs1R5S0u0mOld37iwT5nYiWnYQzIH4NEC1G79Grhv7
 oATbhTTzLgKGi8qzltTzWpbf4lC4fUV3tyE6Os3+9lGy0IqDdUQFO5891
 IpKL1fSAXg3cTRIZKP0wKWUOBzCERHPGwYk1nDbi5RWQ/1MEpF8yXQ2Gc
 9ZHbkfkvi2sZi7eiYG+5e1zAv/8hLjB4Qt0aMJiBmdbEwHHrFfxYd2e/O
 p7+rh8/P7D8ApLz6Jx/5163ODcevKtoVKpAAQZNC315uDODlY+E8BAeNp w==;
X-CSE-ConnectionGUID: f5pe3pKVSOqvbRGgjtNEBQ==
X-CSE-MsgGUID: s0n9mdX9SbCn+ImPKPvZ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="83225859"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="83225859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 21:20:26 -0700
X-CSE-ConnectionGUID: STARsxHYQHiOkXCjSKo8dw==
X-CSE-MsgGUID: ehxdHpCAQs+86M56pSbcnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="236365900"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 21:20:24 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, mohammed.bilal@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add suspend/resume
 audio tests
Date: Mon, 11 May 2026 09:48:44 +0530
Message-ID: <20260511041844.445925-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c | 133 ++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index df8d27c0c..2fd8322e0 100644
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
@@ -695,6 +701,46 @@ static bool check_audio_configuration(struct alsa *alsa,
 	return true;
 }
 
+static bool run_audio_tests(chamelium_data_t *data,
+			    struct alsa *alsa,
+			    struct chamelium_port *port,
+			    const char *audio_device)
+{
+	bool run = false;
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
+			igt_assert(run_audio_test_once(data, alsa, port,
+						       format, channels,
+						       sampling_rate));
+
+			alsa_close_output(alsa);
+		}
+	}
+
+	return run;
+}
+
 static const char test_display_audio_desc[] =
 	"Playback various audio signals with various audio formats/rates, "
 	"capture them and check they are correct";
@@ -789,6 +835,83 @@ static void test_display_audio(chamelium_data_t *data,
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
+	igt_plane_t *primary;
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
+	primary = igt_output_get_plane_type(output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_assert(primary);
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
+	igt_assert(run_audio_tests(data, alsa, port,
+				   audio_device));
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+				      SUSPEND_TEST_NONE);
+
+	chamelium_enable_output(data, port, output,
+				mode, &fb);
+
+	igt_display_commit2(&data->display,
+			    COMMIT_ATOMIC);
+
+	igt_assert(run_audio_tests(data, alsa, port,
+				   audio_device));
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
@@ -866,6 +989,11 @@ int igt_main()
 	connector_subtest("dp-audio-edid", DisplayPort, &data, test_display_audio_edid,
 			  IGT_CUSTOM_EDID_DP_AUDIO);
 
+	igt_describe(test_display_audio_suspend_resume_desc);
+	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
+			  test_display_audio_suspend_resume,
+			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
+
 	igt_describe("HDMI tests");
 
 	igt_describe(test_display_audio_desc);
@@ -876,6 +1004,11 @@ int igt_main()
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

