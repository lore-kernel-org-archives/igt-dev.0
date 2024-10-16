Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5758D1AD50
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 12:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934BF10E6CB;
	Wed, 16 Oct 2024 12:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiO/eJI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DD010E6CB
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729082585; x=1760618585;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ivq7dTLpksUUEiBoofTDUJtYGhE7hkkRxwVuRZLPET0=;
 b=TiO/eJI4qHDoWfxML6+BOyStFhualeUyEa/9vilH7e43+Bb3Z6nESnOr
 lsFJ5t2zYLEFV4tOyTjCSBmXlPnFPftGwN+laPI9DQ2ka5SW0esfjvTHV
 3brBr/1p9lSntI0uKhSMvCqbLyi7vH/o34RzuvJklwbK2lJ5AoSUB9Af6
 DgkjxFu+uPeNo9olbcipBNxfY8WLqlG8hfKVu9/OaXCTWP4SL6mLd7Yki
 GuyZ0xoj0bTWFqZGdrRZmaZI7NpmvWDrXUd+0BHHMMy6/wKOOuiM7ueCs
 YjYxtHK3RxHnf20J9k4xEeRqacU1CjsgybEaKuMV9f4U+UcrktNwolmht g==;
X-CSE-ConnectionGUID: HUknYlMwTZaeNMq9YTdaVw==
X-CSE-MsgGUID: VzLHJTECS9WiwqLM0044kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39915915"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="39915915"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 05:43:04 -0700
X-CSE-ConnectionGUID: +wHeQEzeTtKmqlXDCUTSBA==
X-CSE-MsgGUID: Nxcp0lclSD28Qjm9ex5Qaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78272412"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Oct 2024 05:43:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Oct 2024 15:43:01 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_color: Move dynamic subtests even further out
Date: Wed, 16 Oct 2024 15:43:00 +0300
Message-ID: <20241016124301.25968-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

In order to run this on older Intel based laptops we have to
make it work for cases where we have just pipe B driving the
single LVDS output. Currently the test just skips because it
tries pipe A first which won't have a connected output. Move
the output selection further out to remedy this.

I thought I already fixed this once with commit 766edf96979b
("tests/kms_color: Move dynamic subtests up one level") but it
clearly isn't working now. Either I failed there or this has
regreressed again due to some other changes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 78 +++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 5f0128bcad9e..d642f561df76 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -787,12 +787,10 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	if (!pipe_output_combo_valid(data, p))
-		goto out;
+	igt_require(pipe_output_combo_valid(data, p));
+
+	igt_assert(test_t(data, data->primary));
 
-	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(data->output))
-		igt_assert(test_t(data, data->primary));
-out:
 	test_cleanup(data);
 }
 
@@ -826,40 +824,36 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	if (!pipe_output_combo_valid(data, p))
-		goto out;
+	igt_require(pipe_output_combo_valid(data, p));
 
 	if (!iter)
 		iter = 1;
 
-	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(data->output)) {
-		/*
-		 * We tests a few values around the expected result because
-		 * it depends on the hardware we're dealing with, we can either
-		 * get clamped or rounded values and we also need to account
-		 * for odd number of items in the LUTs.
-		 */
-		for (i = 0; i < iter; i++) {
-			color_t expected_colors[3] = {
-				fb_colors[0],
-				fb_colors[1],
-				fb_colors[2],
-			};
-
-			transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
-			transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
-			transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
-
-			if (test_pipe_ctm(data, data->primary, fb_colors,
-					  expected_colors, ctm)) {
-				success = true;
-				break;
-			}
+	/*
+	 * We tests a few values around the expected result because
+	 * it depends on the hardware we're dealing with, we can either
+	 * get clamped or rounded values and we also need to account
+	 * for odd number of items in the LUTs.
+	 */
+	for (i = 0; i < iter; i++) {
+		color_t expected_colors[3] = {
+			fb_colors[0],
+			fb_colors[1],
+			fb_colors[2],
+		};
+
+		transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
+		transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
+		transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
+
+		if (test_pipe_ctm(data, data->primary, fb_colors,
+				  expected_colors, ctm)) {
+			success = true;
+			break;
 		}
-		igt_assert(success);
 	}
+	igt_assert(success);
 
-out:
 	test_cleanup(data);
 }
 
@@ -1143,9 +1137,11 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(gamma_degamma_tests); i++) {
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
-			for_each_pipe(&data->display, pipe) {
-				run_gamma_degamma_tests_for_pipe(data, pipe,
-								 gamma_degamma_tests[i].test_t);
+			for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+					      igt_output_name(data->output))
+					run_gamma_degamma_tests_for_pipe(data, pipe,
+									 gamma_degamma_tests[i].test_t);
 			}
 		}
 	}
@@ -1153,11 +1149,13 @@ run_tests_for_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
-			for_each_pipe(&data->display, pipe) {
-				run_ctm_tests_for_pipe(data, pipe,
-						       ctm_tests[i].fb_colors,
-						       ctm_tests[i].ctm,
-						       ctm_tests[i].iter);
+			for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+					      igt_output_name(data->output))
+					run_ctm_tests_for_pipe(data, pipe,
+							       ctm_tests[i].fb_colors,
+							       ctm_tests[i].ctm,
+							       ctm_tests[i].iter);
 			}
 		}
 	}
-- 
2.45.2

