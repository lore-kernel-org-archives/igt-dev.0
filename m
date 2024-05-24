Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3A0C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 10:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BAF10E142;
	Fri, 24 May 2024 10:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mdc8Scst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15F610E142
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716545961; x=1748081961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vATe4sihuMRHvujZbhJ3V0VCX0F2f3arw8deXGsEjBI=;
 b=Mdc8ScstOAZO3g/K8LKz593nbkAulMtWZ9YpUCmigDhkgK9k8RrNo17K
 o0Xk9JNDMSYOXhrezmeFWYmk6P4TBckpJqtU+J1HNa+gmnMrcsVsHWMOE
 x8/3c09RPBvRf1obL+pJIrHhZrrGpMwpM36CkqK8banQ1DMfsET7AtqVx
 y2A0u4XmI3kuVld8CCx650rKOTFoV32p0DfWA6RupOuW05F5M3jW+ccmH
 k4y4JbRP3KzkEgqf4fzKeVT1WtuaQZobMLPja5J2KOHNXhQCAVxQXkCFu
 J9V4RNeBXtKYc4rUtajhOmnco7qkYz7QX7oEDbAyuAfI9gvEF+ZjA1x7b A==;
X-CSE-ConnectionGUID: L4B6ZQQZReO+PpA5nakN5w==
X-CSE-MsgGUID: 9vOm/vNPS4CZcNVDLgjeVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12701355"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="12701355"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 03:19:18 -0700
X-CSE-ConnectionGUID: wgHc8NXoQKy03QDMEYPKPQ==
X-CSE-MsgGUID: 3vavYZf+RNWWeBdyw+fmrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="33961977"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 03:19:17 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_color: Add connector name to dynamic
 subtests
Date: Fri, 24 May 2024 15:42:01 +0530
Message-ID: <20240524101202.2735010-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240524101202.2735010-1-bhanuprakash.modem@intel.com>
References: <20240524101202.2735010-1-bhanuprakash.modem@intel.com>
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

Add connector name to dynamic subtests, so that it would
be easy to understand that which pipe/output combo is
selected.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 66 +++++++++++++++++++++++------------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index bdb80a4ad..645a03537 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -790,8 +790,8 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	if (!pipe_output_combo_valid(data, p))
 		goto out;
 
-	igt_assert(test_t(data, data->primary));
-
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(data->output))
+		igt_assert(test_t(data, data->primary));
 out:
 	test_cleanup(data);
 }
@@ -832,30 +832,32 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	if (!iter)
 		iter = 1;
 
-	/*
-	 * We tests a few values around the expected result because
-	 * it depends on the hardware we're dealing with, we can either
-	 * get clamped or rounded values and we also need to account
-	 * for odd number of items in the LUTs.
-	 */
-	for (i = 0; i < iter; i++) {
-		color_t expected_colors[3] = {
-			fb_colors[0],
-			fb_colors[1],
-			fb_colors[2],
-		};
-
-		transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
-		transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
-		transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
-
-		if (test_pipe_ctm(data, data->primary, fb_colors,
-				  expected_colors, ctm)) {
-			success = true;
-			break;
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(data->output)) {
+		/*
+		 * We tests a few values around the expected result because
+		 * it depends on the hardware we're dealing with, we can either
+		 * get clamped or rounded values and we also need to account
+		 * for odd number of items in the LUTs.
+		 */
+		for (i = 0; i < iter; i++) {
+			color_t expected_colors[3] = {
+				fb_colors[0],
+				fb_colors[1],
+				fb_colors[2],
+			};
+
+			transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
+			transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
+			transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
+
+			if (test_pipe_ctm(data, data->primary, fb_colors,
+					  expected_colors, ctm)) {
+				success = true;
+				break;
+			}
 		}
+		igt_assert(success);
 	}
-	igt_assert(success);
 
 out:
 	test_cleanup(data);
@@ -1129,10 +1131,8 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
 			for_each_pipe(&data->display, pipe) {
-				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-					run_gamma_degamma_tests_for_pipe(data, pipe,
-									 gamma_degamma_tests[i].test_t);
-				}
+				run_gamma_degamma_tests_for_pipe(data, pipe,
+								 gamma_degamma_tests[i].test_t);
 			}
 		}
 	}
@@ -1141,12 +1141,10 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
 			for_each_pipe(&data->display, pipe) {
-				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-					run_ctm_tests_for_pipe(data, pipe,
-							       ctm_tests[i].fb_colors,
-							       ctm_tests[i].ctm,
-							       ctm_tests[i].iter);
-				}
+				run_ctm_tests_for_pipe(data, pipe,
+						       ctm_tests[i].fb_colors,
+						       ctm_tests[i].ctm,
+						       ctm_tests[i].iter);
 			}
 		}
 	}
-- 
2.43.2

