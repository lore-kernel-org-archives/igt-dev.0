Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5165C88E53
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 21:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FBE10E1F5;
	Fri, 11 Sep 2026 21:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AW0/opbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA9810E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160295; x=1820696295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CEgUlqPIMmNWsn7KxLqS99caxFEKlIhHZ3TiYdSZb8Q=;
 b=AW0/opbPkyGV8Bal9WzsGXY5emBkdCzoPwQK2uGbAfdYAgErhD73yK0i
 vX1Dkw4f7YKlr0St/VSl4U0SymnzRRoHY6WY9f8WBKABNC+EQqRTXyFZ7
 vIorbTrA/EBB4B6pLzm580L8JvIkr+PshtyEawM05eBygNYbhD3rBpY8Q
 J9AMBnFbBCD8jaYlzYWT/Ds9f+L9m+yPSOlbG6nxRppu0cs1zfR9Ym6n3
 rXJjFbPAH78PalCRimmmuq9PjMNE7JjnNiJfakKZc6CzCQlpSrA67OCUO
 0Q6rqKRHopBhbQweMtZqdL7Ll2KMWpdzzqJTHpJ9uswudrQ8oCYCjJD9G A==;
X-CSE-ConnectionGUID: ANPGrHBHSEWx23ZwNMOCMg==
X-CSE-MsgGUID: sR7G/m/eSE6NOZjnn01ZEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138967"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138967"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:15 -0700
X-CSE-ConnectionGUID: LE3wme6HS5mGU0BoUq/QGw==
X-CSE-MsgGUID: RwOPfMUaTeC5Mpy+uXWT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293703"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:14 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 5/9] tests/intel/kms_dsc: Add dsc-compressed-bpp subtest
Date: Sat, 12 Sep 2026 02:37:05 +0530
Message-Id: <20260911210709.943683-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260911210709.943683-1-swati2.sharma@intel.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
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

Add a subtest that forces DSC at each compressed BPP supported
by DSC-capable connectors. On display version >= 13, use the
sink's DPCD-derived maximum compressed BPP and test valid values
in descending quarter-BPP steps. Use fixed BPP values on older
displays.

After each successful modeset, read back the active compressed
BPP and verify it matches the requested value.

v2: Rebase

v3:
- Test compressed BPP values in descending quarter steps (Ankit)
- Use new DSC_Sink_Max_Compressed_BPP debugfs field to get the
  sink's max compressed bpp from DPCD (Ankit)
- Pass output_format through to igt_get_dsc_sink_max_compressed_bpp()
- Print the compressed BPP range and each forced value in the
  normal test log.
- Verify the requested compressed BPP was programmed after each
  successful modeset. (Sowmiya)

Assisted-by: GitHub Copilot
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 80 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 1e30f6fee..90dbcb444 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -38,6 +38,8 @@
  * Mega feature: VDSC
  */
 
+#include <math.h>
+
 #include "kms_dsc_helper.h"
 
 /**
@@ -59,6 +61,9 @@
  * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
  * @fractional-bpp:               DSC with fractional bpp with default parameters
  * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
+ * @compressed-bpp:               DSC with compressed bpp
+ * @compressed-bpp-bigjoiner:               DSC with big joiner and compressed bpp
+ * @compressed-bpp-ultrajoiner:             DSC with ultra joiner and compressed bpp
  * @basic-bigjoiner:                        DSC with big joiner and default parameters
  * @with-formats-bigjoiner:                 DSC with big joiner and diff formats
  * @with-bpc-bigjoiner:                     DSC with big joiner and certain input BPC
@@ -88,6 +93,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define TEST_DSC_FORMAT		(1<<1)
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 #define TEST_DSC_FRACTIONAL_BPP (1<<3)
+#define TEST_DSC_COMPRESSED_BPP (1<<4)
 
 typedef struct {
 	int drm_fd;
@@ -100,6 +106,7 @@ typedef struct {
 	igt_output_t *output;
 	igt_output_t *valid_output[IGT_MAX_PIPES];
 	int input_bpc;
+	float compressed_bpp;
 	int disp_ver;
 	igt_crtc_t *crtc;
 	enum joined_pipes force_joined_pipes;
@@ -151,6 +158,9 @@ static void test_reset(data_t *data)
 	igt_debug("Reset DSC output format\n");
 	data->output_format = DSC_FORMAT_RGB;
 	force_dsc_output_format(data->drm_fd, data->output, data->output_format);
+
+	igt_debug("Reset compressed BPP\n");
+	force_dsc_enable_compressed_bpp(data->drm_fd, data->output, 0);
 }
 
 static void test_cleanup(data_t *data)
@@ -169,6 +179,38 @@ static void test_cleanup(data_t *data)
 				       JOINED_PIPES_DEFAULT);
 }
 
+static int
+get_compressed_bpp_list(int drm_fd, int disp_ver, igt_output_t *output,
+			enum dsc_output_format output_format,
+			float *bpp_list, int max_entries)
+{
+	int count = 0;
+	int min_bpp_q;
+	int max_bpp_q;
+
+	if (disp_ver < 13) {
+		const int fixed_bpp[] = {6, 8, 10, 12, 15};
+
+		min_bpp_q = fixed_bpp[0] * 4;
+		max_bpp_q = fixed_bpp[ARRAY_SIZE(fixed_bpp) - 1] * 4;
+	} else {
+		max_bpp_q = (int)(igt_get_dsc_sink_max_compressed_bpp(drm_fd, output->name,
+								      output_format) * 4);
+
+		/* Min compressed BPP is 6 for YCBCR420 and 8 for RGB/YCBCR444. */
+		min_bpp_q = (output_format == DSC_FORMAT_YCBCR420 ? 6 : 8) * 4;
+	}
+
+	igt_info("Compressed BPP range for %s: max %.2f, min %.2f\n",
+		 kmstest_dsc_output_format_str(output_format),
+		 max_bpp_q / 4.0f, min_bpp_q / 4.0f);
+
+	for (int bpp_q = max_bpp_q; bpp_q >= min_bpp_q && count < max_entries; bpp_q--)
+		bpp_list[count++] = bpp_q / 4.0f;
+
+	return count;
+}
+
 /* re-probe connectors and do a modeset with DSC */
 static void update_display(data_t *data, uint32_t test_type)
 {
@@ -260,6 +302,11 @@ static void update_display(data_t *data, uint32_t test_type)
 
 		igt_output_override_mode(output, mode);
 
+		if (test_type & TEST_DSC_COMPRESSED_BPP) {
+			igt_info("Forcing compressed BPP to %.2f\n", data->compressed_bpp);
+			force_dsc_enable_compressed_bpp(data->drm_fd, data->output, data->compressed_bpp);
+		}
+
 		if (!intel_pipe_output_combo_valid(display)) {
 			if (data->output_format == DSC_FORMAT_RGB) {
 				igt_info("No valid pipe/output/mode found.\n");
@@ -300,6 +347,14 @@ static void update_display(data_t *data, uint32_t test_type)
 				mode->vdisplay,
 				mode->vrefresh,
 				enabled ? "ON" : "OFF");
+	if (test_type & TEST_DSC_COMPRESSED_BPP) {
+		float actual_bpp =
+			igt_get_dsc_sink_compressed_bpp(data->drm_fd, data->crtc->pipe);
+
+		igt_assert_f(fabsf(actual_bpp - data->compressed_bpp) < 0.01f,
+			     "Requested compressed BPP %.2f, got %.2f\n",
+			     data->compressed_bpp, actual_bpp);
+	}
 
 	restore_force_dsc_en();
 	restore_force_dsc_fractional_bpp_en();
@@ -331,6 +386,8 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 	int n_pipes = igt_display_n_crtcs(display);
+	int bpp_count = 1;
+	float bpp_list[64] = {0};
 	char name[3][LEN] = {
 				{0},
 				{0},
@@ -380,9 +437,18 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 			if (test_type & TEST_DSC_BPC)
 				snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
 
+			if (test_type & TEST_DSC_COMPRESSED_BPP)
+				bpp_count = get_compressed_bpp_list(data->drm_fd, data->disp_ver,
+								     data->output, data->output_format,
+								     bpp_list, ARRAY_SIZE(bpp_list));
+
 			igt_dynamic_f("pipe-%s-%s%s%s%s", igt_crtc_name(data->crtc), data->output->name,
-				      &name[0][0], &name[1][0], &name[2][0])
-				update_display(data, test_type);
+				      &name[0][0], &name[1][0], &name[2][0]) {
+				for (int j = 0; j < bpp_count; j++) {
+					data->compressed_bpp = bpp_list[j];
+					update_display(data, test_type);
+				}
+			}
 
 			if (data->limited)
 				break;
@@ -546,6 +612,16 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 					 bpc_list[j], DRM_FORMAT_XRGB8888,
 					 DSC_FORMAT_RGB, joiner_tests[i]);
 		}
+
+		igt_describe_f("Tests basic display stream compression functionality "
+			       "if supported by a connector by forcing DSC%s and "
+			       "compressed bpp on all connectors that support it.",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-compressed-bpp%s",
+					   joiner_subtest_suffix(joiner_tests[i]))
+			test_dsc(&data, TEST_DSC_COMPRESSED_BPP,
+				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
+				 DSC_FORMAT_RGB, joiner_tests[i]);
 	}
 
 	igt_fixture() {
-- 
2.25.1

