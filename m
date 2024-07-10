Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7046FC3DA45
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 10:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C6E10E728;
	Wed, 10 Jul 2024 10:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqcWMkE3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D749710E728
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720608879; x=1752144879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pOD7vlHp3w1CGompDCLOPhRK2ouzD1K2MIEXSXnugfM=;
 b=eqcWMkE3NCOaAP+sevFgNdMKhZw87EkMPRcGuLOYGYm7k5glTtb7/rmL
 BlCXIDjL2vqlgoWr4SjLWpNiw6mk7khtF6BH0YagF2pm0mxk8pnubg3oJ
 +hytJ8b/HBWdN5zAOx6GAAmR6vGoE5U1KBHicVqWXCQImDaybvOaVM1yH
 4ZWGxD4CiNi5p0sjphFIIqy2J73XDQgiyvhnYbq0TVAQJtHpIVG7WAJSg
 MULRds5B8zpd70Eb5pzDZbbvUAnMB+yfliNyc/p+CXrz4pwIVXOsbcHxF
 QkI6N3IrlTU4aSLlyrSm4YghHtTgsh1BgQK0sMCAVnJ9kVH3tsZ6EMLJ5 w==;
X-CSE-ConnectionGUID: +aAKHURfRI2s98P/bifODA==
X-CSE-MsgGUID: TuS9FwOjQaa8d2QgZCk+MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21685305"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="21685305"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 03:54:39 -0700
X-CSE-ConnectionGUID: kKo2s5DfR3Kt3lGEUh5WtA==
X-CSE-MsgGUID: /uDETGMYSaC6BhBqTCtuQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48084245"
Received: from tglh-tiger-lake-client-platform.iind.intel.com ([10.145.169.74])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 03:54:37 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/km_pm_brightness: check for flickers while
 adjusting the brightness
Date: Wed, 10 Jul 2024 16:24:22 +0530
Message-Id: <20240710105422.211273-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
References: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
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

The test is added to check for flickers on the panel while
changing brightness.

If there is any flicker observed on the panel while changing
the brightness then crc will change.This patch set is trying
to address the flickers observed using crc when brightness
is being changed.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_pm_backlight.c | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 8672afa7a..a7e8431e5 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -64,6 +64,10 @@
  * SUBTEST: fade-with-suspend
  * Description: Test the fade with suspend.
  * Functionality: backlight, suspend
+ *
+ * SUBTEST: brightness-crc-change
+ * Description: Test the brightness change with CRC.
+ * Functionality: backlight, CRC
  */
 
 struct context {
@@ -255,6 +259,43 @@ static void test_setup(igt_display_t display, igt_output_t *output)
 	}
 }
 
+static void test_brightness_crc(struct context *context)
+{
+	int min = 0;
+	int max = context->max;
+	int step = (max - min) / 10;
+	int brightness;
+	igt_crc_t out_crc_before, out_crc_after;
+	igt_display_t *display = context->output->display;
+	char *crc_str;
+	igt_pipe_crc_t *ref_crc;
+	bool crc_ok;
+
+	// Get the CRC before changing brightness
+	ref_crc = igt_pipe_crc_new(display->drm_fd, context->output->config.pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+	igt_assert(ref_crc);
+
+	for (brightness = min; brightness <= max; brightness += step) {
+		igt_info("Brightness: %d\n", brightness);
+
+		igt_pipe_crc_collect_crc(ref_crc, &out_crc_before);
+		crc_str = igt_crc_to_string(&out_crc_before);
+		igt_debug("CRC before write: %s\n", crc_str);
+
+		igt_assert_eq(backlight_write(brightness, "brightness", context), 0);
+		igt_debug("Brightness after write: %d\n", brightness);
+
+		igt_pipe_crc_collect_crc(ref_crc, &out_crc_after);
+		crc_str = igt_crc_to_string(&out_crc_after);
+		igt_debug("CRC after write: %s\n", crc_str);
+
+		// Compare the CRC values
+		crc_ok = igt_check_crc_equal(&out_crc_before, &out_crc_after);
+		igt_debug("brightness: %d flicker: %s\n", brightness, crc_ok ? "none" : "detected");
+		igt_assert_f(crc_ok, "Flicker observed for brightness %d\n", brightness);
+	}
+}
+
 igt_main
 {
 	int fd;
@@ -275,6 +316,7 @@ igt_main
 		{ "fade", "test basic fade.", test_fade, TEST_NONE },
 		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
 		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
+		{ "brightness-crc-change", "test the brightness change with CRC.", test_brightness_crc, TEST_NONE },
 	};
 
 	igt_fixture {
@@ -288,6 +330,7 @@ igt_main
 		 */
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
+		igt_require_pipe_crc(display.drm_fd);
 
 		for_each_connected_output(&display, output) {
 			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-- 
2.34.1

