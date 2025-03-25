Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCE8C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 12:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AA310E556;
	Tue, 25 Mar 2025 12:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEK6zGPU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C668110E54F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742905325; x=1774441325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FsSLeZ15/xJqmL7xWiDPg6Fd+8AocQPLk2KojB7fQpY=;
 b=GEK6zGPUkDOynPvYlnpDFjTlLUaopm05dVI5R2bymXz4rDq7f243OrJD
 VnkHiDdc+NWKPPspF2gD+TfRZfCtxHUnGkeqM3aNMcU09aiSmktjOxO03
 w1V+imHtyVjwTcAyhGN5q1yQgEf3/dEqcLzB2FSZEVqjdDUvg7RenqmnM
 dUpc0L3sX/634z+1UqBha65OO5V+weHxB3XPL1+bLuhW71rio/udp7s/1
 bN22TmtIcvaX4NuxRbJJdAiTK6R4LIhQprFupvBBFgv5C4Ft1QhXrgP1J
 HcpYmJMRbIAJ9c2ShX6Q/kQJnlsnslRga8fkJ7o6d8RUjz0Nlag5DxWpk Q==;
X-CSE-ConnectionGUID: AX66DUoNT2SyxslIAVlsHA==
X-CSE-MsgGUID: 5JvbQthtS/+yoba0R1ww+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="48022639"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="48022639"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 05:22:04 -0700
X-CSE-ConnectionGUID: PniVJwjTRTyHLGJ8ZJmnVw==
X-CSE-MsgGUID: Uyk0jHtnTMmL+FuVG6m4Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124391611"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 05:22:02 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 3/4] tests/kms_async_flips: Add test for all async
 format modifiers
Date: Tue, 25 Mar 2025 17:46:24 +0530
Message-Id: <20250325121625.2718374-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
References: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
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

Add a new subtest to iterate through all the supported async format
modifier pair and perform async flips.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 90 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 369318368..1fdd13b99 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -316,7 +316,7 @@ static void test_async_flip(data_t *data)
 	do {
 		int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
 
-		if (data->alternate_sync_async) {
+		if (data->alternate_sync_async || data->async_mod_formats) {
 			flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
 
 			ret = perform_flip(data, frame, flags);
@@ -360,7 +360,7 @@ static void test_async_flip(data_t *data)
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
 
-		/* Reduce test execution for all formats and modifiers. One flip should suffice */
+		/* Reduce test execution for all formats and modifiers.*/
 		if (data->async_mod_formats) {
 			igt_assert_f(ret == 0, "Async flip failed with %s modifier and %s format",
 				     igt_fb_modifier_name(data->modifier),
@@ -730,6 +730,87 @@ static void run_test(data_t *data, void (*test)(data_t *))
 	}
 }
 
+static bool skip_async_format_mod(data_t *data,
+			    uint32_t format, uint64_t modifier,
+			    struct igt_vec *tested_formats)
+{
+	/* igt doesn't know how to sw generate UBWC: */
+	if (is_msm_device(data->drm_fd) &&
+	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
+		return true;
+
+	/* VEBOX just hangs with an actual 10bpc format */
+	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
+	    igt_reduce_format(format) == DRM_FORMAT_XRGB2101010)
+		return true;
+
+	/* test each format "class" only once in non-extended tests */
+	struct format_mod rf = {
+		.format = igt_reduce_format(format),
+		.modifier = modifier,
+	};
+
+	if (igt_vec_index(tested_formats, &rf) >= 0)
+		return true;
+
+	igt_vec_push(tested_formats, &rf);
+
+	return false;
+}
+
+static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data_t *))
+{
+	struct igt_vec tested_formats;
+
+	igt_vec_init(&tested_formats, sizeof(struct format_mod));
+
+	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+		test_init(data);
+
+		igt_assert_f(data->plane->async_format_mod_count > 0,
+			     "No async format/modifier supported\n");
+
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
+			struct format_mod f = {
+				.format = data->plane->async_formats[i],
+				.modifier = data->plane->async_modifiers[i],
+			};
+
+			if (skip_async_format_mod(data, f.format, f.modifier, &tested_formats)) {
+				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
+					   IGT_MODIFIER_FMT " on %s.%u\n",
+					   IGT_FORMAT_ARGS(f.format),
+					   IGT_MODIFIER_ARGS(f.modifier),
+					   kmstest_pipe_name(data->pipe),
+					   data->plane->index);
+				continue;
+			}
+
+			data->modifier = f.modifier;
+			data->plane_format = f.format;
+			data->async_mod_formats = true;
+
+			igt_dynamic_f("pipe-%s-%s-%s-%s", kmstest_pipe_name(data->pipe),
+				      data->output->name,
+				      igt_fb_modifier_name(data->modifier),
+				      igt_format_str(data->plane_format)) {
+				      /*
+				       * FIXME: joiner+async flip is busted currently in KMD.
+				       * Remove this check once the issues are fixed in KMD.
+				       */
+				      igt_skip_on_f(is_joiner_mode(data->drm_fd,
+								   data->output),
+						    "Skipping, async flip not supported "
+						    "on joiner mode\n");
+				      test_init_fbs(data);
+				      test(data);
+			}
+		}
+	}
+
+	igt_vec_fini(&tested_formats);
+}
+
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 {
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
@@ -919,6 +1000,11 @@ igt_main
 		run_test(&data, test_async_flip);
 	}
 
+	igt_describe("Verify async flip with all supported modifier and format combinations");
+	igt_subtest_with_dynamic("async-flip-with-all-modifiers-formats") {
+		run_test_with_async_format_modifiers(&data, test_async_flip);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.34.1

