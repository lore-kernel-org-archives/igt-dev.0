Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6EECD13D3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 19:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D1810F41D;
	Thu, 30 Apr 2026 19:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBhK8VCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ABB10F41D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 19:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777575702; x=1809111702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VC6/3HQD2Xad9taYevSeRXLlF8q5DIsTj3dKKz1cIno=;
 b=bBhK8VCCSty0DXzAo65eUsjX93tCPpmQkPWBr+5eLs9jz3tTL0rQj15M
 FrM0aXSHz3B7i1PBP+ZC3OSIWc6DWz5SCRoS93M0r+xDs4wNC//EQ2Vjn
 jmbkzlZsGq2XeFl87OYgu5BMD8r6n0Rqrp40hLsCQMJcYGJSoYhb6M6ta
 O2O2lPVeMksbn8lrs2X2/zUdPM5I8fueoZI0J6an68TnJ2/ixEO56sKV3
 UEXZJpyZgH2vVrpzu8FjXsvchE/e0z4D2o2+Nj9USX020GIb7XCJeWPHW
 pnOS+GHDofBJLd8gpVSMhNTrO/FYoPCxxSN0GUjGVsvRauBMVQlI7dj/M Q==;
X-CSE-ConnectionGUID: JMULgNQnSVuF+nnch0a66Q==
X-CSE-MsgGUID: +atcwDC6Sdy2Y9dOBS2TrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="90003578"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="90003578"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 12:01:30 -0700
X-CSE-ConnectionGUID: j73191oBSNuB5BQWbwNY6A==
X-CSE-MsgGUID: neAiqD2VQp++1IoukXdTgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="234559323"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:01:28 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v6 4/4] tests/intel/kms_dsc: Add force dsc and joiner test cases
Date: Fri,  1 May 2026 00:39:47 +0530
Message-Id: <20260430190947.2347314-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260430190947.2347314-1-swati2.sharma@intel.com>
References: <20260430190947.2347314-1-swati2.sharma@intel.com>
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
v3: -Add '-' separator in subtest names when using
     igt_get_joined_pipes_name (Santhosh)
v4: -Use 'enum joined_pipes force_joined_pipes' in data_t (Ankit)
    -Use dsc-basic-%s format for subtest names (Ankit)
    -Use igt_crtc_for_pipe() to check consecutive HW pipes,
     handling fused pipe holes properly (Ankit)
v5: -Use igt_display_n_crtcs() instead of open-coded
     for_each_crtc counting loop (Jani)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 203 +++++++++++++++++++++++++++---------------
 1 file changed, 131 insertions(+), 72 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 69f335da3..9a19de1c4 100644
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
 	igt_crtc_t *crtc;
 	bool limited;
+	enum joined_pipes force_joined_pipes;
 } data_t;
 
 static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
 static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
 static uint32_t bpc_list[] = {8, 10, 12};
+static enum joined_pipes joiner_tests[] = {JOINED_PIPES_DEFAULT, JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
 
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
 
+	if (data->force_joined_pipes == JOINED_PIPES_BIG_JOINER || data->force_joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
+		status = kmstest_force_connector_joiner(data->drm_fd, connector, data->force_joined_pipes);
+		igt_assert_f(status, "Failed to toggle force joiner\n");
+	}
+
 	if (test_type & TEST_DSC_BPC) {
 		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
 		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
@@ -246,11 +274,13 @@ reset:
 
 static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		     unsigned int plane_format,
-		     enum dsc_output_format output_format)
+		     enum dsc_output_format output_format,
+		     enum joined_pipes joined_pipes)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
+	int n_pipes = igt_display_n_crtcs(display);
 	char name[3][LEN] = {
 				{0},
 				{0},
@@ -259,12 +289,17 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
+	if (joined_pipes != JOINED_PIPES_DEFAULT &&
+	    !igt_is_joiner_supported_by_source(data->drm_fd, joined_pipes))
+		return;
+
 	for_each_crtc_with_valid_output(display, crtc, output) {
 		data->output_format = output_format;
 		data->plane_format = plane_format;
 		data->input_bpc = bpc;
 		data->output = output;
 		data->crtc = crtc;
+		data->force_joined_pipes = joined_pipes;
 
 		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
 		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
@@ -285,6 +320,26 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 						      data->drm_fd, data->output)))
 			continue;
 
+		/*
+		 * Check joiner constraints and verify that we have
+		 * enough consecutive HW pipes starting from this crtc.
+		 * Use igt_crtc_for_pipe() to handle fused pipe holes.
+		 */
+		if (joined_pipes != JOINED_PIPES_DEFAULT &&
+		    !check_dsc_joiner_constraints(data->drm_fd, data->output,
+						  n_pipes, joined_pipes))
+			continue;
+
+		if (joined_pipes == JOINED_PIPES_BIG_JOINER &&
+		    !igt_crtc_for_pipe(display, crtc->pipe + 1))
+			continue;
+
+		if (joined_pipes == JOINED_PIPES_ULTRA_JOINER &&
+		    (!igt_crtc_for_pipe(display, crtc->pipe + 1) ||
+		     !igt_crtc_for_pipe(display, crtc->pipe + 2) ||
+		     !igt_crtc_for_pipe(display, crtc->pipe + 3)))
+			continue;
+
 		if (test_type & TEST_DSC_OUTPUT_FORMAT)
 			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
 		if (test_type & TEST_DSC_FORMAT)
@@ -334,85 +389,89 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
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
+		igt_subtest_with_dynamic_f("dsc-basic%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
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
+		igt_subtest_with_dynamic_f("dsc-with-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
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
+		igt_subtest_with_dynamic_f("dsc-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
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
+		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
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
+		igt_subtest_with_dynamic_f("dsc-with-output-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
+				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
+					 DRM_FORMAT_XRGB8888,
+					 output_format_list[k], joiner_tests[i]);
+		}
+
+		igt_describe("Tests basic display stream compression functionality if supported "
+			     "by a connector by forcing DSC and output format on all connectors "
+			     "that support it with certain input BPC for the connector");
+		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
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
+		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i]))
+				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
+					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
+					 DSC_FORMAT_RGB, joiner_tests[i]);
+
+		igt_describe("Tests fractional compressed bpp functionality if supported "
+			     "by a connector by forcing fractional_bpp on all connectors that support it "
+			     "with certain input BPC for the connector.");
+		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
+			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
+				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
+					 bpc_list[j], DRM_FORMAT_XRGB8888,
+					 DSC_FORMAT_RGB, joiner_tests[i]);
+			}
 	}
 
 	igt_fixture() {
-- 
2.25.1

