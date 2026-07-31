Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43B2C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 12:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA7E10F254;
	Fri, 31 Jul 2026 12:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyckJwTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A65910F244
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785499972; x=1817035972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JTP9zkyE3bzIuLZkWD7kmb/ubZq6P/Ll+IuzYiFSKTk=;
 b=CyckJwTIYoZ3kxyGZvkh2yegvG1SPRlfrSeoeZyxu2CYOqqmKy7wsAcH
 wnIuWpyCHFFOYyHvCIkuiXjMIfqv6bei1H2RK+5JjxmjedZBAnvv+BUJF
 WRkUeJHXB0bLsqDSncqMJ1lAMCzGfQI7ft9i+Tm0Hfs8ZwbRE0Dd9QeZn
 /e0q0eeTmY3hVXgQ1FGe/jh1+QyrX5z1Zdox+igupSoeBMIEGHiJwRCyT
 og1PmsxtLyrlESyagVEgKEBTgEO4rx5EfYMPXzyMxLiiLm96t0i+Da0j9
 5DesqlgcZRAQfQxMRtBxHrzlyk/gu5oI34fyOgeJK51O7OY/U2NiQ+KlO w==;
X-CSE-ConnectionGUID: BXIGa8z/RPiLW3wNtAaqsQ==
X-CSE-MsgGUID: XXJt0FLvTo6kTc472y0pCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85891508"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="85891508"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 05:12:52 -0700
X-CSE-ConnectionGUID: 58yUC6KoTyK6RUNjuC8ngw==
X-CSE-MsgGUID: 94tmRhxcTlGvtpMa4YmOzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="265630665"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 05:12:51 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/kms_dsc: Add dsc-compressed-bpp subtest
Date: Fri, 31 Jul 2026 17:51:45 +0530
Message-Id: <20260731122145.4099468-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260731122145.4099468-1-swati2.sharma@intel.com>
References: <20260731122145.4099468-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a subtest that forces DSC with specific compressed BPP
values on all connectors that support it. For display version
>= 13, query the sink's max compressed BPP and iterate through
valid values. For older platforms, use a fixed set of BPP
values.

v2: Rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 90 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 1e30f6fee..fff51fb9a 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -59,6 +59,9 @@
  * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
  * @fractional-bpp:               DSC with fractional bpp with default parameters
  * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
+ * @compressed-bpp:               DSC with compressed bpp
+ * @compressed-bpp-bigjoiner:               DSC with big joiner and compressed bpp
+ * @compressed-bpp-ultrajoiner:             DSC with ultra joiner and compressed bpp
  * @basic-bigjoiner:                        DSC with big joiner and default parameters
  * @with-formats-bigjoiner:                 DSC with big joiner and diff formats
  * @with-bpc-bigjoiner:                     DSC with big joiner and certain input BPC
@@ -82,12 +85,14 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define LEN		20
 #define DEFAULT_BPC	0
 #define MIN_DSC_BPC	8
+#define STEP_SIZE	2
 
 #define TEST_DSC_BASIC		(0<<0)
 #define TEST_DSC_BPC		(1<<0)
 #define TEST_DSC_FORMAT		(1<<1)
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 #define TEST_DSC_FRACTIONAL_BPP (1<<3)
+#define TEST_DSC_COMPRESSED_BPP (1<<4)
 
 typedef struct {
 	int drm_fd;
@@ -100,6 +105,7 @@ typedef struct {
 	igt_output_t *output;
 	igt_output_t *valid_output[IGT_MAX_PIPES];
 	int input_bpc;
+	float compressed_bpp;
 	int disp_ver;
 	igt_crtc_t *crtc;
 	enum joined_pipes force_joined_pipes;
@@ -151,6 +157,9 @@ static void test_reset(data_t *data)
 	igt_debug("Reset DSC output format\n");
 	data->output_format = DSC_FORMAT_RGB;
 	force_dsc_output_format(data->drm_fd, data->output, data->output_format);
+
+	igt_debug("Reset compressed BPP\n");
+	force_dsc_enable_compressed_bpp(data->drm_fd, data->output, 0);
 }
 
 static void test_cleanup(data_t *data)
@@ -169,6 +178,58 @@ static void test_cleanup(data_t *data)
 				       JOINED_PIPES_DEFAULT);
 }
 
+/* Force a full off→on modeset with DSC so the driver populates compressed BPP. */
+static void
+force_dsc_with_modeset(int drm_fd, igt_display_t *display,
+		       igt_output_t *output, igt_crtc_t *crtc)
+{
+	drmModeModeInfo *mode;
+
+	igt_display_reset(display);
+	igt_display_commit(display);
+
+	igt_output_set_crtc(output, crtc);
+
+	mode = igt_output_get_highres_mode(output);
+	igt_output_override_mode(output, mode);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	force_dsc_enable(drm_fd, output);
+
+	igt_output_set_crtc(output, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_output_set_crtc(output, crtc);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
+static int
+get_compressed_bpp_list(int drm_fd, int disp_ver, igt_display_t *display,
+			igt_output_t *output, igt_crtc_t *crtc, float *bpp_list,
+			int max_entries)
+{
+	int count = 0;
+	float max_bpp = 0.0f;
+
+	if (disp_ver < 13) {
+		const int fixed_bpp[] = {6, 8, 10, 12, 15};
+		for (int i = 0; i < ARRAY_SIZE(fixed_bpp) && count < max_entries; i++)
+			bpp_list[count++] = fixed_bpp[i];
+	} else {
+		force_dsc_with_modeset(drm_fd, display, output, crtc);
+		max_bpp = igt_get_dsc_sink_compressed_bpp(drm_fd, crtc->pipe);
+
+		/* FIXME: MIN compressed BPP value is 8 for RGB and
+		 * 6 for YCBCR420 output formats. For simplicity lets
+		 * consider 8 for time being.
+		 */
+		for (int bpp = 8; bpp <= max_bpp && count < max_entries; bpp += STEP_SIZE)
+			bpp_list[count++] = bpp;
+	}
+
+	return count;
+}
+
 /* re-probe connectors and do a modeset with DSC */
 static void update_display(data_t *data, uint32_t test_type)
 {
@@ -260,6 +321,11 @@ static void update_display(data_t *data, uint32_t test_type)
 
 		igt_output_override_mode(output, mode);
 
+		if (test_type & TEST_DSC_COMPRESSED_BPP) {
+			igt_debug("Trying to set compressed BPP to %.2f\n", data->compressed_bpp);
+			force_dsc_enable_compressed_bpp(data->drm_fd, data->output, data->compressed_bpp);
+		}
+
 		if (!intel_pipe_output_combo_valid(display)) {
 			if (data->output_format == DSC_FORMAT_RGB) {
 				igt_info("No valid pipe/output/mode found.\n");
@@ -331,6 +397,8 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 	int n_pipes = igt_display_n_crtcs(display);
+	int bpp_count = 1;
+	float bpp_list[32] = {0};
 	char name[3][LEN] = {
 				{0},
 				{0},
@@ -380,9 +448,17 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 			if (test_type & TEST_DSC_BPC)
 				snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
 
+			if (test_type & TEST_DSC_COMPRESSED_BPP)
+				bpp_count = get_compressed_bpp_list(data->drm_fd, data->disp_ver, display,
+								     data->output, data->crtc, bpp_list, ARRAY_SIZE(bpp_list));
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
@@ -546,6 +622,16 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
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

