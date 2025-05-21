Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA46C54E92
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 07:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BD910E691;
	Wed, 21 May 2025 07:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3II+tGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503B610E68D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747812190; x=1779348190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hnqD28OPsFqcRuwx0hkB+M1hiLrcUcEusnwOElEzqNs=;
 b=L3II+tGtqpFthjGokCnZrKAxkU9pFLu2RFDhu5epAhwN0ndiFeBZ1rxJ
 sRLmfHJXl6dQjnxA7vIARER6FISnPAS/DNs1Egluc4n17EHNqDIQHc2gk
 vmCdZ16oMeUpr6vj3cPHvQ8do/s+XjMTgHcj4OsJ3FD6n1fe/pK4TIjfx
 JO3OlBH9zyypsBKwSARzzmTXEBZf2pNm+N20jp58DQMeB6fXN1GSltmDh
 ucnU66/WYIhO9A8aYbAB/Iue51CdPBilS6/5kiidGb/+LUAd1DJ8GaKjT
 ovfNHfOj+cvgm+KWXIhbOZN83sHIm7RYVezVOnbD1JmHr7lg96Olou7vV Q==;
X-CSE-ConnectionGUID: G7Rua/MuRD63aiGwN0x8HA==
X-CSE-MsgGUID: 8gdpTiazRA63LBx7RsnM2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53571292"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53571292"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:10 -0700
X-CSE-ConnectionGUID: J5H/1G7cQjyyY7AM9Kk9/w==
X-CSE-MsgGUID: 9oyDixbFQtOTOGOSxYLLtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170943772"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:08 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, imre.deak@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel/kms_dsc: Store valid DSC outputs
Date: Wed, 21 May 2025 12:58:32 +0530
Message-Id: <20250521072836.1400749-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521072836.1400749-1-swati2.sharma@intel.com>
References: <20250521072836.1400749-1-swati2.sharma@intel.com>
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

v2: - store pipe as well in array
v3: - add intel_pipe_output_combo_valid() while computing
      valid outputs

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 7f0745370..5aedd9576 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -71,12 +71,15 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
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
+	enum pipe output_pipe[IGT_MAX_PIPES];
 	int input_bpc;
 	int disp_ver;
 	enum pipe pipe;
@@ -248,32 +251,21 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
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
+		data->pipe = data->output_pipe[i];
 
 		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
 		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
@@ -323,15 +315,34 @@ data_t data = {};
 
 igt_main_args("l", NULL, help_str, opt_handler, &data)
 {
+	igt_output_t *output;
+	enum pipe pipe;
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
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_display_reset(&data.display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!intel_pipe_output_combo_valid(&data.display))
+				continue;
+
+			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
+			    check_gen11_dp_constraint(data.drm_fd, output, pipe) &&
+			    igt_get_output_max_bpc(data.drm_fd, output->name) > MIN_DSC_BPC) {
+					data.output_pipe[data.count] = pipe;
+					data.valid_output[data.count++] = output;
+			}
+		}
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
-- 
2.25.1

