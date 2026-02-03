Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35910E83062
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF33910E586;
	Tue,  3 Feb 2026 08:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJc7jd/5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5596210E586
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770108431; x=1801644431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lPZrl2iIkEjEJN53CcDLUW5BdWX7vdkbroRRGAZKiic=;
 b=AJc7jd/559Z+YdrFCB/OVmnI90BvGV8AmMZn/CIzKhasoFfFk8vFiRHR
 Cvxrs95RZmovHMzQ8f9sJ6vCIqZarz85o+F4LQAYj/io70PMS837WgA2E
 WVg2A2fU8FS6/PbJu9qvBMlvgVyYyOzi3u0ef4y4JZVXdUilqchZrt40g
 rmdP9UhcPaeKlVLKEdMXXrV8kx0+H5+HAwjQkKV35dgh8Oog8A8Nv3b7A
 2DyVorOTuBm3xWBRXKgZVfSP7Mvk6jnLjNvf7bwLeRLlbSuFFBjG/34vB
 MOaeyhd8VbKQzxIUafW4cV2s1jHpoFTdxzuhonA2MZlMcMQOZUjecBoxB Q==;
X-CSE-ConnectionGUID: ZPSS5y3TTRKCzYCAYIeyGA==
X-CSE-MsgGUID: u0SLYAUbQqag5X1fzqfLGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82647698"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82647698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 00:47:11 -0800
X-CSE-ConnectionGUID: AqK7HBBFTJC/iYmv0Xz3qg==
X-CSE-MsgGUID: g7b4gzB7T2KRZhiN0/2BYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="240455287"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 00:47:09 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, swati2.sharma@intel.com,
 animesh.manna@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/kms_async_flips: Fix PSR2 selective fetch
 check for cursor tests
Date: Tue,  3 Feb 2026 14:12:57 +0530
Message-Id: <20260203084257.1372798-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203084257.1372798-1-santhosh.reddy.guddati@intel.com>
References: <20260203084257.1372798-1-santhosh.reddy.guddati@intel.com>
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

The async flip cursor tests are expected to skip on PSR panels and
execute on non-PSR panels.The change allows the test to check per sink
PSR capabilities and verifies async flip behaviour accordingly.

v2: Use psr_sink_support for the panels capabilities to identify psr2_sf
and skip the tests accordingly and revert lib changes. (Jeevan)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 993ad3753..f7f70dd5b 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -616,7 +616,7 @@ static void test_timestamp(data_t *data)
 static void test_cursor(data_t *data)
 {
 	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
-	int ret;
+	int ret, debugfs_fd;
 	uint64_t width, height;
 	struct igt_fb cursor_fb;
 	struct drm_mode_cursor cur;
@@ -628,9 +628,14 @@ static void test_cursor(data_t *data)
 	 * necessary, causing the async flip to fail because async flip is not
 	 * supported in cursor plane.
 	 */
-	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd, NULL),
-		      "PSR2 sel fetch causes cursor to be added to primary plane " \
-		      "pages flips and async flip is not supported in cursor\n");
+	if (is_intel_device(data->drm_fd)) {
+		debugfs_fd = igt_debugfs_dir(data->drm_fd);
+		igt_skip_on_f(psr_sink_support(data->drm_fd, debugfs_fd,
+					       PSR_MODE_2_SEL_FETCH, data->output),
+			      "PSR2 sel fetch causes cursor to be added to primary plane "
+			      "pages flips and async flip is not supported in cursor\n");
+		close(debugfs_fd);
+	}
 
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
@@ -1163,15 +1168,6 @@ int igt_main()
 	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
 	igt_subtest_with_dynamic("test-cursor") {
 		test_init_ops(&data);
-		/*
-		 * Intel's PSR2 selective fetch adds other planes to state when
-		 * necessary, causing the async flip to fail because async flip is not
-		 * supported in cursor plane.
-		 */
-		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
-			      "PSR2 sel fetch causes cursor to be added to primary plane "
-			      "pages flips and async flip is not supported in cursor\n");
-
 		run_test(&data, test_cursor);
 	}
 
@@ -1179,14 +1175,6 @@ int igt_main()
 		     "async flip with atomic commit");
 	igt_subtest_with_dynamic("test-cursor-atomic") {
 		test_init_ops(&data);
-		/*
-		 * Intel's PSR2 selective fetch adds other planes to state when
-		 * necessary, causing the async flip to fail because async flip is not
-		 * supported in cursor plane.
-		 */
-		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
-			      "PSR2 sel fetch causes cursor to be added to primary plane "
-			      "pages flips and async flip is not supported in cursor\n");
 		data.atomic_path = true;
 		run_test(&data, test_cursor);
 	}
-- 
2.34.1

