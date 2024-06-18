Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF13C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 10:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35EB10E634;
	Tue, 18 Jun 2024 10:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCgmTY1J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C9010E633
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718707094; x=1750243094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o1kzHU8I6aHgMeIRyewxYocvA6Aimzu618E56TT5+L0=;
 b=oCgmTY1J9J1IHZxn8/u094kqYSrNN2k3RNgrL39Swy7lAuMD51bcQL8R
 8MvOttQP7fSv1TS2ERQW959dJee1kHlTH8t/kLmWeq7pos2UNzwNxL878
 DEKpuodLx4nPb6lpbKhj74Reo2YeRb5oxjauDTrp3OwSN2QArde9Kj2+q
 HKFDH0Bm9FX/eZWLtmRogjxmU2L+3rkYk1/A712rwbtyCuYMKoiO6xf3t
 7Jhnz+JP5s8XIR6lILVcVXqEXnK1tymq6ZZVp7WcZDhOJFDVZD5POa2D6
 SmrF8WLy/3exdIgeKjW30rCQiFC08kHFxvpQBTtk2n1WOV6swxbotWgA6 g==;
X-CSE-ConnectionGUID: XxHPqjQxTrKEQA5LyVQ1tA==
X-CSE-MsgGUID: jhdqZS0QQ7qBnz3sIb9ycg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26692231"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26692231"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 03:38:14 -0700
X-CSE-ConnectionGUID: PAlqKs1jS8S1TlRPj6JmYA==
X-CSE-MsgGUID: flF2gJ6kRK+EVlMFTdQ92g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41615525"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa009.jf.intel.com with ESMTP; 18 Jun 2024 03:38:12 -0700
From: "Santhosh Reddy, Guddati" <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Santhosh Reddy, Guddati" <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_pipe_crc_basic: Add tests for supported
 formats
Date: Tue, 18 Jun 2024 16:12:42 +0530
Message-ID: <20240618104242.205236-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618052652.411119-1-santhosh.reddy.guddati@intel.com>
References: <20240618052652.411119-1-santhosh.reddy.guddati@intel.com>
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

Current kms_pipe_crc_basic supports crc check for planar formats like NV12 and
XRGB8888, added subtest to validate crc for all the supported formats
---
 tests/kms_pipe_crc_basic.c | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 0c19745bc..b8a0689e4 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -82,6 +82,11 @@
  *              CRTC does not cause issues.
  */
 
+/**
+ * SUBTEST: compare-crc-sanitycheck-supported-formats
+ * Description: Basic sanity check for CRC mismatches with supported formats.
+ */
+
 static bool extended;
 static enum pipe active_pipes[IGT_MAX_PIPES];
 static uint32_t last_pipe;
@@ -357,6 +362,33 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 
 data_t data = {0, };
 
+/**
+ * @brief Retrieves the supported formats for a given output and pipe.
+ *
+ * This function returns an array of supported formats for a specific output and pipe.
+ *
+ * @param output The output for which to retrieve the supported formats.
+ * @param count  A pointer to store the number of supported formats.
+ * @param pipe   The pipe for which to retrieve the supported formats.
+ *
+ * @return An array of supported formats for the given output and pipe.
+ */
+static uint32_t* get_supported_formats(igt_output_t *output, uint32_t *count, enum pipe pipe)
+{
+	igt_plane_t *primary;
+	uint32_t *formats = NULL;
+
+	igt_output_set_pipe(output, pipe);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	*count = primary->format_mod_count;
+	formats = (uint32_t *) malloc(sizeof(uint32_t) * (*count + 1));
+	for (uint32_t i = 0; i < *count; i++) {
+		formats[i] = primary->formats[i];
+	}
+	return formats;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	switch (opt) {
@@ -377,6 +409,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	enum pipe pipe;
 	igt_output_t *output;
+	uint32_t *supported_formats = NULL;
+	uint32_t count = 0;
 	struct {
 		const char *name;
 		unsigned flags;
@@ -498,6 +532,33 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_describe("Basic sanity check for CRC mismatches with supported formats");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-supported-formats") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (simulation_constraint(pipe))
+				continue;
+
+			if(!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
+			supported_formats = get_supported_formats(output, &count, pipe);
+			for (i=0; i<count; i++) {
+
+				// Skip the formats that are not supported
+				if (supported_formats[i] == DRM_FORMAT_NV12 || supported_formats[i] == DRM_FORMAT_XRGB8888 \
+						|| supported_formats[i] == DRM_FORMAT_C8) {
+					igt_info("Skipping format "IGT_FORMAT_FMT" \n", IGT_FORMAT_ARGS(supported_formats[i]));
+					continue;
+				}
+
+				igt_info("Testing format "IGT_FORMAT_FMT" \n", IGT_FORMAT_ARGS(supported_formats[i]));
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+					test_compare_crc(&data, pipe, output, supported_formats[i]);
+				}
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.43.0

