Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B7BCE9D4A
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 15:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA8A10E0EC;
	Tue,  6 Jan 2026 15:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/wQ0gFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9F610E50C
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767713642; x=1799249642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/nsQWUxwLmFWb6iik4vCgxUYt6Xz6zVPa+Lx2qSzAvw=;
 b=N/wQ0gFg3V33Bi+IlGHq4+CaKly9ZETjJDqox/pbPv1JjQQQU+DHnLmG
 E3owwWjr1c6numao3dUESJ+JYFdEhqChXDNGkdaz6IHHbLNDARKDfSHDm
 Q1YfWsQoQuIVeY5pPbsx4l44GUB32KJkZ0+e1NDioHpmXQ8QASNMe4POu
 /L4WOGRcZ0wlXQ3tZiZp9Mtjf1L9uOLcLKUyYAkqF9R1KuknBFdYn+4aC
 j5voPMJnd4KWLgyE65TtHatCtU9Lt3TXZ1aNLCPOB87gujBMUwsnyhmOC
 K7ma2Ofn6C6RdNT6W0LykTMKgQMf5xCJj4EEwyj9c4D7z7zc2EFUeQuLv Q==;
X-CSE-ConnectionGUID: 314t7i++RaOfQ/NP/VYYxA==
X-CSE-MsgGUID: uTctifhDSJis3cgb1uFVkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94546768"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="94546768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 07:34:00 -0800
X-CSE-ConnectionGUID: SgC+NK3nRCqT6ceM3jvJ1w==
X-CSE-MsgGUID: Coa+tLiVQZWyqTI54/QWuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="206824509"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 07:33:57 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 2/2] tests/chamelium/kms_chamelium_hpd: use helper
 function for connector lookup in DP/HDMI/VGA tests
Date: Tue,  6 Jan 2026 21:02:32 +0530
Message-ID: <20260106153232.79004-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260106153232.79004-1-mohammed.bilal@intel.com>
References: <20260106153232.79004-1-mohammed.bilal@intel.com>
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
 tests/chamelium/kms_chamelium_hpd.c | 238 ++++++++++++----------------
 1 file changed, 97 insertions(+), 141 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 8f13b380a..dc44dc3bf 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -465,157 +465,116 @@ IGT_TEST_DESCRIPTION("Testing HPD with a Chamelium board");
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
@@ -635,9 +594,6 @@ int igt_main()
 						       SUSPEND_TEST_DEVICES);
 	}
 
-	igt_describe(test_hotplug_for_each_pipe_desc);
-	connector_subtest("vga-hpd-for-each-pipe", VGA)
-		test_hotplug_for_each_pipe(&data, port);
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
-- 
2.48.1

