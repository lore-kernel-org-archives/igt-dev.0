Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DBFC02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 12:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785F710E6A1;
	Tue, 18 Feb 2025 12:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbfkHyTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E7110E6A1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 12:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739883506; x=1771419506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZGRk2+f1QZ1YdL48MdizR9WF+CdLaecVrJsyZ0jUybI=;
 b=jbfkHyTyqz76yYrZXSA4HDob+Uxebsxi65uF/bv2kpemrBs7ZWnASQ9s
 2GPqsZ9aS4v5ZlD2eNtv/SOoaH1ssOMENOQsFrFUhy63EC1/b7O6z2OzB
 Xqn5AOn8KoRLFEz+/tV9JuF5ghrs5k1bZgxfNzJulgc4OcLHuEwGw4CaS
 lRpTOj1XQFxMhY42OrrSB1MD+R/2ySxRIfUCskU+NxqPr7dNYcmQ6cSHt
 StW/90GFzt8EPqTSWBc9IQT9/RcHjcTDoYbKU0HFOTJWfTpZTmcijjg1p
 AFLsrJKRt7ZB6SJYOEwGRE1xvkFHkecEitubX6M3ETIWyNp5f67OzRH2J w==;
X-CSE-ConnectionGUID: LMz8G5NFQvyi3lPVulxtCw==
X-CSE-MsgGUID: Ckf97TiASR2/XLcFYDuY7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39811397"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="39811397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 04:58:26 -0800
X-CSE-ConnectionGUID: tlVh0ehHSwOfay7Y3AROmg==
X-CSE-MsgGUID: f/Mui7/ZTJSwTZ4pP8LoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118519557"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 04:58:25 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dsc: Store valid DSC outputs
Date: Tue, 18 Feb 2025 18:33:37 +0530
Message-Id: <20250218130337.431624-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Instead of repeatedly checking debugfs to determine if a panel
supports DSC, perform the check once and store valid outputs (those
that support DSC and meet the required constraints) in an array.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 5508e7a9e..3f1c93094 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -73,12 +73,14 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 typedef struct {
 	int drm_fd;
+	int count;
 	uint32_t devid;
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
 	enum dsc_output_format output_format;
 	unsigned int plane_format;
 	igt_output_t *output;
+	igt_output_t *valid_output[IGT_MAX_PIPES];
 	int input_bpc;
 	int disp_ver;
 	enum pipe pipe;
@@ -262,32 +264,21 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		     unsigned int plane_format,
 		     enum dsc_output_format output_format)
 {
-	igt_display_t *display = &data->display;
-	igt_output_t *output;
-	enum pipe pipe;
 	char name[3][LEN] = {
 				{0},
 				{0},
 				{0},
 			    };
 
+	igt_require_f(data->count > 0, "No dsc output found that meets all constraints\n");
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
+	for (int i = 0; i < data->count; i++) {
 		data->output_format = output_format;
 		data->plane_format = plane_format;
 		data->input_bpc = bpc;
-		data->output = output;
-		data->pipe = pipe;
-
-		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
-		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
-			continue;
-
-		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC) {
-			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
-			continue;
-		}
+		data->output = data->valid_output[i];
+		data->pipe = i;
 
 		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
 		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
@@ -337,15 +328,26 @@ data_t data = {};
 
 igt_main_args("l", NULL, help_str, opt_handler, &data)
 {
+	igt_output_t *output;
+	enum pipe pipe = PIPE_A;
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.disp_ver = intel_display_ver(data.devid);
+		data.count = 0;
 		kmstest_set_vt_graphics_mode();
 		igt_install_exit_handler(kms_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 		igt_require(is_dsc_supported_by_source(data.drm_fd));
+
+		for_each_valid_output_on_pipe(&data.display, pipe, output) {
+			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
+			    check_gen11_dp_constraint(data.drm_fd, output, pipe) &&
+		            igt_get_output_max_bpc(data.drm_fd, output->name) > MIN_DSC_BPC)
+					data.valid_output[data.count++] = output;
+		}
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
-- 
2.25.1

