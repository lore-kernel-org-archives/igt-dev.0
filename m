Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085E3D358CE
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 07:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B234710E30C;
	Thu, 29 Jan 2026 07:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HunotrMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C755B10E30C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 07:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769672972; x=1801208972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1EHBaWLtmnlncTYWd7rDA05AjXLPMywfkwAvV2eFp8M=;
 b=HunotrMoLhLKixEdbRdNlhwpesMlr6u1kShINWkSgqufdZnLvnkYBpv4
 HZhwS4bf2bpaVIDkcmwiI4WzKHUUKfEze3wBRz1mt900mdmUbnPwYVey/
 QVnFcraDuVn9DwN2TLgDP4bJiCp2Ks7COoIFWiaOoyuBd1wBcfAWRBvVM
 3Kl1OLBunx3dNtIJFBf1oWHRc1xoYfnAzTl2YIeYiqHhKmfY7RWDkkPkN
 AKjBYFsURybCD03MOrAPJKJp/P4gYlIBpFK3VzG+1m1JEIfCevHB4ueNd
 yemXnb40+V8qTl3JqfMUI6f2k7bU5XcB7qkCUiw1l0fJVYDjCGlXjxklz Q==;
X-CSE-ConnectionGUID: bAf9GgVdTlmXQkV+Hcqo4g==
X-CSE-MsgGUID: nPeIBOWGQeu4pT9NQiJ/aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70874244"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70874244"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:49:32 -0800
X-CSE-ConnectionGUID: E9lcm9g0RTyVQo/BYBtz3A==
X-CSE-MsgGUID: 2Rmy13cjRDmlJ2Bfze8ScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213374222"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:49:30 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v6 2/2] tests/chamelium/kms_chamelium_hpd: use helper
 function for connector lookup in DP/HDMI/VGA tests
Date: Thu, 29 Jan 2026 13:15:20 +0530
Message-ID: <20260129074520.397133-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260129074520.397133-1-mohammed.bilal@intel.com>
References: <20260129074520.397133-1-mohammed.bilal@intel.com>
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

Introduce a unified connector_test() helper that iterates over and tests
all matching connected ports, ensuring clean skipping and consistent
connector handling across DP/HDMI/VGA tests, and avoiding unintended
execution of unrelated fixtures.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 239 ++++++++++++----------------
 1 file changed, 98 insertions(+), 141 deletions(-)

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

