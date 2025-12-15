Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9514D5B840
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 15:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4810E5DC;
	Mon, 15 Dec 2025 15:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B565QyRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBB810E5DA
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765811340; x=1797347340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=421LGRlvaWt3hzU9QsMHFBpgFS3B9y+3hyako0h6emc=;
 b=B565QyRiT/edmvc5qA39jzXiqUmpGAu+N5brkKWitYRbAvsuyLDCwMxx
 o7Q5Rw/U2VfkAgGnNneENG8Fv/QFcad+I3kQkFiR2aYi6f9Db4+nUdLVm
 FcpcTq5m/7a05itStgop+Med28g3HB9el/CmiqLPnHBlZ1Fg5Tq6haxIl
 VmdWM1iblN7T8XftDhvtookWz7K+tEKRs7xkhZbwxU9KrwK0u+t2IIyd+
 K95XC4ZmEAZUBfF42xb6NVi36+tPEg1RDT3fGyl9oTeZ+VUwyw4aPkkXY
 M2x/n/nMceJ2qUJzwp60RWATxG4yRayqGanbU6jOKuQLYb0c8y/MgZqYU Q==;
X-CSE-ConnectionGUID: 9GflLBeHRCS1gFmSFUDH2w==
X-CSE-MsgGUID: mf2a9+WQRkKxbZMpuKdWWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79084824"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="79084824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:09:00 -0800
X-CSE-ConnectionGUID: s7cp7SWCSvuv3AYw1AxP4w==
X-CSE-MsgGUID: k35jll0ZT5+5ZLGu1Q+lgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197633283"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 07:08:58 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v4 2/2] tests/chamelium/kms_chamelium_hpd: use helper
 function for connector lookup in DP/HDMI/VGA tests
Date: Mon, 15 Dec 2025 20:37:15 +0530
Message-ID: <20251215150717.1190726-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251215150717.1190726-1-mohammed.bilal@intel.com>
References: <20251215150717.1190726-1-mohammed.bilal@intel.com>
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

Replace the old connector_subtest() + per-connector igt_fixture blocks
with a unified connector_test() helper based on get_port(). The previous
fixtures were always executed even when running other subtests, causing
false failures when HDMI/VGA/DP connectors were not present.

Using connector_test() makes each subtest perform its own connector
lookup and skip cleanly if unavailable, while removing repeated
boilerplate across DP/HDMI/VGA hotplug tests.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 238 ++++++++++++----------------
 1 file changed, 97 insertions(+), 141 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index d1460533f..0ed668cd4 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -463,157 +463,116 @@ IGT_TEST_DESCRIPTION("Testing HPD with a Chamelium board");
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
+	connector_test("dp-hpd", DisplayPort, test_hotplug,
+		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd-fast", DisplayPort, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd-enable-disable-mode", DisplayPort, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("dp-hpd-with-enabled-mode", DisplayPort, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_test("dp-hpd-for-each-pipe", DisplayPort, test_hotplug_for_each_pipe);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("dp-hpd-after-suspend", DisplayPort, test_suspend_resume_hpd,
+		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("dp-hpd-after-hibernate", DisplayPort, test_suspend_resume_hpd,
+		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+
+	igt_describe(test_hpd_storm_detect_desc);
+	connector_test("dp-hpd-storm", DisplayPort, test_hpd_storm_detect,
+		       HPD_STORM_PULSE_INTERVAL_DP);
+
+	igt_describe(test_hpd_storm_disable_desc);
+	connector_test("dp-hpd-storm-disable", DisplayPort, test_hpd_storm_disable,
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
+	connector_test("hdmi-hpd", HDMIA, test_hotplug,
+		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd-fast", HDMIA, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd-enable-disable-mode", HDMIA, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("hdmi-hpd-with-enabled-mode", HDMIA, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_test("hdmi-hpd-for-each-pipe", HDMIA, test_hotplug_for_each_pipe);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("hdmi-hpd-after-suspend", HDMIA, test_suspend_resume_hpd,
+		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("hdmi-hpd-after-hibernate", HDMIA, test_suspend_resume_hpd,
+		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+
+	igt_describe(test_hpd_storm_detect_desc);
+	connector_test("hdmi-hpd-storm", HDMIA, test_hpd_storm_detect,
+		       HPD_STORM_PULSE_INTERVAL_HDMI);
+
+	igt_describe(test_hpd_storm_disable_desc);
+	connector_test("hdmi-hpd-storm-disable", HDMIA, test_hpd_storm_disable,
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
+	connector_test("vga-hpd", VGA, test_hotplug,
+		       HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd-fast", VGA, test_hotplug,
+		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd-enable-disable-mode", VGA,
+		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
+
+	igt_describe(test_basic_hotplug_desc);
+	connector_test("vga-hpd-with-enabled-mode", VGA,
+		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("vga-hpd-after-suspend", VGA,
+		       test_suspend_resume_hpd, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_describe(test_suspend_resume_hpd_desc);
+	connector_test("vga-hpd-after-hibernate", VGA,
+		       test_suspend_resume_hpd, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
+
+	igt_describe(test_hpd_without_ddc_desc);
+	connector_test("vga-hpd-without-ddc", VGA, test_hpd_without_ddc);
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_test("vga-hpd-for-each-pipe", VGA, test_hotplug_for_each_pipe);
 
 	igt_describe("Tests that operate on all connectors");
 	igt_subtest_group() {
@@ -633,9 +592,6 @@ int igt_main()
 						       SUSPEND_TEST_DEVICES);
 	}
 
-	igt_describe(test_hotplug_for_each_pipe_desc);
-	connector_subtest("vga-hpd-for-each-pipe", VGA)
-		test_hotplug_for_each_pipe(&data, port);
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
-- 
2.48.1

