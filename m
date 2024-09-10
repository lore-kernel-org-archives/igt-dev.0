Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545EFEB64DE
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 03:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042EB10E6EC;
	Tue, 10 Sep 2024 03:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMZsB1Ci";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA59510E6EC
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 03:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725940266; x=1757476266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mC3GI/fkuCgjOIMiYZcT6ZTHI4lIA/cXIXbvEdrE+LM=;
 b=AMZsB1Cin5D3O89qd1I2gY89y2IPhc5qtaFzZ+WJWfwr1/wtGg9tVjwe
 G95QcKJnp6UopLJbe4zmoDIcXal4ilAMQTCkBvzWNWUtFy0cUwgM/NwlZ
 Rs2bk5EnPBkKmkGCadcGryUnQ+jOcrfO1I4xGW257vFpxomqaXJhlaalv
 nYXjJZfhSuU6/f7h1/4u4LWxrK6GUTp+5MfFAA3IomIkdJhBSnuN+K43C
 Pe+zbXDOH+0dGa8ntRRm4mBEFnA8HXc7/iHZlKgwMioY41uBiB/mWRXFT
 EoLCjkLtdwZjsNBIIw2n43GxYm1chr6IL5/4eyIE56pwdFz+spAuMWnDz Q==;
X-CSE-ConnectionGUID: 3Gkso1VQQ/KgftwUdqfMZA==
X-CSE-MsgGUID: FdwVXRc+S1WACI7y0AhfkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="13450895"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="13450895"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 20:51:05 -0700
X-CSE-ConnectionGUID: fiiTuEkHQ6Ozev+gAqgRJA==
X-CSE-MsgGUID: jhW89yOxRQS7jrGg9aO4TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="67182788"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 20:51:04 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_backlight: Detect flickering with
 brightness change
Date: Tue, 10 Sep 2024 09:16:53 +0530
Message-Id: <20240910034653.543796-1-santhosh.reddy.guddati@intel.com>
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

New test is added to check for flickers on the panel while
changing brightness.

If there is any flicker observed on the panel while changing
the brightness then crc will change. This patch set is trying
to address the flickers observed using crc when brightness
is being changed.

v2: fix subject, use igt_assert_f (Kamil)
v4: Remove unnecessary debug logs and test name (Thasleem)
V5: fix subject description,rename test name and
keep all brightness tests together. (Swathi)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_pm_backlight.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 140a95bcc..481e60f77 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -56,6 +56,10 @@
  * SUBTEST: basic-brightness
  * Description: Test the basic brightness.
  *
+ * SUBTEST: basic-crc-brightness
+ * Description: Test the brightness change with crc.
+ * Functionality: backlight, crc
+ *
  * SUBTEST: fade
  * Description: Test basic fade.
  *
@@ -66,6 +70,7 @@
  * SUBTEST: fade-with-suspend
  * Description: Test the fade with suspend.
  * Functionality: backlight, suspend
+ *
  */
 
 struct context {
@@ -257,6 +262,34 @@ static void test_setup(igt_display_t display, igt_output_t *output)
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
+	igt_pipe_crc_t *ref_crc;
+	bool crc_ok;
+
+	ref_crc = igt_pipe_crc_new(display->drm_fd, context->output->config.pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+	igt_assert(ref_crc);
+
+	for (brightness = min; brightness <= max; brightness += step) {
+		igt_pipe_crc_collect_crc(ref_crc, &out_crc_before);
+
+		igt_assert_eq(backlight_write(brightness, "brightness", context), 0);
+
+		igt_pipe_crc_collect_crc(ref_crc, &out_crc_after);
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
@@ -273,6 +306,7 @@ igt_main
 		int flags;
 	} tests[] = {
 		{ "basic-brightness", "test the basic brightness.", test_brightness, TEST_NONE },
+		{ "basic-crc-brightness", "test the brightness change with CRC.", test_brightness_crc, TEST_NONE },
 		{ "bad-brightness", "test the bad brightness.", test_bad_brightness, TEST_NONE },
 		{ "fade", "test basic fade.", test_fade, TEST_NONE },
 		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
@@ -290,6 +324,7 @@ igt_main
 		 */
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
+		igt_require_pipe_crc(display.drm_fd);
 
 		for_each_connected_output(&display, output) {
 			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-- 
2.34.1

