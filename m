Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6EDC369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 05:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAC410E28A;
	Wed, 30 Apr 2025 05:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eF+6IClV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336B610E28A
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 05:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745991389; x=1777527389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DXotoUYzPgE0v6S2VkWd5NcsUEuY+hSo50oduzV39iY=;
 b=eF+6IClVqpg1aGIDSWH4Rh+uS2eAakEvgqYtzTKzoqxQ2YAQjVaekJjf
 oWX5ohZ9UgwgVC4diD0m/YkBsmxCxwDnubUd0zZO/FmrcDoCrIxcViXHg
 9pp70RgYgJnSmoLeFcbyx1SJmxqC6dCUM2jKxxmXlXYpGKTbUZWa72MsW
 tykiApnT9tllFRpaF5PHm3yPJQ/QlmZ9sDODe3NAe7YhneNQqZ/RkZKi+
 0LrMBE7eBwAn+XDVbKlTk9ZhlyvPyeU5TMEWfXIfNcvSD5HqNWI1dyU3Q
 L760HAsH09HQYeqFh0eC+G0cFbObjrCiOnd01Vnpzj2pa40fZVcVA78K6 A==;
X-CSE-ConnectionGUID: aZEKU3QwTBaahG02usQq9g==
X-CSE-MsgGUID: tyPq/of5SQ22lanU7ZBdQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73022579"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="73022579"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 22:36:28 -0700
X-CSE-ConnectionGUID: aKhd+slnRlKk87Ndz3MOvg==
X-CSE-MsgGUID: aJ4wj9BQSqWtJIMnTLhE2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="133929629"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 22:36:26 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_plane_multiple: Add clear skip message for
 skips
Date: Wed, 30 Apr 2025 11:13:26 +0530
Message-Id: <20250430054326.489396-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a check to skip the subtest when the required DRM modifier
is not supported. This avoids unnecessary test skips and
improves clarity by providing a proper skip message.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane_multiple.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index ebb026726..4e6ca780a 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -504,14 +504,14 @@ static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum pi
 	for_each_connected_output_local((display), (output)) \
 		for_each_if(igt_pipe_connector_valid((pipe), (output)))
 
-static void run_2_display_test(data_t *data, uint64_t modifier)
+static void run_2_display_test(data_t *data, uint64_t modifier, const char *name)
 {
 	enum pipe pipe1, pipe2;
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
 
-	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
-		return;
+	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
+		      "%s modifier is not supported\n", name);
 
 	igt_display_reset(display);
 
@@ -547,14 +547,14 @@ static void run_2_display_test(data_t *data, uint64_t modifier)
 	}
 }
 
-static void run_test(data_t *data, uint64_t modifier)
+static void run_test(data_t *data, uint64_t modifier, const char *name)
 {
 	enum pipe pipe;
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
 
-	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
-		return;
+	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
+		      "%s modifier is not supported\n", name);
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		igt_display_reset(display);
@@ -647,7 +647,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			     "reflected immediately after each commit.");
 
 		igt_subtest_with_dynamic(subtests[i].name)
-			run_test(&data, subtests[i].modifier);
+			run_test(&data, subtests[i].modifier, subtests[i].name);
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
@@ -660,7 +660,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 			igt_require(valid_outputs > 1);
 
-			run_2_display_test(&data, subtests[i].modifier);
+			run_2_display_test(&data, subtests[i].modifier, subtests[i].name);
 		}
 	}
 
-- 
2.34.1

