Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB167F3380B
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 07:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A06D10E4E7;
	Tue, 17 Mar 2026 07:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mrk5BhRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634EB10E4E7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773733080; x=1805269080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysOSAHOuX+7U6Aw6yoTT2mHHJL448t20fJ4KxeafZOY=;
 b=Mrk5BhRaG4Gz/AKn9uzusBkxvtYHkFTPcE6cOlOClKUDd7jtI2qEhvvt
 8omN88jZGb+07ZpAaX0oW1+HeVU8MZIEaf3S1U46+xni0FeCcLLsMzsWF
 RP7ftzg8Tbe8Y0I1mMQhU3WUk9JBibOhNeJpJwrjbVDH1IqBhn5SlUAaH
 AxNEPcV9YQB152teLFxGfqy/W1ZGvLXhBVwz0R+z+E0SOlsM5UwvmUhB+
 I8GzAs/toex/Gr9psnl4IyCo2D+aoCWurxAPrvzfJnnxeSgXIQWbSLceI
 T+DETODgGWSyrTQqE7f/MNaXTPnprsvzKkWvuu6uTI6+HMse+LB/dWEjj Q==;
X-CSE-ConnectionGUID: kVuNbw0eSSG7q4kfsBZCyw==
X-CSE-MsgGUID: 1KvVcn7pTS2n4EAVBrbvGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78652749"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78652749"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 00:38:00 -0700
X-CSE-ConnectionGUID: eIBaJoyLSzq7zwmKzgYbgw==
X-CSE-MsgGUID: Y6d68Vs0SyKKU3At3XUjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="218352822"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:37:59 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip unsupported scaling
 scenarios
Date: Tue, 17 Mar 2026 13:08:42 +0530
Message-ID: <20260317073842.713155-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311074036.219075-2-ramanaidu.naladala@intel.com>
References: <20260311074036.219075-2-ramanaidu.naladala@intel.com>
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

v2: Convert helper to issue skips for unsupported downscale
    requirements. Address review comments. (Jeevan)

Bspec: 50441

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ab619fb2b..3e25d9743 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -533,6 +533,22 @@ const struct {
 	},
 };
 
+static void is_intel_downscale_supported(data_t *data, const char * const name,
+					 const enum scaler_combo_test_type test_type)
+{
+	if ((intel_display_ver(data->devid) >= 14) &&
+	    (test_type == TEST_PLANES_DOWNSCALE))
+		igt_skip("Required downscale not supported on scalar 2.\n");
+
+	if ((intel_display_ver(data->devid) >= 14) &&
+	    (test_type == TEST_PLANES_UPSCALE_DOWNSCALE) &&
+	    strstr(name, "planes-upscale"))
+		igt_skip("Required downscale not supported on scalar 2.\n");
+
+	if (strstr(name, "downscale-factor-0-25"))
+		igt_skip("Required downscale not supported.\n");
+}
+
 static int get_width(drmModeModeInfo *mode, double scaling_factor)
 {
 	if (scaling_factor == 0.0)
@@ -1373,6 +1389,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
 			igt_describe(scaler_with_pixel_format_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
+				if (is_intel_device(data.drm_fd))
+					is_intel_downscale_supported(&data,
+							scaler_with_pixel_format_tests[index].name,
+							0);
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
 						for_each_valid_output_on_crtc(&data.display,
@@ -1404,6 +1424,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_rotation_tests); index++) {
 			igt_describe(scaler_with_rotation_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
+				if (is_intel_device(data.drm_fd))
+					is_intel_downscale_supported(&data,
+							scaler_with_rotation_tests[index].name,
+							0);
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
 						for_each_valid_output_on_crtc(&data.display,
@@ -1435,6 +1459,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
 			igt_describe(scaler_with_modifiers_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
+				if (is_intel_device(data.drm_fd))
+					is_intel_downscale_supported(&data,
+							scaler_with_modifiers_tests[index].name,
+							0);
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
 						for_each_valid_output_on_crtc(&data.display,
@@ -1548,6 +1576,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
 			igt_describe(scaler_with_2_planes_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
+				if (is_intel_device(data.drm_fd))
+					is_intel_downscale_supported(&data,
+							scaler_with_2_planes_tests[index].name,
+							scaler_with_2_planes_tests[index].test_type);
 				for_each_crtc(&data.display, crtc) {
 					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
 						for_each_valid_output_on_crtc(&data.display,
-- 
2.43.0

