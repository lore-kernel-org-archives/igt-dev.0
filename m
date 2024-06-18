Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79233C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1051810E0D1;
	Tue, 18 Jun 2024 05:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwhmfiFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F58C10E0D1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718688518; x=1750224518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8X/WbXf9/oTjGbEkGokECCWWcBg96Df5NYC4n4pk+J4=;
 b=hwhmfiFkwlBH1ekOWyyAuTziS97vQAUHHkHulfB8xDUJV5lG1jYn/JfM
 mb6OVooTK7eKbENpfV4PCnQMk35KKto12KMkfowhRe+E8eaEW213Ct35r
 0Rs8sxKUbqILMb0Y6Kb91A2TGBEXfLmo3H37ojA3b3+hDobV727Hh1IZJ
 uVoFhWg+YnD9iEN+1WtRof2nFpebGFM4EyOYrS9nkKA3Ju9PI87K66RH6
 fRe8skcng4sHsu6CUnvrg9v6MwASZd3ROK9jVqKbY5ko37XKV6mWmLWGS
 Jy26YUqU+I9Q/BEjzrV+eMUt3gbDvLpzoAW8x1jFEqzW7RW1/Eo7OlHm9 A==;
X-CSE-ConnectionGUID: s0eHHjMZTGGx4wNdARQVwg==
X-CSE-MsgGUID: E9WD5GRsSSW8qe2g4aM5Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19360710"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="19360710"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:28:33 -0700
X-CSE-ConnectionGUID: MLxD0szZTrW3l+8MDx9Wkw==
X-CSE-MsgGUID: mjmLhKPESUWwxrNxvIimxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="46340248"
Received: from tglu-tiger-lake-client-platform.iind.intel.com ([10.145.169.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:28:32 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] add tests to check crc for supported formats
Date: Tue, 18 Jun 2024 10:56:52 +0530
Message-ID: <20240618052652.411119-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
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

