Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846EDD49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3055410E9B4;
	Fri, 30 Jan 2026 10:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoVjm83z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B7B10E9BC
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770375; x=1801306375;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dGv38DGO4KsrXEZBpjQTbjcaQyvJ7Bc337tuYNSyJus=;
 b=DoVjm83z3BuEEwjSZqz7GhY/ukYJUK5RbQ66PCgjv2wlrqv3LZ1CiS6g
 9VAntelBO+6Rbf3eXOjReDxFLP3JY7Ye8pFaZsPLx12Xf+N5pwsVwoRxp
 EsSKzCEs2NKbl+9lqbIiBVZQctNvJ5Lv3CEsL7IbTDGabxGer+veElaLx
 E4Dekuyhrb7LkWJtGFImtyj0D9nRffiNdkEwWkanvRrd+emcj0aSsZSIE
 SSvUeotXUufIR7QdTDxzOb7HDxRX7Pxy+UDINuwgDI2l1MDw31QxoIbg9
 AVwPiDEqtQJ/IKTD4HnvN4e1o9WnBsaq6LKHPI9OTImKhg3/YOkbSlSst g==;
X-CSE-ConnectionGUID: bexiBAhUQR6vxeII4JPi4Q==
X-CSE-MsgGUID: CNWdvVWAQbGYu93An2V07Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88593145"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="88593145"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:54 -0800
X-CSE-ConnectionGUID: L+VIi6COTqSRILBO1C2w4w==
X-CSE-MsgGUID: N/F1FR+STASI1eYM8RofIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213354750"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:53 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/15] tests/kms_plane_scaling: Use for_each_crtc*()
Date: Fri, 30 Jan 2026 12:52:25 +0200
Message-ID: <20260130105237.14481-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Convert tests/kms_plane_scaling to use the new crtc based
iteratros (over the old pipe based ones).

Coccinelle has a lot of trouble with this one so in the end
I gave up and did the conversion manually.

find_connected_pipe() is the slightly dodgy thing here since
it uses the iterator after the loop. But I think the igt_require()
stuff should trip up before if we didn't manage to find a suitable
crtc at all. So should be safe.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane_scaling.c | 119 +++++++++++++++++++-------------------
 1 file changed, 59 insertions(+), 60 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 70cf704c05fa..63fbc8c603bb 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -843,19 +843,18 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 static enum pipe
 find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	bool first_output = false;
 	bool found = false;
 
 	igt_display_reset(display);
 
-	for_each_pipe(display, pipe) {
-		for_each_valid_output_on_pipe(display, pipe, *output) {
+	for_each_crtc(display, crtc) {
+		for_each_valid_output_on_pipe(display, crtc->pipe, *output) {
 			if (igt_output_get_driving_crtc(*output) != NULL)
 				continue;
 
-			igt_output_set_crtc(*output,
-					    igt_crtc_for_pipe((*output)->display, pipe));
+			igt_output_set_crtc(*output, crtc);
 			if (intel_pipe_output_combo_valid(display)) {
 				found = true;
 
@@ -879,7 +878,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 	else
 		igt_require_f(found, "No valid outputs found\n");
 
-	return pipe;
+	return crtc->pipe;
 }
 
 static int
@@ -1363,7 +1362,7 @@ static data_t data;
 
 int igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	uint32_t ret = -EINVAL;
 
 	igt_fixture() {
@@ -1380,20 +1379,20 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
 			igt_describe(scaler_with_pixel_format_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
-				for_each_pipe(&data.display, pipe) {
-					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				for_each_crtc(&data.display, crtc) {
+					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
+						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
 							igt_info("Trying on %s\n", igt_output_name(output));
-							if (!pipe_output_combo_valid(&data.display, pipe, output))
+							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 								continue;
-							if (get_num_scalers(&data.display, pipe) < 1)
+							if (get_num_scalers(&data.display, crtc->pipe) < 1)
 								continue;
 
 							ret = test_scaler_with_pixel_format_pipe(&data,
 									scaler_with_pixel_format_tests[index].sf,
 									false,
 									scaler_with_pixel_format_tests[index].is_upscale,
-									pipe, output);
+									crtc->pipe, output);
 							if (ret == 0)
 								break;
 							igt_info("Required scaling operation not supported on %s trying on next output\n",
@@ -1408,20 +1407,20 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_rotation_tests); index++) {
 			igt_describe(scaler_with_rotation_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
-				for_each_pipe(&data.display, pipe) {
-					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				for_each_crtc(&data.display, crtc) {
+					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
+						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
 							igt_info("Trying on %s\n", igt_output_name(output));
-							if (!pipe_output_combo_valid(&data.display, pipe, output))
+							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 								continue;
-							if (get_num_scalers(&data.display, pipe) < 1)
+							if (get_num_scalers(&data.display, crtc->pipe) < 1)
 								continue;
 
 							ret = test_scaler_with_rotation_pipe(&data,
 									scaler_with_rotation_tests[index].sf,
 									false,
 									scaler_with_rotation_tests[index].is_upscale,
-									pipe, output);
+									crtc->pipe, output);
 							if (ret == 0)
 								break;
 							igt_info("Required scaling operation not supported on %s trying on next output\n",
@@ -1436,20 +1435,20 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
 			igt_describe(scaler_with_modifiers_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
-				for_each_pipe(&data.display, pipe) {
-					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				for_each_crtc(&data.display, crtc) {
+					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
+						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
 							igt_info("Trying on %s\n", igt_output_name(output));
-							if (!pipe_output_combo_valid(&data.display, pipe, output))
+							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 								continue;
-							if (get_num_scalers(&data.display, pipe) < 1)
+							if (get_num_scalers(&data.display, crtc->pipe) < 1)
 								continue;
 
 							ret = test_scaler_with_modifier_pipe(&data,
 									scaler_with_modifiers_tests[index].sf,
 									false,
 									scaler_with_modifiers_tests[index].is_upscale,
-									pipe, output);
+									crtc->pipe, output);
 							if (ret == 0)
 								break;
 							igt_info("Required scaling operation not supported on %s trying on next output\n",
@@ -1463,17 +1462,17 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_describe("Tests scaling with clipping and clamping, pixel formats.");
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-pixel-formats") {
-			for_each_pipe(&data.display, pipe) {
-				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+			for_each_crtc(&data.display, crtc) {
+				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
+					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
 						igt_info("Trying on %s\n", igt_output_name(output));
-						if (!pipe_output_combo_valid(&data.display, pipe, output))
+						if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 							continue;
-						if (get_num_scalers(&data.display, pipe) < 1)
+						if (get_num_scalers(&data.display, crtc->pipe) < 1)
 							continue;
 
 						ret = test_scaler_with_pixel_format_pipe(&data, 0.0, true,
-											 false, pipe,
+											 false, crtc->pipe,
 											 output);
 						if (ret == 0)
 							break;
@@ -1488,17 +1487,17 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_describe("Tests scaling with clipping and clamping, rotation.");
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-rotation") {
-			for_each_pipe(&data.display, pipe) {
-				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+			for_each_crtc(&data.display, crtc) {
+				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
+					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
 						igt_info("Trying on %s\n", igt_output_name(output));
-						if (!pipe_output_combo_valid(&data.display, pipe, output))
+						if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 							continue;
-						if (get_num_scalers(&data.display, pipe) < 1)
+						if (get_num_scalers(&data.display, crtc->pipe) < 1)
 							continue;
 
 						ret = test_scaler_with_rotation_pipe(&data, 0.0, true,
-										     false, pipe,
+										     false, crtc->pipe,
 										     output);
 						if (ret == 0)
 							break;
@@ -1512,17 +1511,17 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_describe("Tests scaling with clipping and clamping, modifiers.");
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-modifiers") {
-			for_each_pipe(&data.display, pipe) {
-				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+			for_each_crtc(&data.display, crtc) {
+				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
+					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
 						igt_info("Trying on %s\n", igt_output_name(output));
-						if (!pipe_output_combo_valid(&data.display, pipe, output))
+						if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 							continue;
-						if (get_num_scalers(&data.display, pipe) < 1)
+						if (get_num_scalers(&data.display, crtc->pipe) < 1)
 							continue;
 
 						ret = test_scaler_with_modifier_pipe(&data, 0.0, true,
-										     false, pipe,
+										     false, crtc->pipe,
 										     output);
 						if (ret == 0)
 							break;
@@ -1537,19 +1536,19 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
 			igt_describe(scaler_with_2_planes_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
-				for_each_pipe(&data.display, pipe) {
-					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				for_each_crtc(&data.display, crtc) {
+					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
+						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
 							igt_info("Trying on %s\n",
 								 igt_output_name(output));
-							if (!pipe_output_combo_valid(&data.display, pipe, output))
+							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 								continue;
-							if (get_num_scalers(&data.display, pipe) < 2)
+							if (get_num_scalers(&data.display, crtc->pipe) < 2)
 								continue;
 							ret = test_planes_scaling_combo(&data,
 								scaler_with_2_planes_tests[index].sf_plane1,
 								scaler_with_2_planes_tests[index].sf_plane2,
-								pipe, output,
+								crtc->pipe, output,
 								scaler_with_2_planes_tests[index].test_type);
 							if (ret == 0)
 								break;
@@ -1566,9 +1565,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_describe("Test for validating max source size.");
 			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
 				igt_require_intel(data.drm_fd);
-				for_each_pipe(&data.display, pipe) {
-					for_each_valid_output_on_pipe(&data.display, pipe, output) {
-						if (get_num_scalers(&data.display, pipe) < 1)
+				for_each_crtc(&data.display, crtc) {
+					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
+						if (get_num_scalers(&data.display, crtc->pipe) < 1)
 							continue;
 						/*
 						 * Need to find mode with lowest vrefresh else
@@ -1576,15 +1575,15 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 						 */
 						if (find_mode(&data, output, &intel_paramtests[index]))
 							igt_dynamic_f("pipe-%s-%s",
-								      kmstest_pipe_name(pipe), igt_output_name(output))
-								intel_max_source_size_test(&data, pipe, output,
+								      igt_crtc_name(crtc), igt_output_name(output))
+								intel_max_source_size_test(&data, crtc->pipe, output,
 											   &intel_paramtests[index]);
 						else
 							igt_info("Unable to find the lowest " \
 								 "refresh rate mode on output " \
 								 "%s pipe %s\n",
 								 igt_output_name(output),
-								 kmstest_pipe_name(pipe));
+								 igt_crtc_name(crtc));
 						continue;
 					}
 					break;
@@ -1594,15 +1593,15 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_describe("Negative test for number of scalers per pipe.");
 		igt_subtest_with_dynamic("invalid-num-scalers") {
-			for_each_pipe_with_valid_output(&data.display, pipe, output) {
-				if (!pipe_output_combo_valid(&data.display, pipe, output))
+			for_each_crtc_with_valid_output(&data.display, crtc, output) {
+				if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
 					continue;
-				if (get_num_scalers(&data.display, pipe) < 1)
+				if (get_num_scalers(&data.display, crtc->pipe) < 1)
 						continue;
 
 				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
-					       kmstest_pipe_name(pipe), igt_output_name(output))
-					test_invalid_num_scalers(&data, pipe, output);
+					      igt_crtc_name(crtc), igt_output_name(output))
+					test_invalid_num_scalers(&data, crtc->pipe, output);
 			}
 		}
 	}
-- 
2.52.0

