Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E456CD6E49
	for <igt-dev@archiver.kernel.org>; Sat, 30 May 2026 19:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2028311298E;
	Sat, 30 May 2026 19:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOtKiwAU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C495112989
 for <igt-dev@lists.freedesktop.org>; Sat, 30 May 2026 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780169276; x=1811705276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v1n3HOsG2lqUJS6SBbGDQQlMhKNODZBYAVojvz2KitU=;
 b=jOtKiwAUQXN5PRE6uBABwjbB4KdVHgKD0ZOUv1Ww1zFSMWohnKn2CulY
 Toz1IdIjZvlL2QAQmaqQRiiRAXIazygN6QAqnCvhIQHI8kw4Im8fspl35
 THhWzFQmYfpBV3uuwJKSYcYgLnBXjzXAfSvWRSDSJraKftdCP5R3C43FX
 g2PKnsCyM2UoRORIVN67ypUlIMzyypojF8SsO5LyzrosrnpI9hfKXzZFu
 mbWKj1qvJLvEBP7zhMMzytU0cEPm75BPOnc2zpb8lPdrIbZDQ7V1QgFxb
 1HHEGjgMM6WfU9KJ7J94M1Kr6BVY7q8Igk/5RGkjE00kUY11i6s8flOsC A==;
X-CSE-ConnectionGUID: kexX8ZCXTxWF+pqwUeACWA==
X-CSE-MsgGUID: ZO6KczDnSEyLh8XUw4UQWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="103657573"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; d="scan'208";a="103657573"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2026 12:27:55 -0700
X-CSE-ConnectionGUID: mHQJ1/0xQ2uVT0tJa8CxxQ==
X-CSE-MsgGUID: Hf/JGzFMRiSKWrXP6L8ckA==
X-ExtLoop1: 1
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 12:27:54 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v7 1/5] tests/intel/kms_dsc: Store valid DSC outputs
Date: Sun, 31 May 2026 01:06:36 +0530
Message-Id: <20260530193640.2551688-2-swati2.sharma@intel.com>
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

Instead of repeatedly checking debugfs to determine if a panel
supports DSC, perform the check once and store valid outputs (those
that support DSC and meet the required constraints) in an array.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 71 ++++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 4c41c6a3b..093a16151 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -71,12 +71,14 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
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
 	igt_crtc_t *crtc;
@@ -254,7 +256,6 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		     enum dsc_output_format output_format)
 {
 	igt_display_t *display = &data->display;
-	igt_output_t *output;
 	igt_crtc_t *crtc;
 	char name[3][LEN] = {
 				{0},
@@ -262,47 +263,44 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 				{0},
 			    };
 
+	igt_require_f(data->count > 0, "No valid output found, either sink doesn't support dsc or min 8bpc\n");
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
-	for_each_crtc_with_valid_output(display, crtc, output) {
-		data->output_format = output_format;
-		data->plane_format = plane_format;
-		data->input_bpc = bpc;
-		data->output = output;
-		data->crtc = crtc;
-
-		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
-		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
-			continue;
+	for_each_crtc(display, crtc) {
+		for (int i = 0; i < data->count; i++) {
+			data->output_format = output_format;
+			data->plane_format = plane_format;
+			data->input_bpc = bpc;
+			data->output = data->valid_output[i];
+			data->crtc = crtc;
 
-		if (igt_get_output_max_bpc(output) < MIN_DSC_BPC) {
-			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
-			continue;
-		}
+			if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
+				continue;
 
-		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
-		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
+			if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
+			    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
 						     data->output, data->output_format)))
-			continue;
+				continue;
 
-		if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
-		    (!is_dsc_fractional_bpp_supported(data->disp_ver,
+			if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
+			    (!is_dsc_fractional_bpp_supported(data->disp_ver,
 						      data->drm_fd, data->output)))
-			continue;
+				continue;
 
-		if (test_type & TEST_DSC_OUTPUT_FORMAT)
-			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
-		if (test_type & TEST_DSC_FORMAT)
-			snprintf(&name[1][0], LEN, "-%s", igt_format_str(data->plane_format));
-		if (test_type & TEST_DSC_BPC)
-			snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
+			if (test_type & TEST_DSC_OUTPUT_FORMAT)
+				snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
+			if (test_type & TEST_DSC_FORMAT)
+				snprintf(&name[1][0], LEN, "-%s", igt_format_str(data->plane_format));
+			if (test_type & TEST_DSC_BPC)
+				snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
 
-		igt_dynamic_f("pipe-%s-%s%s%s%s",  igt_crtc_name(data->crtc), data->output->name,
-			      &name[0][0], &name[1][0], &name[2][0])
-			update_display(data, test_type);
+			igt_dynamic_f("pipe-%s-%s%s%s%s", igt_crtc_name(data->crtc), data->output->name,
+				      &name[0][0], &name[1][0], &name[2][0])
+				update_display(data, test_type);
 
-		if (data->limited)
-			break;
+			if (data->limited)
+				break;
+		}
 	}
 }
 
@@ -328,15 +326,24 @@ data_t data = {};
 
 int igt_main_args("l", NULL, help_str, opt_handler, &data)
 {
+	igt_output_t *output;
+
 	igt_fixture() {
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
+		for_each_connected_output(&data.display, output) {
+			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
+			    igt_get_output_max_bpc(output) >= MIN_DSC_BPC)
+				data.valid_output[data.count++] = output;
+		}
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
-- 
2.25.1

