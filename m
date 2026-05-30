Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3614FCD6E49
	for <igt-dev@archiver.kernel.org>; Sat, 30 May 2026 19:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31BD10E3C7;
	Sat, 30 May 2026 19:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QO53qOO8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF94112989
 for <igt-dev@lists.freedesktop.org>; Sat, 30 May 2026 19:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780169281; x=1811705281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZNxa0Xd3sUNU1TqgMvyIT9rrrWUKE0pBYyTP6eoor1A=;
 b=QO53qOO8K7HgfokzcthemUbKDC8oA8+lJgDXeO04yDeWQVA1mdfamN8R
 cxevKW6WzPxNleguJvgV9ksHbli5vBJfKfbx4DlYyAf8WtK+OodKqua8Q
 b5qJdZY13akS4nlCXsEsKqmk14izggeYoRCbAgklhKuWo7GnJwRc5hNOO
 bkgvCm4RG0nZFhmDdXxseRQSrOutBKkcQMgJAvaiv3g1SDjnEIwlGwn66
 RS2J2G4k33o0jhudhfCkaH7DMYIPYrNtie8yBqUDyjP0mci9SrVO3Re7X
 CIX336g8ZBluurfMncCkd2DPNZgmi2OHVVkwDW70kx8j356FGw273rz5u g==;
X-CSE-ConnectionGUID: CCicsjewScyjxt62162NQA==
X-CSE-MsgGUID: yIRkiZVPS0iQ2kC68YywOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="103657578"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; d="scan'208";a="103657578"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2026 12:28:01 -0700
X-CSE-ConnectionGUID: 3DftRDQhTpOYzazYZA5HLg==
X-CSE-MsgGUID: sJ8alG3MS52Bk1GBacHTWg==
X-ExtLoop1: 1
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 12:28:00 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v7 5/5] tests/intel/kms_dsc: Add force dsc and
Date: Sun, 31 May 2026 01:06:40 +0530
Message-Id: <20260530193640.2551688-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260530193640.2551688-1-swati2.sharma@intel.com>
References: <20260530193640.2551688-1-swati2.sharma@intel.com>
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

Add non-joiner, big-joiner, and ultra-joiner variants for all
DSC subtests:
- Non-joiner: if mode naturally triggers joiner, pick a
  non-joiner mode instead.
- Big-joiner: if mode naturally triggers bigjoiner, go as-is;
  otherwise force bigjoiner via debugfs.
- Ultra-joiner: if mode naturally triggers ultrajoiner, go as-is;
  otherwise force ultrajoiner via debugfs.

v2: -fix if() for ultra/big joiner (Ankit)
v3: -Add '-' separator in subtest names when using
     igt_get_joined_pipes_name (Santhosh)
v4: -Use 'enum joined_pipes force_joined_pipes' in data_t (Ankit)
    -Use dsc-basic-%s format for subtest names (Ankit)
    -Use igt_crtc_for_pipe() to check consecutive HW pipes,
     handling fused pipe holes properly (Ankit)
v5: -Use igt_display_n_crtcs() instead of open-coded
     for_each_crtc counting loop (Jani)
v6: -Explicitly handle non-joiner and joiner mode selection
     based on display capabilities (Karthik)
    -Use pipe check from helper instead of test (Karthik)
v7: -Only force joiner when mode does not naturally trigger
     the desired joiner type (Karthik)

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 249 ++++++++++++++++++++++++++++++------------
 1 file changed, 180 insertions(+), 69 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 093a16151..9f64dac6b 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -43,7 +43,11 @@
 /**
  * SUBTEST: dsc-%s
  * Description: Tests Display Stream Compression functionality if supported by a
- *              connector by forcing %arg[1] on all connectors that support it
+ *              connector by forcing %arg[1] on all connectors that support it.
+ *              Non-joiner variants select a non-joiner mode if the highest-clock
+ *              mode would naturally trigger joiner. Joiner variants use the
+ *              highest-clock mode as-is if it naturally triggers the desired
+ *              joiner type, otherwise force joiner via debugfs.
  *
  * arg[1]:
  *
@@ -55,6 +59,22 @@
  * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
  * @fractional-bpp:               DSC with fractional bpp with default parameters
  * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
+ * @basic-bigjoiner:                        DSC with big joiner and default parameters
+ * @with-formats-bigjoiner:                 DSC with big joiner and diff formats
+ * @with-bpc-bigjoiner:                     DSC with big joiner and certain input BPC
+ * @with-bpc-formats-bigjoiner:             DSC with big joiner and certain input BPC with diff formats
+ * @with-output-formats-bigjoiner:          DSC with big joiner and output formats
+ * @with-output-formats-with-bpc-bigjoiner: DSC with big joiner and output formats with certain input BPC
+ * @fractional-bpp-bigjoiner:               DSC with big joiner and fractional bpp
+ * @fractional-bpp-with-bpc-bigjoiner:      DSC with big joiner and fractional bpp with certain input BPC
+ * @basic-ultrajoiner:                        DSC with ultra joiner and default parameters
+ * @with-formats-ultrajoiner:                 DSC with ultra joiner and diff formats
+ * @with-bpc-ultrajoiner:                     DSC with ultra joiner and certain input BPC
+ * @with-bpc-formats-ultrajoiner:             DSC with ultra joiner and certain input BPC with diff formats
+ * @with-output-formats-ultrajoiner:          DSC with ultra joiner and output formats
+ * @with-output-formats-with-bpc-ultrajoiner: DSC with ultra joiner and output formats with certain input BPC
+ * @fractional-bpp-ultrajoiner:               DSC with ultra joiner and fractional bpp
+ * @fractional-bpp-with-bpc-ultrajoiner:      DSC with ultra joiner and fractional bpp with certain input BPC
  */
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
@@ -82,12 +102,29 @@ typedef struct {
 	int input_bpc;
 	int disp_ver;
 	igt_crtc_t *crtc;
+	enum joined_pipes force_joined_pipes;
 	bool limited;
 } data_t;
 
 static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
 static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
 static uint32_t bpc_list[] = {8, 10, 12};
+static enum joined_pipes joiner_tests[] = {
+	JOINED_PIPES_DEFAULT,
+	JOINED_PIPES_BIG_JOINER,
+	JOINED_PIPES_ULTRA_JOINER,
+};
+
+static const char *joiner_subtest_suffix(enum joined_pipes jp)
+{
+	static char suffix[32];
+
+	if (!jp)
+		return "";
+
+	snprintf(suffix, sizeof(suffix), "-%s", igt_get_joined_pipes_name(jp));
+	return suffix;
+}
 
 static inline void manual(const char *expected)
 {
@@ -126,6 +163,10 @@ static void test_cleanup(data_t *data)
 
 	igt_output_set_crtc(output, NULL);
 	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
+
+	kmstest_force_connector_joiner(data->drm_fd,
+				       output->config.connector,
+				       JOINED_PIPES_DEFAULT);
 }
 
 /* re-probe connectors and do a modeset with DSC */
@@ -179,6 +220,30 @@ static void update_display(data_t *data, uint32_t test_type)
 	igt_sort_connector_modes(output->config.connector, sort_drm_modes_by_clk_dsc);
 	mode = &output->config.connector->modes[0];
 
+	if (data->force_joined_pipes == JOINED_PIPES_DEFAULT) {
+		/*
+		 * Non-joiner: pick a mode that doesn't require joiner.
+		 * The highest-clock mode may trigger joiner naturally.
+		 */
+		mode = igt_get_non_joiner_mode(data->drm_fd, output);
+		igt_require_f(mode, "No non-joiner mode available on %s\n",
+			      output->name);
+	} else {
+		int max_dotclock = igt_get_max_dotclock(data->drm_fd);
+		bool is_natural = (data->force_joined_pipes == JOINED_PIPES_BIG_JOINER)
+			? igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)
+			: igt_ultrajoiner_possible(data->drm_fd, mode, max_dotclock);
+
+		/*
+		 * If mode does not naturally trigger joiner, force it.
+		 * Otherwise the kernel handles it on its own.
+		 */
+		if (!is_natural)
+			kmstest_force_connector_joiner(data->drm_fd,
+						       connector,
+						       data->force_joined_pipes);
+	}
+
 	do {
 		if (data->output_format != DSC_FORMAT_RGB)
 			mode = get_next_mode(output, index++);
@@ -253,10 +318,12 @@ reset:
 
 static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		     unsigned int plane_format,
-		     enum dsc_output_format output_format)
+		     enum dsc_output_format output_format,
+		     enum joined_pipes joined_pipes)
 {
 	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
+	int n_pipes = igt_display_n_crtcs(display);
 	char name[3][LEN] = {
 				{0},
 				{0},
@@ -266,6 +333,10 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 	igt_require_f(data->count > 0, "No valid output found, either sink doesn't support dsc or min 8bpc\n");
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
+	if (joined_pipes != JOINED_PIPES_DEFAULT &&
+	    !igt_is_joiner_supported_by_source(data->drm_fd, joined_pipes))
+		return;
+
 	for_each_crtc(display, crtc) {
 		for (int i = 0; i < data->count; i++) {
 			data->output_format = output_format;
@@ -273,6 +344,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 			data->input_bpc = bpc;
 			data->output = data->valid_output[i];
 			data->crtc = crtc;
+			data->force_joined_pipes = joined_pipes;
 
 			if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
 				continue;
@@ -287,6 +359,13 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 						      data->drm_fd, data->output)))
 				continue;
 
+			/* Check joiner constraints for this pipe */
+			if (joined_pipes != JOINED_PIPES_DEFAULT &&
+			    !check_dsc_joiner_constraints(data->drm_fd, data->output,
+							  display, crtc->pipe,
+							  n_pipes, joined_pipes))
+				continue;
+
 			if (test_type & TEST_DSC_OUTPUT_FORMAT)
 				snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
 			if (test_type & TEST_DSC_FORMAT)
@@ -346,85 +425,117 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_describe("Tests basic display stream compression functionality if supported "
-		     "by a connector by forcing DSC on all connectors that support it "
-		     "with default parameters");
-	igt_subtest_with_dynamic("dsc-basic")
+	for (int i = 0; i < ARRAY_SIZE(joiner_tests); i++) {
+		igt_describe_f("Tests basic display stream compression functionality "
+			       "if supported by a connector by forcing DSC%s on all "
+			       "connectors that support it with default parameters",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-basic%s",
+					   joiner_subtest_suffix(joiner_tests[i]))
 			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
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
+				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB,
+				 joiner_tests[i]);
+
+		igt_describe_f("Tests basic display stream compression functionality "
+			       "if supported by a connector by forcing DSC%s on all "
+			       "connectors that support it with default parameters "
+			       "and creating fb with diff formats",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-with-formats%s",
+					   joiner_subtest_suffix(joiner_tests[i])) {
+			for (int k = 0; k < ARRAY_SIZE(format_list); k++)
+				test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
+					 format_list[k], DSC_FORMAT_RGB,
+					 joiner_tests[i]);
+		}
 
-	igt_describe("Tests basic display stream compression functionality if supported "
-		     "by a connector by forcing DSC on all connectors that support it "
-		     "with certain input BPC for the connector");
-	igt_subtest_with_dynamic("dsc-with-bpc") {
-		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
-			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
-				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
-	}
+		igt_describe_f("Tests basic display stream compression functionality "
+			       "if supported by a connector by forcing DSC%s on all "
+			       "connectors that support it with certain input BPC "
+			       "for the connector",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-with-bpc%s",
+					   joiner_subtest_suffix(joiner_tests[i])) {
+			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
+				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
+					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB,
+					 joiner_tests[i]);
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
+		igt_describe_f("Tests basic display stream compression functionality "
+			       "if supported by a connector by forcing DSC%s on all "
+			       "connectors that support it with certain input BPC "
+			       "for the connector with diff formats",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s",
+					   joiner_subtest_suffix(joiner_tests[i])) {
+			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
+				for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
+					test_dsc(&data,
+						 TEST_DSC_BPC | TEST_DSC_FORMAT,
+						 bpc_list[j], format_list[k],
+						 DSC_FORMAT_RGB,
+						 joiner_tests[i]);
+				}
 			}
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
+		igt_describe_f("Tests basic display stream compression functionality "
+			       "if supported by a connector by forcing DSC%s and "
+			       "output format on all connectors that support it",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-with-output-formats%s",
+					   joiner_subtest_suffix(joiner_tests[i])) {
+			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
+				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT,
+					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
+					 output_format_list[k],
+					 joiner_tests[i]);
+		}
 
-	igt_describe("Tests basic display stream compression functionality if supported "
-		     "by a connector by forcing DSC and output format on all connectors "
-		     "that support it with certain input BPC for the connector");
-	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
-		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
-			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
-				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
-					 bpc_list[j], DRM_FORMAT_XRGB8888,
-					 output_format_list[k]);
+		igt_describe_f("Tests basic display stream compression functionality "
+			       "if supported by a connector by forcing DSC%s and "
+			       "output format on all connectors that support it "
+			       "with certain input BPC for the connector",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s",
+					   joiner_subtest_suffix(joiner_tests[i])) {
+			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
+				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
+					test_dsc(&data,
+						 TEST_DSC_OUTPUT_FORMAT |
+						 TEST_DSC_BPC,
+						 bpc_list[j], DRM_FORMAT_XRGB8888,
+						 output_format_list[k],
+						 joiner_tests[i]);
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
+		igt_describe_f("Tests fractional compressed bpp functionality if "
+			       "supported by a connector by forcing "
+			       "fractional_bpp%s on all connectors that support "
+			       "it with default parameter",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s",
+					   joiner_subtest_suffix(joiner_tests[i]))
 			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
 				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
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
+				 DSC_FORMAT_RGB, joiner_tests[i]);
+
+		igt_describe_f("Tests fractional compressed bpp functionality if "
+			       "supported by a connector by forcing "
+			       "fractional_bpp%s on all connectors that support "
+			       "it with certain input BPC for the connector",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s",
+					   joiner_subtest_suffix(joiner_tests[i])) {
+			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
+				test_dsc(&data,
+					 TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
+					 bpc_list[j], DRM_FORMAT_XRGB8888,
+					 DSC_FORMAT_RGB, joiner_tests[i]);
+		}
 	}
 
 	igt_fixture() {
-- 
2.25.1

