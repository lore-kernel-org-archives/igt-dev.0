Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F12EB7EA4
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 08:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C013810E970;
	Wed,  4 Mar 2026 08:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBcyLWQx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD9510E970
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772612586; x=1804148586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x04Bz9UkXVTtqqj2wJWG9J+Q+LQJtDtRwPKMtMXzAW4=;
 b=GBcyLWQxpevbWubwIwz7KV9GsCqcgT3/jCtpdaVMy2i08jGiSASR6Evl
 XQ8NZ8TifFK3gZTUdL5EOF3NyFocQhE75mvQ10xEEYSnSqF8N6KxKEWs2
 WRBm6fUNnPU0iyZ2x8cqakxh7hjoaqRribVe7QVxtw3erEHlFjZMpDZ//
 DETrI6Z0mW2zwNfPOth4c4cmnLSOkv0fmqW6+DMgOdh/okYPbJLneKj2L
 R2eQuLarc3z6aqoyTnE5N5Dr4AjVkUgB7NIxToyCJ0W3QfWXu6UIw83kP
 vSC6bDFJWDvt4fZPLUCUwupmA7zMbt+VoT8NA0frWr9Qm+OHS+EvzlgOw Q==;
X-CSE-ConnectionGUID: AUm4eQ+ESPe29U8C1g+pSw==
X-CSE-MsgGUID: lTR87/YmRv6u5uzE/IRS5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73717369"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73717369"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:23:05 -0800
X-CSE-ConnectionGUID: kSuv7Dc4SriT88fguvvyDQ==
X-CSE-MsgGUID: yte9e78YRMibZ0Cix6Px4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="222762438"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.245.129])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:23:04 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: Do not skip any tests due to
 Selective Fetch
Date: Wed,  4 Mar 2026 10:22:51 +0200
Message-ID: <20260304082251.537827-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

There are recent changes in driver fixing async flip handling when
selective fetch is enabled. There is no need to skip any async flip tests
due to Selective Fetch anymore. Remove checking Selective Fetch.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15791
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/kms_async_flips.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1a4941ef7..abb1d9c10 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -624,15 +624,6 @@ static void test_cursor(data_t *data)
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	/*
-	 * Intel's PSR2 selective fetch adds other planes to state when
-	 * necessary, causing the async flip to fail because async flip is not
-	 * supported in cursor plane.
-	 */
-	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd, NULL),
-		      "PSR2 sel fetch causes cursor to be added to primary plane " \
-		      "pages flips and async flip is not supported in cursor\n");
-
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
 
@@ -1172,15 +1163,6 @@ int igt_main()
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
 
@@ -1188,14 +1170,6 @@ int igt_main()
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
2.43.0

