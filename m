Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8B5CEBF8E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 10:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B0E10ECB2;
	Fri, 27 Sep 2024 10:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOVwPvrs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFFD10E1F7
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 10:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727432483; x=1758968483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f22QIhHX5wXJaZvpZeiTW5vX9fAN1qzQAQ4H9e4dk+4=;
 b=hOVwPvrsxTcIF2Q3OjbhSuHfHAnS+VShZpD8SvXsFfHXHtGGXeRLPE5r
 MpQsS43M5bqulS3J1GKeKCDhxsAEwU3qN86psrTYa2VqB+fVdtsbfPuEH
 olPUSnkRP7CpNT4X8kAd7Gf9ReawTRxIgW5VCJjkJHWhrcwHKjut/YrlO
 JK7GWD+RH0ZJgzG1qNzG0OQ7bUzHnHscf6yT3HgxLlpmxNBoqZol+5bTA
 LEQphNVLye5sETjL3E5zQOXawHrRFt85Fv1AvYp1SQ546OW7SSihKraoq
 uzoS9tzuA+qbkdb1/Bxyl3o9RdY9P3o0vFRxbQ8pMHPq1XI1CLHG80rCH A==;
X-CSE-ConnectionGUID: TWt4ouSaQsawAmg74O6Z6g==
X-CSE-MsgGUID: Wo/W7nb6T26CG3ka8msC8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37137190"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37137190"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 03:21:23 -0700
X-CSE-ConnectionGUID: /0v/77n3R9uZ8vWJc7z+Iw==
X-CSE-MsgGUID: xmQKubt3Q9i044iuQfUPCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="73283231"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 03:21:21 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_hdr: Add brightness tests for hdr
Date: Fri, 27 Sep 2024 15:50:37 +0530
Message-Id: <20240927102038.1001578-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927102038.1001578-1-santhosh.reddy.guddati@intel.com>
References: <20240927102038.1001578-1-santhosh.reddy.guddati@intel.com>
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

Add subtests for Aux based backlight control on hdr enabled edp panels
by changing brightness via sysfs.

v2: Add function to adjust brightness in range 0 to max, refactor code
and store and restore brightness before and after test. (Pranay)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_hdr.c | 144 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..115ed6ab5 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -64,6 +64,18 @@
  * Description: Tests static toggle with suspend
  * Functionality: colorspace, static_hdr, suspend
  *
+ * SUBTEST: brightness-with-hdr
+ * Description: Tests brightness with HDR
+ * Functionality: colorspace, static_hdr
+ *
+ * SUBTEST: brightness-with-dpms
+ * Description: Tests brightness with dpms
+ * Functionality: colorspace, static_hdr, dpms
+ *
+ * SUBTEST: brightness-with-suspend
+ * Description: Tests brightness with suspend
+ * Functionality: colorspace, static_hdr, suspend
+ *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
  * Functionality: colorspace, static_hdr
@@ -81,6 +93,9 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
 #define HDR_STATIC_METADATA_BLOCK       0x06
 #define USE_EXTENDED_TAG		0x07
 
+/* Intel Backlight Path. */
+#define INTEL_BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
+
 /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
 enum hdmi_metadata_type {
 	HDMI_STATIC_METADATA_TYPE1 = 0,
@@ -100,6 +115,9 @@ enum {
 	TEST_SWAP = 1 << 3,
 	TEST_INVALID_METADATA_SIZES = 1 << 4,
 	TEST_INVALID_HDR = 1 << 5,
+	TEST_BRIGHTNESS = 1 << 6,
+	TEST_BRIGHTNESS_DPMS = 1 << 7,
+	TEST_BRIGHTNESS_SUSPEND = 1 << 8,
 };
 
 /* BPC connector state. */
@@ -623,6 +641,112 @@ static bool has_hdr(igt_output_t *output)
 	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
 }
 
+/* Move adjust_brightness to lib/igt_sysfs to reuse in other tests. */
+static void adjust_brightness(data_t *data, uint32_t flags)
+{
+	char brightness_path[1024];
+	int brightness_fd;
+	char brightness_value[64];
+
+	snprintf(brightness_path, sizeof(brightness_path),
+			"%s/%s", INTEL_BACKLIGHT_PATH, "brightness");
+
+	/* Get current brightness */
+	brightness_fd = open(brightness_path, O_RDONLY);
+	igt_assert_f(brightness_fd >= 0, "Failed to open %s\n", brightness_path);
+
+	igt_assert(read(brightness_fd, brightness_value, sizeof(brightness_value)) > 0);
+
+	int current_brightness = atoi(brightness_value);
+
+	close(brightness_fd);
+
+	/* Get max brightness */
+	snprintf(brightness_path, sizeof(brightness_path),
+			"%s/%s", INTEL_BACKLIGHT_PATH, "max_brightness");
+
+	brightness_fd = open(brightness_path, O_RDONLY);
+	igt_assert_f(brightness_fd >= 0, "Failed to open %s\n", brightness_path);
+
+	igt_assert(read(brightness_fd, brightness_value, sizeof(brightness_value)) > 0);
+
+	int max_brightness = atoi(brightness_value);
+
+	close(brightness_fd);
+
+	for (int write_brightness = 0; write_brightness <= max_brightness; write_brightness += 50) {
+		brightness_fd = open(brightness_path, O_WRONLY);
+		igt_assert_f(brightness_fd >= 0, "Failed to open %s\n", brightness_path);
+
+		snprintf(brightness_value, sizeof(brightness_value), "%d", write_brightness);
+		igt_assert(write(brightness_fd, brightness_value, strlen(brightness_value)) > 0);
+
+		close(brightness_fd);
+
+		/* Verify brightness adjustment */
+		brightness_fd = open(brightness_path, O_RDONLY);
+		igt_assert(brightness_fd >= 0);
+
+		igt_assert(read(brightness_fd, brightness_value, sizeof(brightness_value)) > 0);
+
+		int read_brightness = atoi(brightness_value);
+
+		igt_assert_eq(read_brightness, write_brightness);
+
+		close(brightness_fd);
+	}
+
+	brightness_fd = open(brightness_path, O_WRONLY);
+	igt_assert_f(brightness_fd >= 0, "Failed to open %s\n", brightness_path);
+
+	snprintf(brightness_value, sizeof(brightness_value), "%d", current_brightness);
+	igt_assert(write(brightness_fd, brightness_value, strlen(brightness_value)) > 0);
+}
+
+static void test_brightness_output(data_t *data, enum pipe pipe,
+				    igt_output_t *output,
+				    uint32_t flags)
+{
+	igt_display_t *display = &data->display;
+	igt_fb_t afb;
+	int afb_id;
+	struct hdr_output_metadata hdr;
+
+	/* 10-bit formats are slow, so limit the size. */
+	afb_id = igt_create_fb(data->fd, 512, 512,
+					       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR,
+						   &afb);
+	igt_assert(afb_id);
+
+	draw_hdr_pattern(&afb);
+
+	/* Start in SDR. */
+	igt_plane_set_fb(data->primary, &afb);
+	igt_plane_set_size(data->primary, data->w, data->h);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+
+	/* Enter HDR, a modeset is allowed here. */
+	fill_hdr_output_metadata_st2048(&hdr);
+	set_hdr_output_metadata(data, &hdr);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
+
+	adjust_brightness(data, flags);
+
+	/* Exit HDR and enter 8bpc, cleanup. */
+	set_hdr_output_metadata(data, NULL);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
+
+}
+
 static void test_hdr(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -691,6 +815,14 @@ static void test_hdr(data_t *data, uint32_t flags)
 					test_static_swap(data, pipe, output);
 				if (flags & TEST_INVALID_METADATA_SIZES)
 					test_invalid_metadata_sizes(data, output);
+				if (flags & (TEST_BRIGHTNESS | TEST_BRIGHTNESS_DPMS |
+								TEST_BRIGHTNESS_SUSPEND)) {
+					igt_require(output->config.connector->connector_type ==
+									DRM_MODE_CONNECTOR_eDP);
+					igt_require_f(is_intel_device(data->fd),
+									"Only supported on Intel devices\n");
+					test_brightness_output(data, pipe, output, flags);
+				}
 			}
 
 			/* One pipe is enough */
@@ -734,6 +866,18 @@ igt_main
 	igt_subtest_with_dynamic("static-toggle-suspend")
 		test_hdr(&data, TEST_SUSPEND);
 
+	igt_describe("Tests brightness while entering and exiting HDR mode");
+	igt_subtest_with_dynamic("brightness-with-hdr")
+		test_hdr(&data, TEST_BRIGHTNESS);
+
+	igt_describe("Tests brightness with dpms");
+	igt_subtest_with_dynamic("brightness-with-dpms")
+		test_hdr(&data, TEST_BRIGHTNESS_DPMS);
+
+	igt_describe("Tests brightness with suspend");
+	igt_subtest_with_dynamic("brightness-with-suspend")
+		test_hdr(&data, TEST_BRIGHTNESS_SUSPEND);
+
 	igt_describe("Tests swapping static HDR metadata");
 	igt_subtest_with_dynamic("static-swap")
 		test_hdr(&data, TEST_SWAP);
-- 
2.34.1

