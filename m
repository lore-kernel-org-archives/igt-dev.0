Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27173CD6E6E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 20:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D124911A2CF;
	Thu,  4 Jun 2026 20:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUsA+IY2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A338311A2CA
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 20:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780603332; x=1812139332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gal3CxBmJixReJAxdJ5TM+6aJe8aIa4nD/b0VV2+6nc=;
 b=BUsA+IY2/yX9f85mAgwa6QqlxIWYUb5DZl/BJCxEHmYyjoSrZfQ5FAST
 BzU1t9rsc0FTRAHzf4plIXbuOPq5q3qOlkPqQNLK6xcDDr9kdPa3Ki/48
 uwTU7qJVjLvFwQIk/8JpZ5hDojf3B/6igq+t7ZJQsKPkRlPZ/M+/MYBKo
 hvkBhq+rvYQOnB1IBkjrv6s90Drb2DfCveMhAohlozLxrLiL5aiIeR4gY
 SG6Hk55M0ZcY/bAX74gTfRMIxgvAhOiHX/7hXXqUF4gY4sAv7p7swOCWU
 Qkj61mAdpOJEvRKx2TvcD+kRzcnkf2bAW+qoL8cAHdO417Abf1ipGD1sk g==;
X-CSE-ConnectionGUID: 0R5NhfHlS52xB8G17Yto6w==
X-CSE-MsgGUID: t8BliMVbRAeI9vV4vqJD7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81622002"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="81622002"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:02:12 -0700
X-CSE-ConnectionGUID: tmHNW7LATYOskpagk4az4A==
X-CSE-MsgGUID: 9IlItRFxSIWaM/CMRgsnnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="248573285"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 13:02:10 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t,v8 1/5] tests/intel/kms_dsc: Store valid DSC outputs
Date: Fri,  5 Jun 2026 01:40:58 +0530
Message-Id: <20260604201102.2583200-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260604201102.2583200-1-swati2.sharma@intel.com>
References: <20260604201102.2583200-1-swati2.sharma@intel.com>
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

v2:
 - Fix incomplete skip message to clarify DSC/bpc requirement

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_dsc.c | 71 ++++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 4c41c6a3b..5b13da52d 100644
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
 
+	igt_require_f(data->count > 0, "No valid output found, either sink doesn't support DSC or doesn't support min %d bpc\n", MIN_DSC_BPC);
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

