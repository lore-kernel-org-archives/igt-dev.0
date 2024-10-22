Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE75D2C541
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 12:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CFB10E677;
	Tue, 22 Oct 2024 12:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbOeD84U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712AC10E672
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729599192; x=1761135192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tv8EXxtRFTDmclDkgGA0R4AGCGybIWiCkrWV1NzV/NU=;
 b=HbOeD84UbjJEoOqvrLmrv88c5f0SVCP5zP9zawqFE12lQwCGSH46VVZe
 Lx3kgPbQ6OllKRmA18fmgYUvnTUiNKossi9kdKU3iFLFVpWV3joc88Bq4
 JrCPH9as5QF4mU403But8fo5K4nA7Uzvdjf3qiBF/qjK/Gn68qtfUT1rA
 ws3MQRqOnD9NLz/Q7VGt36gaAsXZpsbHBt1bX8Khs5zjymAwNKuSn2V2X
 2drpTB0ebxHYVD97tpdvvbar8G6TnNRzog5KdH52cJ1hztLawEUJU4rf9
 /aALAQQYECbwNdE4zLBojCb08lBI92IUOu0qIYIH0FxmhscK5ePnNaHRl A==;
X-CSE-ConnectionGUID: 4Zh+sU2nRfitjCLKDh3s+w==
X-CSE-MsgGUID: 1zEICHj0TOuPYguNjvHvZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="46615817"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="46615817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 05:13:12 -0700
X-CSE-ConnectionGUID: W9bvUYMUQbqD1HeRGsrRew==
X-CSE-MsgGUID: +XdEiqGMRx2dVYbAPIlDMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79792371"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 05:13:10 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com, pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/kms_hdr: Test brightness manipulation in
 HDR mode
Date: Tue, 22 Oct 2024 17:40:42 +0530
Message-Id: <20241022121042.2295042-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022121042.2295042-1-santhosh.reddy.guddati@intel.com>
References: <20241022121042.2295042-1-santhosh.reddy.guddati@intel.com>
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

Add subtests for backlight control on hdr enabled edp panels
by changing brightness via sysfs.

use igt_backlight_read and igt_backlight_write from library

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_hdr.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..be55fe646 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -64,6 +64,10 @@
  * Description: Tests static toggle with suspend
  * Functionality: colorspace, static_hdr, suspend
  *
+ * SUBTEST: brightness-with-hdr
+ * Description: Tests brightness with HDR
+ * Functionality: colorspace, static_hdr
+ *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
  * Functionality: colorspace, static_hdr
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
 #define HDR_STATIC_METADATA_BLOCK       0x06
 #define USE_EXTENDED_TAG		0x07
 
+#define BACKLIGHT_PATH "/sys/class/backlight"
+
 /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
 enum hdmi_metadata_type {
 	HDMI_STATIC_METADATA_TYPE1 = 0,
@@ -100,6 +106,7 @@ enum {
 	TEST_SWAP = 1 << 3,
 	TEST_INVALID_METADATA_SIZES = 1 << 4,
 	TEST_INVALID_HDR = 1 << 5,
+	TEST_BRIGHTNESS = 1 << 6,
 };
 
 /* BPC connector state. */
@@ -448,6 +455,30 @@ static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
 	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
 }
 
+static void adjust_brightness(data_t *data, uint32_t flags)
+{
+	igt_backlight_context_t context;
+	int r_bright, w_bright;
+
+	snprintf(context.path, PATH_MAX, "intel_backlight");
+	snprintf(context.backlight_dir_path, PATH_MAX, "%s", BACKLIGHT_PATH);
+
+	igt_assert(igt_backlight_read(&context.max, "max_brightness", &context) > -1);
+	igt_assert(context.max);
+
+	igt_assert(igt_backlight_read(&context.old, "brightness", &context) > -1);
+
+	for (w_bright = 0; w_bright <= context.max ; w_bright += 50) {
+		igt_assert_eq(igt_backlight_write(w_bright, "brightness", &context), 0);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_assert_eq(igt_backlight_read(&r_bright, "brightness", &context), 0);
+
+		igt_assert_eq(w_bright, r_bright);
+	}
+
+	igt_assert_eq(igt_backlight_write(context.old, "brightness", &context), 0);
+}
+
 static void test_static_toggle(data_t *data, enum pipe pipe,
 			       igt_output_t *output,
 			       uint32_t flags)
@@ -483,6 +514,11 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown EOTF [0-9]+\""), 0);
 		goto cleanup;
 	}
+	if (flags & TEST_BRIGHTNESS) {
+		igt_require_f(is_intel_device(data->fd), "Only supported on Intel devices\n");
+		adjust_brightness(data, flags);
+	}
+
 	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
@@ -685,7 +721,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe), output->name) {
-				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND | TEST_INVALID_HDR))
+				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
+					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 					test_static_toggle(data, pipe, output, flags);
 				if (flags & TEST_SWAP)
 					test_static_swap(data, pipe, output);
@@ -734,6 +771,10 @@ igt_main
 	igt_subtest_with_dynamic("static-toggle-suspend")
 		test_hdr(&data, TEST_SUSPEND);
 
+	igt_describe("Tests brightness while entering and exiting HDR mode");
+	igt_subtest_with_dynamic("brightness-with-hdr")
+		test_hdr(&data, TEST_BRIGHTNESS);
+
 	igt_describe("Tests swapping static HDR metadata");
 	igt_subtest_with_dynamic("static-swap")
 		test_hdr(&data, TEST_SWAP);
-- 
2.34.1

