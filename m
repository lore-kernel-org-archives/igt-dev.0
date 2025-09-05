Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFEDCA1017
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 21:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7F510EC50;
	Fri,  5 Sep 2025 21:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQaRJ6fF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFCF10EC50
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 21:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757106095; x=1788642095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a5hyIppITA9Jgd86utGpp2/JGasLDdDUoMB7Aw/9xQI=;
 b=YQaRJ6fF01Af7dbElJdWPcdc+/gmOh/aCjbhIMCWoiWQUdJOZVipDvN5
 7Wh3ttmZQtPSrBLfmlPSnBaxJqAjnWGrDvbJc/uxv08VGjBrLEoEOkHce
 yC7qxkKoWvc3Qn2Deh1gswXffx4dV7BakfM9BFELIoODLEj6Z6UP99i0g
 Ud8qH/BWnRLXdx3Uzn5E4ghhTIZgRZLkp/AT5cmJipTmkVc3lkPdoY3SI
 rSXN12iDkwgh9NtP7fzqvcuCjam+Kr7QGHMXPruel2Bal5ZrMEkje7t0v
 /U4X35G0igwiiJZ5PP4xmdbsVJy4I6JXXpgzO+8HGCYObpGYPItVNMQum w==;
X-CSE-ConnectionGUID: 2kC+g3jCR72JhN+6/0PQ+g==
X-CSE-MsgGUID: S5iMfmhFSZS2UGLmiaELnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59530914"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59530914"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:01:35 -0700
X-CSE-ConnectionGUID: 107K9qciS8O+4mEqYhd07w==
X-CSE-MsgGUID: 5fj+F5M9Sku4eGkYqF4Eng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="177459222"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:01:32 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 4/4] tests/intel/kms_dsc: Add force dsc and joiner test cases
Date: Sat,  6 Sep 2025 02:38:16 +0530
Message-Id: <20250905210816.319104-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905210816.319104-1-swati2.sharma@intel.com>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
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

Add test cases where we are validating force dsc and force
joiner.

v2: -fix if() for ultra/big joiner (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 198 +++++++++++++++++++++++++++---------------
 1 file changed, 126 insertions(+), 72 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 7f0745370..5720167a4 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -55,7 +55,27 @@
  * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
  * @fractional-bpp:               DSC with fractional bpp with default parameters
  * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
- */
+ *
+ * SUBTEST: dsc-%s-%s
+ * Description: Tests Display Stream Compression functionality if supported by a
+ *              connector by forcing %arg[1] and %arg[2] on all connectors that support it
+ *
+ * arg[1]:
+ *
+ * @basic:                        DSC with default parameters
+ * @with-bpc:                     DSC with certain input BPC for the connector
+ * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
+ * @with-formats:                 DSC with default parameters and creating fb with diff formats
+ * @with-output-formats:          DSC with output formats
+ * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
+ * @fractional-bpp:               DSC with fractional bpp with default parameters
+ * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
+ *
+ * arg[2]:
+ *
+ * @bigjoiner:			  big joiner
+ * @ultrajoiner:		  ultra joiner
+*/
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
@@ -81,11 +101,13 @@ typedef struct {
 	int disp_ver;
 	enum pipe pipe;
 	bool limited;
+	int joined_pipes;
 } data_t;
 
 static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
 static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
 static uint32_t bpc_list[] = {8, 10, 12};
+static int joiner_tests[] = {JOINED_PIPES_DEFAULT, JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
 
 static inline void manual(const char *expected)
 {
@@ -135,6 +157,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	int current_bpc = 0;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
+	bool status;
 	igt_output_t *output = data->output;
 	igt_display_t *display = &data->display;
 	drmModeConnector *connector = output->config.connector;
@@ -147,6 +170,11 @@ static void update_display(data_t *data, uint32_t test_type)
 	save_force_dsc_en(data->drm_fd, data->output);
 	force_dsc_enable(data->drm_fd, data->output);
 
+	if (data->joined_pipes == JOINED_PIPES_BIG_JOINER || data->joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
+		status = kmstest_force_connector_joiner(data->drm_fd, connector, data->joined_pipes);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+	}
+
 	if (test_type & TEST_DSC_BPC) {
 		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
 		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
@@ -246,17 +274,22 @@ reset:
 
 static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		     unsigned int plane_format,
-		     enum dsc_output_format output_format)
+		     enum dsc_output_format output_format,
+		     int joined_pipes)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	enum pipe pipe;
+	int n_pipes = 0;
 	char name[3][LEN] = {
 				{0},
 				{0},
 				{0},
 			    };
 
+	for_each_pipe(display, pipe)
+		n_pipes++;
+
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
@@ -265,6 +298,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		data->input_bpc = bpc;
 		data->output = output;
 		data->pipe = pipe;
+		data->joined_pipes = joined_pipes;
 
 		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
 		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
@@ -285,6 +319,22 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 						      data->drm_fd, data->output)))
 			continue;
 
+		/*
+		 * Skip invalid starting pipes:
+		 * - Bigjoiner needs 2 consecutive pipes : skip last pipe (n_pipes - 1)
+		 * - Ultrajoiner needs 4 consecutive pipes : skip last 3 pipes (data->pipe > n_pipes - 4)
+		 */
+		if ((joined_pipes == JOINED_PIPES_BIG_JOINER &&
+		    (data->pipe == n_pipes - 1 ||
+		     !check_dsc_joiner_constraints(data->drm_fd, data->output,
+						   n_pipes, joined_pipes))) ||
+		    (joined_pipes == JOINED_PIPES_ULTRA_JOINER &&
+		    (data->pipe > n_pipes - 4 ||
+		     !check_dsc_joiner_constraints(data->drm_fd, data->output,
+						   n_pipes, joined_pipes)))) {
+			continue;
+		}
+
 		if (test_type & TEST_DSC_OUTPUT_FORMAT)
 			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
 		if (test_type & TEST_DSC_FORMAT)
@@ -334,85 +384,89 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		igt_require(is_dsc_supported_by_source(data.drm_fd));
 	}
 
-	igt_describe("Tests basic display stream compression functionality if supported "
-		     "by a connector by forcing DSC on all connectors that support it "
-		     "with default parameters");
-	igt_subtest_with_dynamic("dsc-basic")
-			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
-				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
-
-	igt_describe("Tests basic display stream compression functionality if supported "
-		     "by a connector by forcing DSC on all connectors that support it "
-		     "with default parameters and creating fb with diff formats");
-	igt_subtest_with_dynamic("dsc-with-formats") {
-		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
-			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
-				 format_list[k], DSC_FORMAT_RGB);
-	}
 
-	igt_describe("Tests basic display stream compression functionality if supported "
-		     "by a connector by forcing DSC on all connectors that support it "
-		     "with certain input BPC for the connector");
-	igt_subtest_with_dynamic("dsc-with-bpc") {
-		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
-			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
-				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
-	}
+	for (int i = 0; i < ARRAY_SIZE(joiner_tests) ; i++) {
+		igt_describe("Tests basic display stream compression functionality if supported "
+			     "by a connector by forcing DSC on all connectors that support it "
+			     "with default parameters");
+		igt_subtest_with_dynamic_f("dsc-basic%s", igt_get_joined_pipes_name(joiner_tests[i])) {
+				test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
+					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
+		}
 
-	igt_describe("Tests basic display stream compression functionality if supported "
-		     "by a connector by forcing DSC on all connectors that support it "
-		     "with certain input BPC for the connector with diff formats");
-	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
-		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
-			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
-				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
-				bpc_list[j], format_list[k],
-				DSC_FORMAT_RGB);
-			}
+		igt_describe("Tests basic display stream compression functionality if supported "
+			     "by a connector by forcing DSC on all connectors that support it "
+			     "with default parameters and creating fb with diff formats");
+		igt_subtest_with_dynamic_f("dsc-with-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int k = 0; k < ARRAY_SIZE(format_list); k++)
+				test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
+					 format_list[k], DSC_FORMAT_RGB, joiner_tests[i]);
 		}
-	}
 
-	igt_describe("Tests basic display stream compression functionality if supported "
-		     "by a connector by forcing DSC and output format on all connectors "
-		     "that support it");
-	igt_subtest_with_dynamic("dsc-with-output-formats") {
-		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
-			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
-				 DRM_FORMAT_XRGB8888,
-				 output_format_list[k]);
-	}
+		igt_describe("Tests basic display stream compression functionality if supported "
+			     "by a connector by forcing DSC on all connectors that support it "
+			     "with certain input BPC for the connector");
+		igt_subtest_with_dynamic_f("dsc-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
+				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
+					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
+		}
 
-	igt_describe("Tests basic display stream compression functionality if supported "
-		     "by a connector by forcing DSC and output format on all connectors "
-		     "that support it with certain input BPC for the connector");
-	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
-		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
+		igt_describe("Tests basic display stream compression functionality if supported "
+			     "by a connector by forcing DSC on all connectors that support it "
+			     "with certain input BPC for the connector with diff formats");
+		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
 			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
-				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
-					 bpc_list[j], DRM_FORMAT_XRGB8888,
-					 output_format_list[k]);
+				for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
+					test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
+					bpc_list[j], format_list[k],
+					DSC_FORMAT_RGB, joiner_tests[i]);
+				}
 			}
 		}
-	}
 
-	igt_describe("Tests fractional compressed bpp functionality if supported "
-		     "by a connector by forcing fractional_bpp on all connectors that support it "
-		     "with default parameter. While finding the optimum compressed bpp, driver will "
-		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
-		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
-	igt_subtest_with_dynamic("dsc-fractional-bpp")
-			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
-				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
-				 DSC_FORMAT_RGB);
-
-	igt_describe("Tests fractional compressed bpp functionality if supported "
-		     "by a connector by forcing fractional_bpp on all connectors that support it "
-		     "with certain input BPC for the connector.");
-	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
-		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
-			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
-				 bpc_list[j], DRM_FORMAT_XRGB8888,
-				 DSC_FORMAT_RGB);
+		igt_describe("Tests basic display stream compression functionality if supported "
+			     "by a connector by forcing DSC and output format on all connectors "
+			     "that support it");
+		igt_subtest_with_dynamic_f("dsc-with-output-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
+				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
+					 DRM_FORMAT_XRGB8888,
+					 output_format_list[k], joiner_tests[i]);
+		}
+
+		igt_describe("Tests basic display stream compression functionality if supported "
+			     "by a connector by forcing DSC and output format on all connectors "
+			     "that support it with certain input BPC for the connector");
+		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
+				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
+					test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
+						 bpc_list[j], DRM_FORMAT_XRGB8888,
+						 output_format_list[k], joiner_tests[i]);
+				}
+			}
+		}
+
+		igt_describe("Tests fractional compressed bpp functionality if supported "
+			     "by a connector by forcing fractional_bpp on all connectors that support it "
+			     "with default parameter. While finding the optimum compressed bpp, driver will "
+			     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
+			     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
+		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s", igt_get_joined_pipes_name(joiner_tests[i]))
+				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
+					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
+					 DSC_FORMAT_RGB, joiner_tests[i]);
+
+		igt_describe("Tests fractional compressed bpp functionality if supported "
+			     "by a connector by forcing fractional_bpp on all connectors that support it "
+			     "with certain input BPC for the connector.");
+		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
+				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
+					 bpc_list[j], DRM_FORMAT_XRGB8888,
+					 DSC_FORMAT_RGB, joiner_tests[i]);
+			}
 	}
 
 	igt_fixture {
-- 
2.25.1

