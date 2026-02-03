Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF85E8304A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 03:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB0F10E4F7;
	Tue,  3 Feb 2026 03:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pg2tr47s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B5610E4F0
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 03:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770090466; x=1801626466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DKyienAaCd1md5lE1M7FeV+3TKCqlPYbby2cSRFg1rQ=;
 b=Pg2tr47susTMVfpkJ4X4fekdaoOHmqx4BA5G/TqqgyRzhrzxfF8uoptn
 ljvIVaT7lcTsBzFVl/kfRysnBoYljgDY72HxylOpMwiYKgknMnQris9iT
 f0/X6R4KzB2z5zlr+LhkxTeTrc2LK67/YttGHKb7CARsbIy85qwM2Ri6n
 fgjwyiIxx3jQylR+ylNEHenZv/qDYhZfm0DJw0zjlM5QsT/utaETu5K32
 abwjSB4cYhydytHZm5obp6l4fMzBAzBGjLz0wZVkXqtQLfIf0MgXMZM9L
 C9+eVoRYHD9u7VDoHWfeqgSxUE92oG+jTvo+7S/mrcg7cWzfkKjz2MWgl Q==;
X-CSE-ConnectionGUID: 6c57hJQLREeL4+3zPti8PQ==
X-CSE-MsgGUID: VO97QjQGQsyIYN1ZHsXwZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58834605"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="58834605"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:47:45 -0800
X-CSE-ConnectionGUID: zEaplyABQeCWgvKR2YvuIQ==
X-CSE-MsgGUID: 067lYKKtQhuAurblRTIzYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247313458"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:47:43 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v7 2/3] tests/chamelium/kms_chamelium: use helper
 function for connector lookup in DP/HDMI/VGA tests
Date: Tue,  3 Feb 2026 09:15:45 +0530
Message-ID: <20260203034546.1516152-3-mohammed.bilal@intel.com>
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

Use the connector_test() helper macro for chamelium hpd, audio, edid, and
frames tests to iterate over and test all matching connected ports. This
ensures clean skipping and consistent connector handling across DP/HDMI/VGA
tests, and avoids unintended execution of unrelated fixtures.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c  |  42 ++---
 tests/chamelium/kms_chamelium_edid.c   | 183 +++++++------------
 tests/chamelium/kms_chamelium_frames.c | 111 ++++--------
 tests/chamelium/kms_chamelium_hpd.c    | 239 ++++++++++---------------
 4 files changed, 216 insertions(+), 359 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index c89f644ff..030a01051 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -851,48 +851,30 @@ IGT_TEST_DESCRIPTION("Testing Audio with a Chamelium board");
 int igt_main()
 {
 	chamelium_data_t data;
-	struct chamelium_port *port;
-	int p;
 
 	igt_fixture() {
 		chamelium_init_test(&data);
 	}
 
 	igt_describe("DisplayPort tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_display_audio_desc);
-		connector_subtest("dp-audio", DisplayPort) test_display_audio(
-			&data, port, "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
+	igt_describe(test_display_audio_desc);
+	connector_test("dp-audio", DisplayPort, &data, test_display_audio,
+		       "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
 
-		igt_describe(test_display_audio_edid_desc);
-		connector_subtest("dp-audio-edid", DisplayPort)
-			test_display_audio_edid(&data, port,
-						IGT_CUSTOM_EDID_DP_AUDIO);
-	}
+	igt_describe(test_display_audio_edid_desc);
+	connector_test("dp-audio-edid", DisplayPort, &data, test_display_audio_edid,
+		       IGT_CUSTOM_EDID_DP_AUDIO);
 
 	igt_describe("HDMI tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_HDMIA,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_display_audio_desc);
-		connector_subtest("hdmi-audio", HDMIA) test_display_audio(
-			&data, port, "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
+	igt_describe(test_display_audio_desc);
+	connector_test("hdmi-audio", HDMIA, &data, test_display_audio,
+		       "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
 
-		igt_describe(test_display_audio_edid_desc);
-		connector_subtest("hdmi-audio-edid", HDMIA)
-			test_display_audio_edid(&data, port,
-						IGT_CUSTOM_EDID_HDMI_AUDIO);
-	}
+	igt_describe(test_display_audio_edid_desc);
+	connector_test("hdmi-audio-edid", HDMIA, &data, test_display_audio_edid,
+		       IGT_CUSTOM_EDID_HDMI_AUDIO);
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 5b1a063ff..4b156dbcb 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -249,6 +249,15 @@ static void igt_custom_edid_type_read(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
+static void edid_read_base_and_alt(chamelium_data_t *data,
+				    struct chamelium_port *port,
+				    enum igt_custom_edid_type edid_base,
+				    enum igt_custom_edid_type edid_alt)
+{
+	igt_custom_edid_type_read(data, port, edid_base);
+	igt_custom_edid_type_read(data, port, edid_alt);
+}
+
 static const char igt_edid_stress_resolution_desc[] =
 	"Stress test the DUT by testing multiple EDIDs, one right after the other, "
 	"and ensure their validity by check the real screen resolution vs the "
@@ -523,132 +532,74 @@ IGT_TEST_DESCRIPTION("Testing EDID with a Chamelium board");
 int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	chamelium_data_t data;
-	struct chamelium_port *port;
-	int p;
 
 	igt_fixture() {
 		chamelium_init_test(&data);
 	}
 
 	igt_describe("DisplayPort tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
-				data.port_count, 1);
-		}
-
-		igt_describe(igt_custom_edid_type_read_desc);
-		connector_subtest("dp-edid-read", DisplayPort)
-		{
-			igt_custom_edid_type_read(&data, port,
-						  IGT_CUSTOM_EDID_BASE);
-			igt_custom_edid_type_read(&data, port,
-						  IGT_CUSTOM_EDID_ALT);
-		}
-
-		igt_describe(igt_edid_stress_resolution_desc);
-		connector_subtest("dp-edid-stress-resolution-4k", DisplayPort)
-			edid_stress_resolution(&data, port, DP_EDIDS_4K,
-					       ARRAY_SIZE(DP_EDIDS_4K), false);
-
-		igt_describe(igt_edid_stress_resolution_desc);
-		connector_subtest("dp-edid-stress-resolution-non-4k",
-				  DisplayPort)
-			edid_stress_resolution(&data, port, DP_EDIDS_NON_4K,
-					       ARRAY_SIZE(DP_EDIDS_NON_4K), false);
-
-		igt_describe(igt_edid_resolution_list_desc);
-		connector_subtest("dp-edid-resolution-list", DisplayPort)
-			edid_resolution_list(&data, port);
-
-		igt_describe(test_suspend_resume_edid_change_desc);
-		connector_subtest("dp-edid-change-during-suspend", DisplayPort)
-			test_suspend_resume_edid_change(&data, port,
-							SUSPEND_STATE_MEM,
-							SUSPEND_TEST_NONE,
-							IGT_CUSTOM_EDID_BASE,
-							IGT_CUSTOM_EDID_ALT);
-
-		igt_describe(test_suspend_resume_edid_change_desc);
-		connector_subtest("dp-edid-change-during-hibernate",
-				  DisplayPort)
-			test_suspend_resume_edid_change(&data, port,
-							SUSPEND_STATE_DISK,
-							SUSPEND_TEST_DEVICES,
-							IGT_CUSTOM_EDID_BASE,
-							IGT_CUSTOM_EDID_ALT);
-
-		igt_describe(test_mode_timings_desc);
-		connector_subtest("dp-mode-timings", DisplayPort)
-			test_mode_timings(&data, port);
-	}
+
+	igt_describe(igt_custom_edid_type_read_desc);
+	connector_test("dp-edid-read", DisplayPort, &data, edid_read_base_and_alt,
+		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+
+	igt_describe(igt_edid_stress_resolution_desc);
+	connector_test("dp-edid-stress-resolution-4k", DisplayPort, &data,
+		       edid_stress_resolution, DP_EDIDS_4K, ARRAY_SIZE(DP_EDIDS_4K), false);
+
+	igt_describe(igt_edid_stress_resolution_desc);
+	connector_test("dp-edid-stress-resolution-non-4k", DisplayPort, &data,
+		       edid_stress_resolution, DP_EDIDS_NON_4K, ARRAY_SIZE(DP_EDIDS_NON_4K), false);
+
+	igt_describe(igt_edid_resolution_list_desc);
+	connector_test("dp-edid-resolution-list", DisplayPort, &data, edid_resolution_list);
+
+	igt_describe(test_suspend_resume_edid_change_desc);
+	connector_test("dp-edid-change-during-suspend", DisplayPort, &data,
+		       test_suspend_resume_edid_change, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE,
+		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+
+	igt_describe(test_suspend_resume_edid_change_desc);
+	connector_test("dp-edid-change-during-hibernate", DisplayPort, &data,
+		       test_suspend_resume_edid_change, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES,
+		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+
+	igt_describe(test_mode_timings_desc);
+	connector_test("dp-mode-timings", DisplayPort, &data, test_mode_timings);
 
 	igt_describe("HDMI tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_HDMIA,
-				data.port_count, 1);
-		}
-
-		igt_describe(igt_custom_edid_type_read_desc);
-		connector_subtest("hdmi-edid-read", HDMIA)
-		{
-			igt_custom_edid_type_read(&data, port,
-						  IGT_CUSTOM_EDID_BASE);
-			igt_custom_edid_type_read(&data, port,
-						  IGT_CUSTOM_EDID_ALT);
-		}
-
-		igt_describe(igt_edid_stress_resolution_desc);
-		connector_subtest("hdmi-edid-stress-resolution-4k", HDMIA)
-			edid_stress_resolution(&data, port, HDMI_EDIDS_4K,
-					       ARRAY_SIZE(HDMI_EDIDS_4K), false);
-
-		igt_describe(igt_edid_stress_resolution_desc);
-		connector_subtest("hdmi-edid-stress-resolution-non-4k", HDMIA)
-			edid_stress_resolution(&data, port, HDMI_EDIDS_NON_4K,
-					       ARRAY_SIZE(HDMI_EDIDS_NON_4K), true);
-
-		igt_describe(test_suspend_resume_edid_change_desc);
-		connector_subtest("hdmi-edid-change-during-suspend", HDMIA)
-			test_suspend_resume_edid_change(&data, port,
-							SUSPEND_STATE_MEM,
-							SUSPEND_TEST_NONE,
-							IGT_CUSTOM_EDID_BASE,
-							IGT_CUSTOM_EDID_ALT);
-
-		igt_describe(test_suspend_resume_edid_change_desc);
-		connector_subtest("hdmi-edid-change-during-hibernate", HDMIA)
-			test_suspend_resume_edid_change(&data, port,
-							SUSPEND_STATE_DISK,
-							SUSPEND_TEST_DEVICES,
-							IGT_CUSTOM_EDID_BASE,
-							IGT_CUSTOM_EDID_ALT);
-
-		igt_describe(test_mode_timings_desc);
-		connector_subtest("hdmi-mode-timings", HDMIA)
-			test_mode_timings(&data, port);
-	}
+
+	igt_describe(igt_custom_edid_type_read_desc);
+	connector_test("hdmi-edid-read", HDMIA, &data, edid_read_base_and_alt,
+		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+
+	igt_describe(igt_edid_stress_resolution_desc);
+	connector_test("hdmi-edid-stress-resolution-4k", HDMIA, &data,
+		       edid_stress_resolution, HDMI_EDIDS_4K, ARRAY_SIZE(HDMI_EDIDS_4K), false);
+
+	igt_describe(igt_edid_stress_resolution_desc);
+	connector_test("hdmi-edid-stress-resolution-non-4k", HDMIA, &data,
+		       edid_stress_resolution, HDMI_EDIDS_NON_4K,
+		       ARRAY_SIZE(HDMI_EDIDS_NON_4K), true);
+
+	igt_describe(test_suspend_resume_edid_change_desc);
+	connector_test("hdmi-edid-change-during-suspend", HDMIA, &data,
+		       test_suspend_resume_edid_change, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE,
+		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+
+	igt_describe(test_suspend_resume_edid_change_desc);
+	connector_test("hdmi-edid-change-during-hibernate", HDMIA, &data,
+		       test_suspend_resume_edid_change, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES,
+		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
+
+	igt_describe(test_mode_timings_desc);
+	connector_test("hdmi-mode-timings", HDMIA, &data, test_mode_timings);
 
 	igt_describe("VGA tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_VGA,
-				data.port_count, 1);
-		}
-
-		igt_describe(igt_custom_edid_type_read_desc);
-		connector_subtest("vga-edid-read", VGA)
-		{
-			igt_custom_edid_type_read(&data, port,
-						  IGT_CUSTOM_EDID_BASE);
-			igt_custom_edid_type_read(&data, port,
-						  IGT_CUSTOM_EDID_ALT);
-		}
-	}
+
+	igt_describe(igt_custom_edid_type_read_desc);
+	connector_test("vga-edid-read", VGA, &data, edid_read_base_and_alt,
+		       IGT_CUSTOM_EDID_BASE, IGT_CUSTOM_EDID_ALT);
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 29f957385..782275590 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -995,59 +995,39 @@ int igt_main()
 	}
 
 	igt_describe("DisplayPort tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_display_all_modes_desc);
-		connector_subtest("dp-crc-single", DisplayPort)
-			test_display_all_modes(&data, port, DRM_FORMAT_XRGB8888,
-					       CHAMELIUM_CHECK_CRC, 1);
+	igt_describe(test_display_all_modes_desc);
+	connector_test("dp-crc-single", DisplayPort, &data, test_display_all_modes,
+		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
 
-		igt_describe(test_display_one_mode_desc);
-		connector_subtest("dp-crc-fast", DisplayPort)
-			test_display_one_mode(&data, port, DRM_FORMAT_XRGB8888,
-					      CHAMELIUM_CHECK_CRC, 1);
+	igt_describe(test_display_one_mode_desc);
+	connector_test("dp-crc-fast", DisplayPort, &data, test_display_one_mode,
+		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
 
-		igt_describe(test_display_all_modes_desc);
-		connector_subtest("dp-crc-multiple", DisplayPort)
-			test_display_all_modes(&data, port, DRM_FORMAT_XRGB8888,
-					       CHAMELIUM_CHECK_CRC, 3);
+	igt_describe(test_display_all_modes_desc);
+	connector_test("dp-crc-multiple", DisplayPort, &data, test_display_all_modes,
+		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 3);
 
-		igt_describe(test_display_frame_dump_desc);
-		connector_subtest("dp-frame-dump", DisplayPort)
-			test_display_frame_dump(&data, port);
-	}
+	igt_describe(test_display_frame_dump_desc);
+	connector_test("dp-frame-dump", DisplayPort, &data, test_display_frame_dump);
 
 	igt_describe("HDMI tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_HDMIA,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_display_all_modes_desc);
-		connector_subtest("hdmi-crc-single", HDMIA)
-			test_display_all_modes(&data, port, DRM_FORMAT_XRGB8888,
-					       CHAMELIUM_CHECK_CRC, 1);
+	igt_describe(test_display_all_modes_desc);
+	connector_test("hdmi-crc-single", HDMIA, &data, test_display_all_modes,
+		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
 
-		igt_describe(test_display_one_mode_desc);
-		connector_subtest("hdmi-crc-fast", HDMIA)
-			test_display_one_mode(&data, port, DRM_FORMAT_XRGB8888,
-					      CHAMELIUM_CHECK_CRC, 1);
+	igt_describe(test_display_one_mode_desc);
+	connector_test("hdmi-crc-fast", HDMIA, &data, test_display_one_mode,
+		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 1);
 
-		igt_describe(test_display_all_modes_desc);
-		connector_subtest("hdmi-crc-multiple", HDMIA)
-			test_display_all_modes(&data, port, DRM_FORMAT_XRGB8888,
-					       CHAMELIUM_CHECK_CRC, 3);
+	igt_describe(test_display_all_modes_desc);
+	connector_test("hdmi-crc-multiple", HDMIA, &data, test_display_all_modes,
+		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_CRC, 3);
 
-		igt_describe(test_display_one_mode_desc);
-		connector_dynamic_subtest("hdmi-crc-nonplanar-formats", HDMIA)
-		{
+	igt_describe(test_display_one_mode_desc);
+	connector_dynamic_subtest("hdmi-crc-nonplanar-formats", HDMIA)
+	{
 			int k;
 			igt_output_t *output;
 			igt_plane_t *primary;
@@ -1080,14 +1060,13 @@ int igt_main()
 			}
 		}
 
-		igt_describe(test_display_planes_random_desc);
-		connector_subtest("hdmi-crc-planes-random", HDMIA)
-			test_display_planes_random(&data, port,
-						   CHAMELIUM_CHECK_CRC);
+	igt_describe(test_display_planes_random_desc);
+	connector_test("hdmi-crc-planes-random", HDMIA, &data, test_display_planes_random,
+		       CHAMELIUM_CHECK_CRC);
 
-		igt_describe(test_display_one_mode_desc);
-		connector_dynamic_subtest("hdmi-cmp-planar-formats", HDMIA)
-		{
+	igt_describe(test_display_one_mode_desc);
+	connector_dynamic_subtest("hdmi-cmp-planar-formats", HDMIA)
+	{
 			int k;
 			igt_output_t *output;
 			igt_plane_t *primary;
@@ -1121,33 +1100,21 @@ int igt_main()
 			}
 		}
 
-		igt_describe(test_display_planes_random_desc);
-		connector_subtest("hdmi-cmp-planes-random", HDMIA)
-			test_display_planes_random(
-				&data, port, CHAMELIUM_CHECK_CHECKERBOARD);
+	igt_describe(test_display_planes_random_desc);
+	connector_test("hdmi-cmp-planes-random", HDMIA, &data, test_display_planes_random,
+		       CHAMELIUM_CHECK_CHECKERBOARD);
 
-		igt_describe(test_display_frame_dump_desc);
-		connector_subtest("hdmi-frame-dump", HDMIA)
-			test_display_frame_dump(&data, port);
+	igt_describe(test_display_frame_dump_desc);
+	connector_test("hdmi-frame-dump", HDMIA, &data, test_display_frame_dump);
 
-		igt_describe(test_display_aspect_ratio_desc);
-		connector_subtest("hdmi-aspect-ratio", HDMIA)
-			test_display_aspect_ratio(&data, port);
-	}
+	igt_describe(test_display_aspect_ratio_desc);
+	connector_test("hdmi-aspect-ratio", HDMIA, &data, test_display_aspect_ratio);
 
 	igt_describe("VGA tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_VGA,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_display_all_modes_desc);
-		connector_subtest("vga-frame-dump", VGA)
-			test_display_all_modes(&data, port, DRM_FORMAT_XRGB8888,
-					       CHAMELIUM_CHECK_ANALOG, 1);
-	}
+	igt_describe(test_display_all_modes_desc);
+	connector_test("vga-frame-dump", VGA, &data, test_display_all_modes,
+		       DRM_FORMAT_XRGB8888, CHAMELIUM_CHECK_ANALOG, 1);
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 8f13b380a..dd1735956 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -465,157 +465,117 @@ IGT_TEST_DESCRIPTION("Testing HPD with a Chamelium board");
 int igt_main()
 {
 	chamelium_data_t data;
-	struct chamelium_port *port;
-	int p;
 
 	igt_fixture() {
 		chamelium_init_test(&data);
 	}
 
 	igt_describe("DisplayPort tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd", DisplayPort)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-fast", DisplayPort) test_hotplug(
-			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-enable-disable-mode", DisplayPort)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-with-enabled-mode", DisplayPort)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
-
-		igt_describe(test_hotplug_for_each_pipe_desc);
-		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
-			test_hotplug_for_each_pipe(&data, port);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("dp-hpd-after-suspend", DisplayPort)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("dp-hpd-after-hibernate", DisplayPort)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
-
-		igt_describe(test_hpd_storm_detect_desc);
-		connector_subtest("dp-hpd-storm", DisplayPort)
-			test_hpd_storm_detect(&data, port,
-					      HPD_STORM_PULSE_INTERVAL_DP);
-
-		igt_describe(test_hpd_storm_disable_desc);
-		connector_subtest("dp-hpd-storm-disable", DisplayPort)
-			test_hpd_storm_disable(&data, port,
-					       HPD_STORM_PULSE_INTERVAL_DP);
-	}
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd", DisplayPort, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd-fast", DisplayPort, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd-enable-disable-mode", DisplayPort, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd-with-enabled-mode", DisplayPort, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_test("dp-hpd-for-each-pipe", DisplayPort, &data,
+		       test_hotplug_for_each_pipe);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("dp-hpd-after-suspend", DisplayPort, &data, test_suspend_resume_hpd,
+		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("dp-hpd-after-hibernate", DisplayPort, &data, test_suspend_resume_hpd,
+		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+
+	igt_describe(test_hpd_storm_detect_desc);
+	connector_test("dp-hpd-storm", DisplayPort, &data, test_hpd_storm_detect,
+		       HPD_STORM_PULSE_INTERVAL_DP);
+
+	igt_describe(test_hpd_storm_disable_desc);
+	connector_test("dp-hpd-storm-disable", DisplayPort, &data, test_hpd_storm_disable,
+		       HPD_STORM_PULSE_INTERVAL_DP);
 
 	igt_describe("HDMI tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_HDMIA,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd", HDMIA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-fast", HDMIA) test_hotplug(
-			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
-
-		igt_describe(test_hotplug_for_each_pipe_desc);
-		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
-			test_hotplug_for_each_pipe(&data, port);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("hdmi-hpd-after-suspend", HDMIA)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("hdmi-hpd-after-hibernate", HDMIA)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
-
-		igt_describe(test_hpd_storm_detect_desc);
-		connector_subtest("hdmi-hpd-storm", HDMIA)
-			test_hpd_storm_detect(&data, port,
-					      HPD_STORM_PULSE_INTERVAL_HDMI);
-
-		igt_describe(test_hpd_storm_disable_desc);
-		connector_subtest("hdmi-hpd-storm-disable", HDMIA)
-			test_hpd_storm_disable(&data, port,
-					       HPD_STORM_PULSE_INTERVAL_HDMI);
-	}
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd", HDMIA, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd-fast", HDMIA, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd-enable-disable-mode", HDMIA, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd-with-enabled-mode", HDMIA, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_test("hdmi-hpd-for-each-pipe", HDMIA, &data, test_hotplug_for_each_pipe);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("hdmi-hpd-after-suspend", HDMIA, &data, test_suspend_resume_hpd,
+		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("hdmi-hpd-after-hibernate", HDMIA, &data, test_suspend_resume_hpd,
+		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+
+	igt_describe(test_hpd_storm_detect_desc);
+	connector_test("hdmi-hpd-storm", HDMIA, &data, test_hpd_storm_detect,
+		       HPD_STORM_PULSE_INTERVAL_HDMI);
+
+	igt_describe(test_hpd_storm_disable_desc);
+	connector_test("hdmi-hpd-storm-disable", HDMIA, &data, test_hpd_storm_disable,
+		       HPD_STORM_PULSE_INTERVAL_HDMI);
 
 	igt_describe("VGA tests");
-	igt_subtest_group() {
-		igt_fixture() {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_VGA,
-				data.port_count, 1);
-		}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd", VGA) test_hotplug(
-			&data, port, HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-fast", VGA) test_hotplug(
-			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-enable-disable-mode", VGA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-with-enabled-mode", VGA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("vga-hpd-after-suspend", VGA)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("vga-hpd-after-hibernate", VGA)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
-
-		igt_describe(test_hpd_without_ddc_desc);
-		connector_subtest("vga-hpd-without-ddc", VGA)
-			test_hpd_without_ddc(&data, port);
-	}
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd", VGA, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd-fast", VGA, &data, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd-enable-disable-mode", VGA, &data,
+		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd-with-enabled-mode", VGA, &data,
+		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("vga-hpd-after-suspend", VGA, &data,
+		       test_suspend_resume_hpd, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("vga-hpd-after-hibernate", VGA, &data,
+		       test_suspend_resume_hpd, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+
+	igt_describe(test_hpd_without_ddc_desc);
+	connector_test("vga-hpd-without-ddc", VGA, &data, test_hpd_without_ddc);
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_test("vga-hpd-for-each-pipe", VGA, &data, test_hotplug_for_each_pipe);
 
 	igt_describe("Tests that operate on all connectors");
 	igt_subtest_group() {
@@ -635,9 +595,6 @@ int igt_main()
 						       SUSPEND_TEST_DEVICES);
 	}
 
-	igt_describe(test_hotplug_for_each_pipe_desc);
-	connector_subtest("vga-hpd-for-each-pipe", VGA)
-		test_hotplug_for_each_pipe(&data, port);
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
-- 
2.48.1

