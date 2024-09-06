Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03657CE7AA6
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 02:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE21710E08F;
	Fri,  6 Sep 2024 02:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lL9s1U62";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E675A10E08F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 02:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725591499; x=1757127499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s17Ztmz5EmW6ZLNeIe+jiMJtO3uToPraLVutrluYY6g=;
 b=lL9s1U621YxYJ4nIAwF6K+N/dGzug5roLJy3BKtWQ9wlxRcPZM7qyp9j
 lFvOUe5HknmYvDNK7+aCXHHa9FS0RA7qPUzwP2bZ+2x7ASx86LDTtTJUo
 xir+vKyefBXeTgFyRTNSoD/GcKHEyERAIn4mziSzA8zvzKBqP5+Ow6fMF
 OTlsSKBbC/6TaSZJI84NHfNbd3dimeS8NBuKVTLbbD6JDG7XvZsi5tyh5
 a0Xdvpw6eHMpKa5CK+d6xBzxJqEznOtDuCINgky5cBa5gK+e4cCELigTL
 9Eh+/JssRgXKyw+/FV2Ww78MZdXgpqwH/qIpWQMWkyy+TUzkc0xJFubiP g==;
X-CSE-ConnectionGUID: hBZDybNuTy+zUSipq6l/MQ==
X-CSE-MsgGUID: X9sCfZ2CSuK02E6KEm7VaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28088801"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="28088801"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 19:58:19 -0700
X-CSE-ConnectionGUID: qENOo5wyTc2fRqp+0JYo6w==
X-CSE-MsgGUID: omrz6UwrQ7SMjkEKM4xRNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="66361794"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 19:58:18 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/intel/km_pm_brightness: Check for flickers with
 changes in brightness
Date: Fri,  6 Sep 2024 08:24:23 +0530
Message-Id: <20240906025423.507838-1-santhosh.reddy.guddati@intel.com>
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

    v3: Addressed review feedback - Kamil , thasleem

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_pm_backlight.c | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 140a95bcc..ae0ef8462 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -66,6 +66,10 @@
  * SUBTEST: fade-with-suspend
  * Description: Test the fade with suspend.
  * Functionality: backlight, suspend
+ *
+ * SUBTEST: brightness-with-crc
+ * Description: Test the brightness change with CRC.
+ * Functionality: backlight, CRC
  */
 
 struct context {
@@ -257,6 +261,41 @@ static void test_setup(igt_display_t display, igt_output_t *output)
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
+	/* create the pipe_crc object for this pipe */
+	ref_crc = igt_pipe_crc_new(display->drm_fd, context->output->config.pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+	igt_assert(ref_crc);
+
+	for (brightness = min; brightness <= max; brightness += step) {
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
+		/* compare the crc values before and after changing brightness */
+		crc_ok = igt_check_crc_equal(&out_crc_before, &out_crc_after);
+		igt_debug("brightness: %d flicker: %s\n", brightness, crc_ok ? "none" : "detected");
+		igt_assert_f(crc_ok, "Flicker observed for brightness %d\n", brightness);
+	}
+}
+
 igt_main
 {
 	int fd;
@@ -277,6 +316,7 @@ igt_main
 		{ "fade", "test basic fade.", test_fade, TEST_NONE },
 		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
 		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
+		{ "brightness-with-crc", "test the brightness change with CRC.", test_brightness_crc, TEST_NONE },
 	};
 
 	igt_fixture {
@@ -290,6 +330,7 @@ igt_main
 		 */
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
+		igt_require_pipe_crc(display.drm_fd);
 
 		for_each_connected_output(&display, output) {
 			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-- 
2.34.1

