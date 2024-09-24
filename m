Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F8DCF9C6F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 11:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B9C10E898;
	Tue, 24 Sep 2024 11:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjCvQy3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B94610E0B9
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 11:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727178988; x=1758714988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jHlRzFgOdqs27Ks4nwHcU9rYlGf+f7FGUi4v8SGvwic=;
 b=SjCvQy3SOgdmODqK7OIgsXxQxuhQd8Iet9Ouu9pWFQ3YN/Qcc06yjeaM
 +qWgmPRU9o7JGSqQAosGXkgdplVFsZH8DTby8brreDpycLnXHW/18obfK
 VFoiIQfsOgKLM83w3RX8CWP2mqXpd/gF3un3PAX8VG2Nd53P6u5LwKQx0
 BuGE3jkNDQihGqWY5MhOVMelUAkQ8GOol2aTPC7ioMq83iiPQ6GAcFWK8
 /oExigm2xxKHs507NOFnuMuNxLkPouKwTCv/c3Oy4rAJPJgtTjfhNddue
 B7z9jpiXo9cHg4Iz4nETSi9/KmkGvjKYAC9onmtfmjyfrGJltcJ96EJGl Q==;
X-CSE-ConnectionGUID: GS58swoPSrum8BmJDmSgzw==
X-CSE-MsgGUID: PBgnUIbhReynjkav60yqog==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37544189"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="37544189"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:56:28 -0700
X-CSE-ConnectionGUID: ZpPwqf0yQHq4GMgFF3fb4Q==
X-CSE-MsgGUID: e94cfC4yQYOYx5+b373P0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="75906160"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 04:56:27 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_hdr: Add brightness tests for hdr
Date: Tue, 24 Sep 2024 17:25:54 +0530
Message-Id: <20240924115555.773860-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924115555.773860-1-santhosh.reddy.guddati@intel.com>
References: <20240924115555.773860-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_hdr.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..4e6ff87b4 100644
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
@@ -100,6 +112,9 @@ enum {
 	TEST_SWAP = 1 << 3,
 	TEST_INVALID_METADATA_SIZES = 1 << 4,
 	TEST_INVALID_HDR = 1 << 5,
+	TEST_BRIGHTNESS = 1 << 6,
+	TEST_BRIGHTNESS_DPMS = 1 << 7,
+	TEST_BRIGHTNESS_SUSPEND = 1 << 8,
 };
 
 /* BPC connector state. */
@@ -623,6 +638,80 @@ static bool has_hdr(igt_output_t *output)
 	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
 }
 
+static int test_brightness_output(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	igt_display_t *display = &data->display;
+	igt_fb_t afb;
+	int afb_id;
+	struct hdr_output_metadata hdr;
+
+	/* 10-bit formats are slow, so limit the size. */
+	afb_id = igt_create_fb(data->fd, 512, 512,
+				   DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
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
+	/* Adjust brightness */
+	char brightness_path[1024];
+	int brightness_fd;
+	char brightness_value[4];
+
+	snprintf(brightness_path, sizeof(brightness_path),
+			 "/sys/class/backlight/intel_backlight/brightness");
+
+	brightness_fd = open(brightness_path, O_WRONLY);
+	igt_assert_f(brightness_fd >= 0, "Failed to open %s\n", brightness_path);
+
+	int write_brightness = 50;
+	snprintf(brightness_value, sizeof(brightness_value), "%d", write_brightness);
+	igt_assert(write(brightness_fd, brightness_value, strlen(brightness_value)) > 0);
+
+	close(brightness_fd);
+
+	if (flags & TEST_BRIGHTNESS_DPMS)
+		test_cycle_flags(data, TEST_DPMS);
+	if (flags & TEST_BRIGHTNESS_SUSPEND)
+		test_cycle_flags(data, TEST_SUSPEND);
+
+	/* Verify brightness adjustment */
+	brightness_fd = open(brightness_path, O_RDONLY);
+	igt_assert(brightness_fd >= 0);
+
+	igt_assert(read(brightness_fd, brightness_value, sizeof(brightness_value)) > 0);
+
+	int read_brightness = atoi(brightness_value);
+
+	igt_assert_eq(read_brightness, write_brightness);
+
+	close(brightness_fd);
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
+	return 0;
+}
+
 static void test_hdr(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -691,6 +780,11 @@ static void test_hdr(data_t *data, uint32_t flags)
 					test_static_swap(data, pipe, output);
 				if (flags & TEST_INVALID_METADATA_SIZES)
 					test_invalid_metadata_sizes(data, output);
+				if (flags & (TEST_BRIGHTNESS | TEST_BRIGHTNESS_DPMS | TEST_BRIGHTNESS_SUSPEND)) {
+					igt_require(output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP);
+					igt_require_f(is_intel_device(data->fd), "Only supported on Intel devices\n");
+					test_brightness_output(data, pipe, output, flags);
+				}
 			}
 
 			/* One pipe is enough */
@@ -734,6 +828,18 @@ igt_main
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

