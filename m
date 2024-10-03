Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D822CF854E
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 02:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F7C10E35D;
	Thu,  3 Oct 2024 02:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcK+J9fc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659010E35D
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 02:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727922937; x=1759458937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kSYy3HzE8jtqU8C7GLN0G9PmvoTaX76uRK6DLc2/WjA=;
 b=fcK+J9fcKpRp+GO077J/hcBFcfvsLyOviWfgA31dESAINDi8ap8GEomD
 dqgY/lMv7Dnq71BV1elOGH1p1dyzmvxUcs51DOE9aCUlZsQg8HUe/V5IL
 ygDWBrIgly8eWRLZ3dFJZFgc2YMaMJ2SK8EJenhmcTaljKw2Le7NymHK5
 hS6FLLlrOorXELkXC0UUDrlIGuVKY3nujZPKk9I/U/japPdZI/hbqmGTk
 W1ouQr3g/KKJHrIxWGDAXtgKSVXfMaUEugSHnLxsnnnxdENXdAb0pX7v/
 MMZcuaxAAUOQhkcl0kQJ1byNL/kU0Kwo1IB8qFt68hl9nQtuhUj6cZbhn A==;
X-CSE-ConnectionGUID: Aj3VtQMiRZiFX7QH31DMZA==
X-CSE-MsgGUID: zMpv2QZgRlK4fl3RWzt/QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30902727"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="30902727"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 19:35:37 -0700
X-CSE-ConnectionGUID: ifhaL0rtQ1SVG7TkqzSTIg==
X-CSE-MsgGUID: EpIDcrJQSWmyhSHVvXKngw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="79053336"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 19:35:35 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 1/1] tests/kms_hdr: Test brightness manipulation in
 HDR mode
Date: Thu,  3 Oct 2024 08:04:29 +0530
Message-Id: <20241003023429.1967339-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003023429.1967339-1-santhosh.reddy.guddati@intel.com>
References: <20241003023429.1967339-1-santhosh.reddy.guddati@intel.com>
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

v2: adjust brightness range, refactor and restore brightness (Pranay)

v3: reuse functions, add flags to avoid duplicate code (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_hdr.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..1b47228d0 100644
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
 
+#define INTEL_BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
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
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
 	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
 }
 
+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. */
+static void adjust_brightness(data_t *data, uint32_t flags)
+{
+	char brightness_path[1024];
+	int brightness_fd;
+	char brightness_value[64];
+	int current_brightness;
+	int max_brightness;
+	int read_brightness;
+	int fd, i;
+
+	/* Get max brightness */
+	snprintf(brightness_path, sizeof(brightness_path),
+		 "%s/%s", INTEL_BACKLIGHT_PATH, "max_brightness");
+	fd = open(brightness_path, O_RDONLY);
+	igt_assert_f(fd >= 0, "Failed to open %s\n", brightness_path);
+
+	igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0);
+
+	max_brightness = atoi(brightness_value);
+
+	close(fd);
+
+	/* Get current brightness */
+	snprintf(brightness_path, sizeof(brightness_path),
+		 "%s/%s", INTEL_BACKLIGHT_PATH, "brightness");
+	fd = open(brightness_path, O_RDONLY);
+	igt_assert_f(fd >= 0, "Failed to open %s\n", brightness_path);
+
+	igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0);
+
+	current_brightness = atoi(brightness_value);
+
+	close(fd);
+
+	for (i = 0; i <= max_brightness; i += 50) {
+		fd = open(brightness_path, O_WRONLY);
+		igt_assert_f(fd >= 0, "Failed to open %s\n", brightness_path);
+
+		snprintf(brightness_value, sizeof(brightness_value), "%d", i);
+		igt_assert(write(fd, brightness_value, strlen(brightness_value)) > 0);
+
+		close(fd);
+
+		/* Verify brightness adjustment */
+		fd = open(brightness_path, O_RDONLY);
+		igt_assert(fd >= 0);
+
+		igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0);
+
+		read_brightness = atoi(brightness_value);
+
+		igt_assert_eq(read_brightness, i);
+
+		close(fd);
+	}
+
+	fd = open(brightness_path, O_WRONLY);
+	igt_assert_f(fd >= 0, "Failed to open %s\n", brightness_path);
+
+	snprintf(brightness_value, sizeof(brightness_value), "%d", current_brightness);
+	igt_assert(write(brightness_fd, brightness_value, strlen(brightness_value)) > 0);
+
+	close(fd);
+}
+
 static void test_static_toggle(data_t *data, enum pipe pipe,
 			       igt_output_t *output,
 			       uint32_t flags)
@@ -483,6 +556,11 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
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
@@ -685,7 +763,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe), output->name) {
-				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND | TEST_INVALID_HDR))
+				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
+					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 					test_static_toggle(data, pipe, output, flags);
 				if (flags & TEST_SWAP)
 					test_static_swap(data, pipe, output);
@@ -734,6 +813,10 @@ igt_main
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

