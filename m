Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B188C3064D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 03:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA51E10E109;
	Thu, 27 Jun 2024 03:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYNBLlNu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108AF10E109
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 03:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719457360; x=1750993360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HobxpnYg/E7R2ZBG1dWgbdYgAq14/rn31o7DUO1RA2Y=;
 b=kYNBLlNucwsEnkfvXyq1CEi4KMJyYK/l5f5HJjbOrgM+Y3nu5vSP+tr7
 c2BChVEY3yxtcAce8GX5YJplwRLbdPTNpXv5OyJ7MZJNqXLcskAIPW0dY
 N0zSDQuilqXRYMkMlSL//r0oXyHXurLQ52kZClK43chXa/YYCF+0jElun
 Wo214urSIeY2qhCPoTf/TJWvAyPqD8L26lUhBawrwnTBuWFlQXWOwZoux
 0k/Us70+NimF3F3yOit1OSOI9+U0wV6ri5FV6j2zq4JPSrf3IzQtJ+5B5
 0o3V11XDB18VZmk5tipU9zZAT5y2lVEPJJfGSjIP652gQ0oqA8wmxs61V A==;
X-CSE-ConnectionGUID: dHmYIapPTbOrE5992Fu9AQ==
X-CSE-MsgGUID: dp5RUwl+TEiakARJ+Ggajg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16306528"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="16306528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 20:02:40 -0700
X-CSE-ConnectionGUID: bcocJqQoQDGhvRI0X+d+sw==
X-CSE-MsgGUID: xa69pdV8RxOaNr/w1D9D9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44131839"
Received: from tglu-tiger-lake-client-platform.iind.intel.com (HELO
 tglh-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.74])
 by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2024 20:02:38 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/km_pm_brightness.c: check for flickers while
 adjusting the brightness.
Date: Thu, 27 Jun 2024 08:32:11 +0530
Message-Id: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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
changing brightness.Though changing the brightness doesn't have impact
on CRC,but if there is a flicker observed , the crc will change
and this test validates the crc.
---
 tests/intel/kms_pm_backlight.c | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 8672afa7a..e29fd7320 100644
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
@@ -255,6 +259,44 @@ static void test_setup(igt_display_t display, igt_output_t *output)
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
+		if (igt_check_crc_equal(&out_crc_before, &out_crc_after)) {
+			igt_info("CRC values are same for brightness: %d\n", brightness);
+		} else {
+			igt_info("CRC values are different for brightness: %d\n", brightness);
+		}
+	}
+}
+
 igt_main
 {
 	int fd;
@@ -275,6 +317,7 @@ igt_main
 		{ "fade", "test basic fade.", test_fade, TEST_NONE },
 		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
 		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
+		{ "brightness-crc-change", "test the brightness change with CRC.", test_brightness_crc, TEST_NONE },
 	};
 
 	igt_fixture {
@@ -288,6 +331,7 @@ igt_main
 		 */
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
+		igt_require_pipe_crc(display.drm_fd);
 
 		for_each_connected_output(&display, output) {
 			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-- 
2.34.1

