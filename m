Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AB8E8304A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 03:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951E610E4F0;
	Tue,  3 Feb 2026 03:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMgPxlJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4E510E4F0
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 03:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770090468; x=1801626468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AkFmA9uXWt2402dHSIysU6W6+I1edXYEpoDfx5ICsG8=;
 b=ZMgPxlJjag/+pcw+WCJSCvsAbBDN1xdGDIb/wEeISJsW7U5KNYGU0C0Y
 a8Anyj8Gj6AqEfj7ozsPh6yo2xMUk/A2vFL66HMpC9s6rg86RQefqDrKH
 LpkXDXjz7Xv7LgrdoMaO5m0Q/p7Da10wz1TQXYRNeJXmcmtepHhZo/onk
 e2pQCdv9019MiuDU8eLxRS/zTwZQ/n7GtC8hIysjwN3JMNxq1HNclinFd
 yfyd+pmPpFxOFr2j9CXfgJEu8BbBD3czEdGWN4uP81jFUrY8RXQvWeWLL
 ttBwwRUpliBQr85Kbccg7d0WuNTNW12O7pxX2Up5KUfWLzy+7WmpMXDze w==;
X-CSE-ConnectionGUID: jrB6UItlTeK08e+tBEYB9A==
X-CSE-MsgGUID: 4i1JxXyUQ8qTGtPmbFxMOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58834608"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="58834608"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:47:47 -0800
X-CSE-ConnectionGUID: 9WG8BCjfRhOcF01lbzCC2A==
X-CSE-MsgGUID: yT93aapzQf6Ovomug2DvhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247313464"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:47:45 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v7 3/3] tests/chamelium: Rename connector_test to
 connector_subtest
Date: Tue,  3 Feb 2026 09:15:46 +0530
Message-ID: <20260203034546.1516152-4-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260203034546.1516152-1-mohammed.bilal@intel.com>
References: <20260203034546.1516152-1-mohammed.bilal@intel.com>
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

Remove the old connector_subtest macro and rename connector_test to
connector_subtest everywhere, consolidating on a single macro name
while keeping the improved implementation that properly handles
connector iteration and skipping.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c  | 16 ++---
 tests/chamelium/kms_chamelium_edid.c   | 64 +++++++++--------
 tests/chamelium/kms_chamelium_frames.c | 42 +++++------
 tests/chamelium/kms_chamelium_helper.h |  9 +--
 tests/chamelium/kms_chamelium_hpd.c    | 99 +++++++++++++-------------
 5 files changed, 114 insertions(+), 116 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 030a01051..df8d27c0c 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -859,22 +859,22 @@ int igt_main()
 	igt_describe("DisplayPort tests");
 
 	igt_describe(test_display_audio_desc);
-	connector_test("dp-audio", DisplayPort, &data, test_display_audio,
-		       "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
+	connector_subtest("dp-audio", DisplayPort, &data, test_display_audio,
+			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
 
 	igt_describe(test_display_audio_edid_desc);
-	connector_test("dp-audio-edid", DisplayPort, &data, test_display_audio_edid,
-		       IGT_CUSTOM_EDID_DP_AUDIO);
+	connector_subtest("dp-audio-edid", DisplayPort, &data, test_display_audio_edid,
+			  IGT_CUSTOM_EDID_DP_AUDIO);
 
 	igt_describe("HDMI tests");
 
 	igt_describe(test_display_audio_desc);
-	connector_test("hdmi-audio", HDMIA, &data, test_display_audio,
-		       "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
+	connector_subtest("hdmi-audio", HDMIA, &data, test_display_audio,
+			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
 
 	igt_describe(test_display_audio_edid_desc);
-	connector_test("hdmi-audio-edid", HDMIA, &data, test_display_audio_edid,
-		       IGT_CUSTOM_EDID_HDMI_AUDIO);
+	connector_subtest("hdmi-audio-edid", HDMIA, &data, test_display_audio_edid,
+			  IGT_CUSTOM_EDID_HDMI_AUDIO);
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 4b156dbcb..f5647dde0 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -540,69 +540,71 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("DisplayPort tests");
 
 	igt_describe(igt_custom_edid_type_read_desc);
-	connector_test("dp-edid-read", DisplayPort, &data, edid_read_base_and_alt,
-		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+	connector_subtest("dp-edid-read", DisplayPort, &data, edid_read_base_and_alt,
+			  IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
 
 	igt_describe(igt_edid_stress_resolution_desc);
-	connector_test("dp-edid-stress-resolution-4k", DisplayPort, &data,
-		       edid_stress_resolution, DP_EDIDS_4K, ARRAY_SIZE(DP_EDIDS_4K), false);
+	connector_subtest("dp-edid-stress-resolution-4k", DisplayPort, &data,
+			  edid_stress_resolution, DP_EDIDS_4K,
+			  ARRAY_SIZE(DP_EDIDS_4K), false);
 
 	igt_describe(igt_edid_stress_resolution_desc);
-	connector_test("dp-edid-stress-resolution-non-4k", DisplayPort, &data,
-		       edid_stress_resolution, DP_EDIDS_NON_4K, ARRAY_SIZE(DP_EDIDS_NON_4K), false);
+	connector_subtest("dp-edid-stress-resolution-non-4k", DisplayPort, &data,
+			  edid_stress_resolution, DP_EDIDS_NON_4K,
+			  ARRAY_SIZE(DP_EDIDS_NON_4K), false);
 
 	igt_describe(igt_edid_resolution_list_desc);
-	connector_test("dp-edid-resolution-list", DisplayPort, &data, edid_resolution_list);
+	connector_subtest("dp-edid-resolution-list", DisplayPort, &data, edid_resolution_list);
 
 	igt_describe(test_suspend_resume_edid_change_desc);
-	connector_test("dp-edid-change-during-suspend", DisplayPort, &data,
-		       test_suspend_resume_edid_change, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE,
-		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+	connector_subtest("dp-edid-change-during-suspend", DisplayPort, &data,
+			  test_suspend_resume_edid_change, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE,
+			  IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
 
 	igt_describe(test_suspend_resume_edid_change_desc);
-	connector_test("dp-edid-change-during-hibernate", DisplayPort, &data,
-		       test_suspend_resume_edid_change, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES,
-		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+	connector_subtest("dp-edid-change-during-hibernate", DisplayPort, &data,
+			  test_suspend_resume_edid_change, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES,
+			  IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
 
 	igt_describe(test_mode_timings_desc);
-	connector_test("dp-mode-timings", DisplayPort, &data, test_mode_timings);
+	connector_subtest("dp-mode-timings", DisplayPort, &data, test_mode_timings);
 
 	igt_describe("HDMI tests");
 
 	igt_describe(igt_custom_edid_type_read_desc);
-	connector_test("hdmi-edid-read", HDMIA, &data, edid_read_base_and_alt,
-		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+	connector_subtest("hdmi-edid-read", HDMIA, &data, edid_read_base_and_alt,
+			  IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
 
 	igt_describe(igt_edid_stress_resolution_desc);
-	connector_test("hdmi-edid-stress-resolution-4k", HDMIA, &data,
-		       edid_stress_resolution, HDMI_EDIDS_4K, ARRAY_SIZE(HDMI_EDIDS_4K), false);
+	connector_subtest("hdmi-edid-stress-resolution-4k", HDMIA, &data,
+			  edid_stress_resolution, HDMI_EDIDS_4K, ARRAY_SIZE(HDMI_EDIDS_4K), false);
 
 	igt_describe(igt_edid_stress_resolution_desc);
-	connector_test("hdmi-edid-stress-resolution-non-4k", HDMIA, &data,
-		       edid_stress_resolution, HDMI_EDIDS_NON_4K,
-		       ARRAY_SIZE(HDMI_EDIDS_NON_4K), true);
+	connector_subtest("hdmi-edid-stress-resolution-non-4k", HDMIA, &data,
+			  edid_stress_resolution, HDMI_EDIDS_NON_4K,
+			  ARRAY_SIZE(HDMI_EDIDS_NON_4K), true);
 
 	igt_describe(test_suspend_resume_edid_change_desc);
-	connector_test("hdmi-edid-change-during-suspend", HDMIA, &data,
-		       test_suspend_resume_edid_change, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE,
-		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+	connector_subtest("hdmi-edid-change-during-suspend", HDMIA, &data,
+			  test_suspend_resume_edid_change, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE,
+			  IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
 
 	igt_describe(test_suspend_resume_edid_change_desc);
-	connector_test("hdmi-edid-change-during-hibernate", HDMIA, &data,
-		       test_suspend_resume_edid_change, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES,
-		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+	connector_subtest("hdmi-edid-change-during-hibernate", HDMIA, &data,
+			  test_suspend_resume_edid_change, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES,
+			  IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
 
 	igt_describe(test_mode_timings_desc);
-	connector_test("hdmi-mode-timings", HDMIA, &data, test_mode_timings);
+	connector_subtest("hdmi-mode-timings", HDMIA, &data, test_mode_timings);
 
 	igt_describe("VGA tests");
 
 	igt_describe(igt_custom_edid_type_read_desc);
-	connector_test("vga-edid-read", VGA, &data, edid_read_base_and_alt,
-		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+	connector_subtest("vga-edid-read", VGA, &data, edid_read_base_and_alt,
+			  IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
-		drm_close_driver(data.drm_fd);
+drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 782275590..efd9ff1b7 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -997,33 +997,33 @@ int igt_main()
 	igt_describe("DisplayPort tests");
 
 	igt_describe(test_display_all_modes_desc);
-	connector_test("dp-crc-single", DisplayPort, &data, test_display_all_modes,
-		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
+	connector_subtest("dp-crc-single", DisplayPort, &data, test_display_all_modes,
+			  DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
 
 	igt_describe(test_display_one_mode_desc);
-	connector_test("dp-crc-fast", DisplayPort, &data, test_display_one_mode,
-		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
+	connector_subtest("dp-crc-fast", DisplayPort, &data, test_display_one_mode,
+			  DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
 
 	igt_describe(test_display_all_modes_desc);
-	connector_test("dp-crc-multiple", DisplayPort, &data, test_display_all_modes,
-		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 3);
+	connector_subtest("dp-crc-multiple", DisplayPort, &data, test_display_all_modes,
+			  DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 3);
 
 	igt_describe(test_display_frame_dump_desc);
-	connector_test("dp-frame-dump", DisplayPort, &data, test_display_frame_dump);
+	connector_subtest("dp-frame-dump", DisplayPort, &data, test_display_frame_dump);
 
 	igt_describe("HDMI tests");
 
 	igt_describe(test_display_all_modes_desc);
-	connector_test("hdmi-crc-single", HDMIA, &data, test_display_all_modes,
-		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
+	connector_subtest("hdmi-crc-single", HDMIA, &data, test_display_all_modes,
+			  DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
 
 	igt_describe(test_display_one_mode_desc);
-	connector_test("hdmi-crc-fast", HDMIA, &data, test_display_one_mode,
-		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
+	connector_subtest("hdmi-crc-fast", HDMIA, &data, test_display_one_mode,
+			  DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
 
 	igt_describe(test_display_all_modes_desc);
-	connector_test("hdmi-crc-multiple", HDMIA, &data, test_display_all_modes,
-		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 3);
+	connector_subtest("hdmi-crc-multiple", HDMIA, &data, test_display_all_modes,
+			  DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 3);
 
 	igt_describe(test_display_one_mode_desc);
 	connector_dynamic_subtest("hdmi-crc-nonplanar-formats", HDMIA)
@@ -1061,8 +1061,8 @@ int igt_main()
 		}
 
 	igt_describe(test_display_planes_random_desc);
-	connector_test("hdmi-crc-planes-random", HDMIA, &data, test_display_planes_random,
-		       CHAMELIUM_CHECK_CRC);
+	connector_subtest("hdmi-crc-planes-random", HDMIA, &data, test_display_planes_random,
+			  CHAMELIUM_CHECK_CRC);
 
 	igt_describe(test_display_one_mode_desc);
 	connector_dynamic_subtest("hdmi-cmp-planar-formats", HDMIA)
@@ -1101,20 +1101,20 @@ int igt_main()
 		}
 
 	igt_describe(test_display_planes_random_desc);
-	connector_test("hdmi-cmp-planes-random", HDMIA, &data, test_display_planes_random,
-		       CHAMELIUM_CHECK_CHECKERBOARD);
+	connector_subtest("hdmi-cmp-planes-random", HDMIA, &data,
+			  test_display_planes_random, CHAMELIUM_CHECK_CHECKERBOARD);
 
 	igt_describe(test_display_frame_dump_desc);
-	connector_test("hdmi-frame-dump", HDMIA, &data, test_display_frame_dump);
+	connector_subtest("hdmi-frame-dump", HDMIA, &data, test_display_frame_dump);
 
 	igt_describe(test_display_aspect_ratio_desc);
-	connector_test("hdmi-aspect-ratio", HDMIA, &data, test_display_aspect_ratio);
+	connector_subtest("hdmi-aspect-ratio", HDMIA, &data, test_display_aspect_ratio);
 
 	igt_describe("VGA tests");
 
 	igt_describe(test_display_all_modes_desc);
-	connector_test("vga-frame-dump", VGA, &data, test_display_all_modes,
-		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_ANALOG, 1);
+	connector_subtest("vga-frame-dump", VGA, &data, test_display_all_modes,
+			  DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_ANALOG, 1);
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
diff --git a/tests/chamelium/kms_chamelium_helper.h b/tests/chamelium/kms_chamelium_helper.h
index ac776998f..7941ca9d3 100644
--- a/tests/chamelium/kms_chamelium_helper.h
+++ b/tests/chamelium/kms_chamelium_helper.h
@@ -35,13 +35,8 @@
 	for (p = 0, port = data.ports[p]; p < data.port_count; \
 	     p++, port = data.ports[p])
 
-#define connector_subtest(name__, type__)                           \
-	igt_subtest(name__)                                         \
-	for_each_port(p, port) if (chamelium_port_get_type(port) == \
-				   DRM_MODE_CONNECTOR_##type__)
-
 /**
- * connector_test() - Run a subtest for all ports of a given connector type
+ * connector_subtest() - Run a subtest for all ports of a given connector type
  *
  * Defines a subtest that iterates over all available Chamelium ports and
  * executes the provided test function for each port matching the requested
@@ -52,7 +47,7 @@
  * consistent pattern for running connector-specific tests.
  */
 
-#define connector_test(name__, connector_type__, data__, test_fn__, ...)		\
+#define connector_subtest(name__, connector_type__, data__, test_fn__, ...)		\
 	do {										\
 		igt_subtest(name__) {							\
 			int p__;							\
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index dd1735956..672c23a64 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -473,109 +473,110 @@ int igt_main()
 	igt_describe("DisplayPort tests");
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("dp-hpd", DisplayPort, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+	connector_subtest("dp-hpd", DisplayPort, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("dp-hpd-fast", DisplayPort, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+	connector_subtest("dp-hpd-fast", DisplayPort, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("dp-hpd-enable-disable-mode", DisplayPort, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+	connector_subtest("dp-hpd-enable-disable-mode", DisplayPort, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("dp-hpd-with-enabled-mode", DisplayPort, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+	connector_subtest("dp-hpd-with-enabled-mode", DisplayPort, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
 
 	igt_describe(test_hotplug_for_each_pipe_desc);
-	connector_test("dp-hpd-for-each-pipe", DisplayPort, &data,
-		       test_hotplug_for_each_pipe);
+	connector_subtest("dp-hpd-for-each-pipe", DisplayPort, &data,
+			  test_hotplug_for_each_pipe);
 
 	igt_describe(test_suspend_resume_hpd_desc);
-	connector_test("dp-hpd-after-suspend", DisplayPort, &data, test_suspend_resume_hpd,
-		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	connector_subtest("dp-hpd-after-suspend", DisplayPort, &data, test_suspend_resume_hpd,
+			  SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
 	igt_describe(test_suspend_resume_hpd_desc);
-	connector_test("dp-hpd-after-hibernate", DisplayPort, &data, test_suspend_resume_hpd,
-		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+	connector_subtest("dp-hpd-after-hibernate", DisplayPort, &data, test_suspend_resume_hpd,
+			  SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
 
 	igt_describe(test_hpd_storm_detect_desc);
-	connector_test("dp-hpd-storm", DisplayPort, &data, test_hpd_storm_detect,
-		       HPD_STORM_PULSE_INTERVAL_DP);
+	connector_subtest("dp-hpd-storm", DisplayPort, &data, test_hpd_storm_detect,
+			  HPD_STORM_PULSE_INTERVAL_DP);
 
 	igt_describe(test_hpd_storm_disable_desc);
-	connector_test("dp-hpd-storm-disable", DisplayPort, &data, test_hpd_storm_disable,
-		       HPD_STORM_PULSE_INTERVAL_DP);
+	connector_subtest("dp-hpd-storm-disable", DisplayPort, &data, test_hpd_storm_disable,
+			  HPD_STORM_PULSE_INTERVAL_DP);
 
 	igt_describe("HDMI tests");
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("hdmi-hpd", HDMIA, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+	connector_subtest("hdmi-hpd", HDMIA, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("hdmi-hpd-fast", HDMIA, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+	connector_subtest("hdmi-hpd-fast", HDMIA, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("hdmi-hpd-enable-disable-mode", HDMIA, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+	connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("hdmi-hpd-with-enabled-mode", HDMIA, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+	connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
 
 	igt_describe(test_hotplug_for_each_pipe_desc);
-	connector_test("hdmi-hpd-for-each-pipe", HDMIA, &data, test_hotplug_for_each_pipe);
+	connector_subtest("hdmi-hpd-for-each-pipe", HDMIA, &data,
+			  test_hotplug_for_each_pipe);
 
 	igt_describe(test_suspend_resume_hpd_desc);
-	connector_test("hdmi-hpd-after-suspend", HDMIA, &data, test_suspend_resume_hpd,
-		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	connector_subtest("hdmi-hpd-after-suspend", HDMIA, &data, test_suspend_resume_hpd,
+			  SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
 	igt_describe(test_suspend_resume_hpd_desc);
-	connector_test("hdmi-hpd-after-hibernate", HDMIA, &data, test_suspend_resume_hpd,
-		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+	connector_subtest("hdmi-hpd-after-hibernate", HDMIA, &data, test_suspend_resume_hpd,
+			  SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
 
 	igt_describe(test_hpd_storm_detect_desc);
-	connector_test("hdmi-hpd-storm", HDMIA, &data, test_hpd_storm_detect,
-		       HPD_STORM_PULSE_INTERVAL_HDMI);
+	connector_subtest("hdmi-hpd-storm", HDMIA, &data, test_hpd_storm_detect,
+			  HPD_STORM_PULSE_INTERVAL_HDMI);
 
 	igt_describe(test_hpd_storm_disable_desc);
-	connector_test("hdmi-hpd-storm-disable", HDMIA, &data, test_hpd_storm_disable,
-		       HPD_STORM_PULSE_INTERVAL_HDMI);
+	connector_subtest("hdmi-hpd-storm-disable", HDMIA, &data, test_hpd_storm_disable,
+			  HPD_STORM_PULSE_INTERVAL_HDMI);
 
 	igt_describe("VGA tests");
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("vga-hpd", VGA, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
+	connector_subtest("vga-hpd", VGA, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("vga-hpd-fast", VGA, &data, test_hotplug,
-		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+	connector_subtest("vga-hpd-fast", VGA, &data, test_hotplug,
+			  HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("vga-hpd-enable-disable-mode", VGA, &data,
-		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+	connector_subtest("vga-hpd-enable-disable-mode", VGA, &data,
+			  test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
 
 	igt_describe(test_basic_hotplug_desc);
-	connector_test("vga-hpd-with-enabled-mode", VGA, &data,
-		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+	connector_subtest("vga-hpd-with-enabled-mode", VGA, &data,
+			  test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
 
 	igt_describe(test_suspend_resume_hpd_desc);
-	connector_test("vga-hpd-after-suspend", VGA, &data,
-		       test_suspend_resume_hpd, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	connector_subtest("vga-hpd-after-suspend", VGA, &data,
+			  test_suspend_resume_hpd, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
 	igt_describe(test_suspend_resume_hpd_desc);
-	connector_test("vga-hpd-after-hibernate", VGA, &data,
-		       test_suspend_resume_hpd, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+	connector_subtest("vga-hpd-after-hibernate", VGA, &data,
+			  test_suspend_resume_hpd, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
 
 	igt_describe(test_hpd_without_ddc_desc);
-	connector_test("vga-hpd-without-ddc", VGA, &data, test_hpd_without_ddc);
+	connector_subtest("vga-hpd-without-ddc", VGA, &data, test_hpd_without_ddc);
 
 	igt_describe(test_hotplug_for_each_pipe_desc);
-	connector_test("vga-hpd-for-each-pipe", VGA, &data, test_hotplug_for_each_pipe);
+	connector_subtest("vga-hpd-for-each-pipe", VGA, &data, test_hotplug_for_each_pipe);
 
 	igt_describe("Tests that operate on all connectors");
 	igt_subtest_group() {
-- 
2.48.1

