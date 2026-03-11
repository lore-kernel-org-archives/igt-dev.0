Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E406FD064F
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 07:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E29D10E36B;
	Wed, 11 Mar 2026 07:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQ+/nOJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACB110E35F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 07:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773214807; x=1804750807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QcF5aKMBhwjILb9LdSqBlKV6Qnqze5zVmAoJJn7P4VM=;
 b=HQ+/nOJjUNlUoz96RIwZ84cgdhIvROVvdCSVNtpikXBbf3BSwR1jxHi8
 td87p0AC2ugEgpGSRdYQ8j1Qi4NOO5+8EWu3d0pKRIqKuGUgxHq4dET3X
 l/QX5jtbP2gHmfB4AOoCuOMszO8dvgnvgjOmi8bT3YyQ8gIy8WVm1tIEo
 buoKlqFUb8ewMT6gmjZDyDSS2DhQLTwlTKhVMI5gBw95MG7RwxYNnBi2+
 c1EMrysyTqfpWNTXm/83UcEHgrKNl8jJdcmAQrOOYcH8W75+nsdG+Pp7Q
 hT+flUhic6baa0+5ld4T5r8xJXA/+m9Q7++yto3QTZYWZy4PduIsMrJWF w==;
X-CSE-ConnectionGUID: ds54O+j3QHSIFK6loF24PQ==
X-CSE-MsgGUID: wbTi2M8QQyuW27NlhMMUPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="76885372"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="76885372"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:40:07 -0700
X-CSE-ConnectionGUID: duitD8yLRcCWn4IQHR0sdA==
X-CSE-MsgGUID: tg+xRrmRRBSgaTe7ZJoIFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224548458"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:40:05 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Skip unsupported
 scaling scenarios
Date: Wed, 11 Mar 2026 13:10:03 +0530
Message-ID: <20260311074036.219075-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
References: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
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

Skip unsupported downscale tests on Intel platforms, aligning
test coverage with hardware limitations and reducing CI noise.

Bspec: 50441

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ab619fb2b..60390fae8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -533,6 +533,24 @@ const struct {
 	},
 };
 
+static bool is_intel_downscale_supported(data_t *data, const char * const name,
+					 const enum scaler_combo_test_type test_type)
+{
+	if ((intel_display_ver(data->devid) >= 14) &&
+	    (test_type == TEST_PLANES_DOWNSCALE))
+		return false;
+
+	if ((intel_display_ver(data->devid) >= 14) &&
+	    (test_type == TEST_PLANES_UPSCALE_DOWNSCALE) &&
+	    strstr(name, "planes-upscale"))
+		return false;
+
+	if (strstr(name, "downscale-factor-0-25"))
+		return false;
+
+	return true;
+}
+
 static int get_width(drmModeModeInfo *mode, double scaling_factor)
 {
 	if (scaling_factor == 0.0)
@@ -1373,6 +1391,11 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
 			igt_describe(scaler_with_pixel_format_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
+				if (is_intel_device(data.drm_fd) &&
+				    !is_intel_downscale_supported(&data,
+							scaler_with_pixel_format_tests[index].name,
+							0))
+					continue;
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
 						for_each_valid_output_on_crtc(&data.display,
@@ -1404,6 +1427,11 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_rotation_tests); index++) {
 			igt_describe(scaler_with_rotation_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
+				if (is_intel_device(data.drm_fd) &&
+				    !is_intel_downscale_supported(&data,
+							scaler_with_rotation_tests[index].name,
+							0))
+					continue;
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
 						for_each_valid_output_on_crtc(&data.display,
@@ -1435,6 +1463,11 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
 			igt_describe(scaler_with_modifiers_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
+				if (is_intel_device(data.drm_fd) &&
+				    !is_intel_downscale_supported(&data,
+							scaler_with_modifiers_tests[index].name,
+							0))
+					continue;
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
 						for_each_valid_output_on_crtc(&data.display,
@@ -1548,6 +1581,11 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
 			igt_describe(scaler_with_2_planes_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
+				if (is_intel_device(data.drm_fd) &&
+				    !is_intel_downscale_supported(&data,
+							scaler_with_2_planes_tests[index].name,
+							scaler_with_2_planes_tests[index].test_type))
+					continue;
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
 						for_each_valid_output_on_crtc(&data.display,
-- 
2.43.0

