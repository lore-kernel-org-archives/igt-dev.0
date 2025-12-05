Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40402D2E032
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 08:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852CF10EA30;
	Fri,  5 Dec 2025 08:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoKDOeJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA4F10EA2C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764920834; x=1796456834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2w15TvsCdR/TG3Zv6++X7MXmU18FJm6+VaxTulbHP7o=;
 b=CoKDOeJS41rMk9zgP1WXiMlBm5GD05wra/6A+cxPxeP53+L4x84HyxSh
 UbVNSXNfzqUW/JE4k1W+blFkzzBMfyo/4fsStisJUBG2y77PUEUZpe3dV
 zFz5zhmZVMWh6l8gv2FBZ9fGz6Tzm8mZsARyB2I50Riu8Lg1XpYAKQ4Ku
 P4wxWNDrK56LzTL6pioKoEA/3XSG5qLMamxUUZEc5V6WaeXI2aNNn6PXA
 YzMnRrkmIjT/coJ+ovFdErG3hL92pZ/XkHutC8CB8MkMsGDQsK2IzMK4g
 7Qct2hIkzdLeo6TV/wJBz8RvFYTFZ1MNU8cOC5bh9Y883EHEbq5u8mq7t Q==;
X-CSE-ConnectionGUID: h4QnSYLCTx++bRERiu3dEA==
X-CSE-MsgGUID: na7aBL3/RCiQ7D0k+0SX2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="67116804"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="67116804"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 23:47:13 -0800
X-CSE-ConnectionGUID: iKNWxhr/Qli6uzlZ4uf0Vw==
X-CSE-MsgGUID: f1TdrrTqTw2OMcisbAf9Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195321895"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008.jf.intel.com with ESMTP; 04 Dec 2025 23:47:12 -0800
From: Moahmmed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t 2/2] RFC: chamelium/kms_chamelium_hpd: use helper
 function for connector lookup in DP/HDMI/VGA tests
Date: Fri,  5 Dec 2025 13:16:02 +0530
Message-ID: <20251205074602.658783-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251205074602.658783-1-mohammed.bilal@intel.com>
References: <20251205074602.658783-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 Dec 2025 08:03:06 +0000
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

From: Mohammed Bilal <mohammed.bilal@intel.com>

Use the new get_port() helper to retrieve the appropriate connector for each
hotplug subtest, ensuring consistent connector handling across DP/HDMI/VGA
tests. Also remove the per-connector igt_fixture blocks, as they were being
executed regardless of which subtest was run. The helper-based approach avoids
unwanted fixture execution and keeps connector selection simple and reliable.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 411 +++++++++++++++++++---------
 1 file changed, 288 insertions(+), 123 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 3c8af63bd..840363311 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -440,7 +440,6 @@ static void test_hpd_storm_detect(chamelium_data_t *data,
 	igt_hpd_storm_set_threshold(data->drm_fd, 1);
 	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
 	igt_assert(igt_hpd_storm_detected(data->drm_fd));
-
 	mon = igt_watch_uevents();
 	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
 
@@ -478,156 +477,327 @@ IGT_TEST_DESCRIPTION("Testing HPD with a Chamelium board");
 igt_main
 {
 	chamelium_data_t data;
-	struct chamelium_port *port;
-	int p;
 
 	igt_fixture {
 		chamelium_init_test(&data);
 	}
 
-	igt_describe("DisplayPort tests");
-	igt_subtest_group {
-		igt_fixture {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
-				data.port_count, 1);
-		}
+igt_describe("DP tests");
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd", DisplayPort)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
-				     TEST_MODESET_OFF);
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("dp-hpd")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort);
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-fast", DisplayPort) test_hotplug(
-			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+		if (!hport)
+			igt_skip("DP connector not available\n");
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-enable-disable-mode", DisplayPort)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+	}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-with-enabled-mode", DisplayPort)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("dp-hpd-fast")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort);
 
-		igt_describe(test_hotplug_for_each_pipe_desc);
-		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
-			test_hotplug_for_each_pipe(&data, port);
+		if (!hport)
+			igt_skip("DP connector not available\n");
 
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("dp-hpd-after-suspend", DisplayPort)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+	}
 
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("dp-hpd-after-hibernate", DisplayPort)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("dp-hpd-enable-disable-mode")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort);
 
-		igt_describe(test_hpd_storm_detect_desc);
-		connector_subtest("dp-hpd-storm", DisplayPort)
-			test_hpd_storm_detect(&data, port,
-					      HPD_STORM_PULSE_INTERVAL_DP);
+		if (!hport)
+			igt_skip("DP connector not available\n");
 
-		igt_describe(test_hpd_storm_disable_desc);
-		connector_subtest("dp-hpd-storm-disable", DisplayPort)
-			test_hpd_storm_disable(&data, port,
-					       HPD_STORM_PULSE_INTERVAL_DP);
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
 	}
 
-	igt_describe("HDMI tests");
-	igt_subtest_group {
-		igt_fixture {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_HDMIA,
-				data.port_count, 1);
-		}
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("dp-hpd-with-enabled-mode")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort);
+
+		if (!hport)
+			igt_skip("DP connector not available\n");
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd", HDMIA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
-				     TEST_MODESET_OFF);
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+	}
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	igt_subtest("dp-hpd-for-each-pipe")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort);
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-fast", HDMIA) test_hotplug(
-			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+		if (!hport)
+			igt_skip("DP connector not available\n");
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
+		test_hotplug_for_each_pipe(&data, hport);
+	}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
+	igt_describe(test_suspend_resume_hpd_desc);
+	igt_subtest("dp-hpd-after-suspend")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort);
 
-		igt_describe(test_hotplug_for_each_pipe_desc);
-		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
-			test_hotplug_for_each_pipe(&data, port);
+		if (!hport)
+			igt_skip("DP connector not available\n");
 
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("hdmi-hpd-after-suspend", HDMIA)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
+		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	}
 
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("hdmi-hpd-after-hibernate", HDMIA)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
+	igt_describe(test_suspend_resume_hpd_desc);
+	igt_subtest("dp-hpd-after-hibernate")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort);
 
-		igt_describe(test_hpd_storm_detect_desc);
-		connector_subtest("hdmi-hpd-storm", HDMIA)
-			test_hpd_storm_detect(&data, port,
-					      HPD_STORM_PULSE_INTERVAL_HDMI);
+		if (!hport)
+			igt_skip("DP connector not available\n");
 
-		igt_describe(test_hpd_storm_disable_desc);
-		connector_subtest("hdmi-hpd-storm-disable", HDMIA)
-			test_hpd_storm_disable(&data, port,
-					       HPD_STORM_PULSE_INTERVAL_HDMI);
+		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
 	}
 
-	igt_describe("VGA tests");
-	igt_subtest_group {
-		igt_fixture {
-			chamelium_require_connector_present(
-				data.ports, DRM_MODE_CONNECTOR_VGA,
-				data.port_count, 1);
-		}
+	igt_describe(test_hpd_storm_detect_desc);
+	igt_subtest("dp-hpd-storm")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort);
+
+		if (!hport)
+			igt_skip("DP connector not available\n");
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd", VGA) test_hotplug(
-			&data, port, HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
+		test_hpd_storm_detect(&data, hport, HPD_STORM_PULSE_INTERVAL_DP);
+	}
+
+	igt_describe(test_hpd_storm_disable_desc);
+	igt_subtest("dp-hpd-storm-disable")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_DisplayPort);
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-fast", VGA) test_hotplug(
-			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+		if (!hport)
+			igt_skip("DP connector not available\n");
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-enable-disable-mode", VGA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
+		test_hpd_storm_disable(&data, hport, HPD_STORM_PULSE_INTERVAL_DP);
+	}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-with-enabled-mode", VGA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
+igt_describe("HDMI tests");
 
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("vga-hpd-after-suspend", VGA)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("hdmi-hpd")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
 
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("vga-hpd-after-hibernate", VGA)
-			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
+		if (!hport)
+			igt_skip("HDMI connector not available\n");
 
-		igt_describe(test_hpd_without_ddc_desc);
-		connector_subtest("vga-hpd-without-ddc", VGA)
-			test_hpd_without_ddc(&data, port);
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+	}
+
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("hdmi-hpd-fast")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
+
+		if (!hport)
+			igt_skip("HDMI connector not available\n");
+
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+	}
+
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("hdmi-hpd-enable-disable-mode")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
+
+		if (!hport)
+			igt_skip("HDMI connector not available\n");
+
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+	}
+
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("hdmi-hpd-with-enabled-mode")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
+
+		if (!hport)
+			igt_skip("HDMI connector not available\n");
+
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+	}
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	igt_subtest("hdmi-hpd-for-each-pipe")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
+
+		if (!hport)
+			igt_skip("HDMI connector not available\n");
+
+		test_hotplug_for_each_pipe(&data, hport);
+	}
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	igt_subtest("hdmi-hpd-after-suspend")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
+
+		if (!hport)
+			igt_skip("HDMI connector not available\n");
+
+		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	}
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	igt_subtest("hdmi-hpd-after-hibernate")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
+
+		if (!hport)
+			igt_skip("HDMI connector not available\n");
+
+		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+	}
+
+	igt_describe(test_hpd_storm_detect_desc);
+	igt_subtest("hdmi-hpd-storm")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
+
+		if (!hport)
+			igt_skip("HDMI connector not available\n");
+
+		test_hpd_storm_detect(&data, hport, HPD_STORM_PULSE_INTERVAL_HDMI);
+	}
+
+	igt_describe(test_hpd_storm_disable_desc);
+	igt_subtest("hdmi-hpd-storm-disable")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_HDMIA);
+
+		if (!hport)
+			igt_skip("HDMI connector not available\n");
+
+		test_hpd_storm_disable(&data, hport, HPD_STORM_PULSE_INTERVAL_HDMI);
+	}
+
+igt_describe("VGA tests");
+
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("vga-hpd")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
+
+		if (!hport)
+			igt_skip("VGA connector not available\n");
+
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
+	}
+
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("vga-hpd-fast")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
+
+		if (!hport)
+			igt_skip("VGA connector not available\n");
+
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+	}
+
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("vga-hpd-enable-disable-mode")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
+
+		if (!hport)
+			igt_skip("VGA connector not available\n");
+
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+	}
+
+	igt_describe(test_basic_hotplug_desc);
+	igt_subtest("vga-hpd-with-enabled-mode")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
+
+		if (!hport)
+			igt_skip("VGA connector not available\n");
+
+		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+	}
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	igt_subtest("vga-hpd-after-suspend")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
+
+		if (!hport)
+			igt_skip("VGA connector not available\n");
+
+		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	}
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	igt_subtest("vga-hpd-after-hibernate")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
+
+		if (!hport)
+			igt_skip("VGA connector not available\n");
+
+		test_suspend_resume_hpd(&data, hport, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+	}
+
+	igt_describe(test_hpd_without_ddc_desc);
+	igt_subtest("vga-hpd-without-ddc")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
+
+		if (!hport)
+			igt_skip("VGA connector not available\n");
+
+		test_hpd_without_ddc(&data, hport);
+	}
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	igt_subtest("vga-hpd-for-each-pipe")
+	{
+		struct chamelium_port *hport =
+			get_port(data.ports, data.port_count, DRM_MODE_CONNECTOR_VGA);
+
+		if (!hport)
+			igt_skip("VGA connector not available\n");
+
+		test_hotplug_for_each_pipe(&data, hport);
 	}
 
 	igt_describe("Tests that operate on all connectors");
@@ -643,15 +813,10 @@ igt_main
 
 		igt_describe(test_suspend_resume_hpd_common_desc);
 		igt_subtest("common-hpd-after-hibernate")
-			test_suspend_resume_hpd_common(&data,
-						       SUSPEND_STATE_DISK,
+			test_suspend_resume_hpd_common(&data, SUSPEND_STATE_DISK,
 						       SUSPEND_TEST_DEVICES);
 	}
 
-	igt_describe(test_hotplug_for_each_pipe_desc);
-	connector_subtest("vga-hpd-for-each-pipe", VGA)
-		test_hotplug_for_each_pipe(&data, port);
-
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.48.1

