Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877F0C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 05:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328E310E3AE;
	Tue, 27 May 2025 05:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOM4sEnF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC1310E3A5
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 05:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748325259; x=1779861259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ohFpIOXM8HiPxPjSgdo5c7JXqe62aRWMr1CV2RlttTQ=;
 b=EOM4sEnFjkppk9G2irvNJa6u9r3BjvqQD5OyiK7QLixVpq+OGrMvSmOz
 O3pT4ooEkVwjD9XOQ9IEMPJ9hBXcVr4OQEHUBaKNoqoxDMjyAevoGkLPI
 ARgQPGall5YDype9JKcpOE2XmSNljHdQOY143m/jVPm8tk+feoQ9Ana7O
 mcOXVc3p4dpKGNtdl/VkLw1gOp06dbzsaZ2RwmLVnAXw/XYAjMdt0Jywi
 PDHiltHPE5mEmIcMee3YXSgmJZhVsUTKdwfQ4B5+dJq5nHrbqYdQg1dxB
 ndhWpRru+XrspecoHW6kNyxhkkwP40XcWtnJgnSu5A9ABjB6cPNAJ4PSb g==;
X-CSE-ConnectionGUID: x8My/fs5QQC4Xm7YoRQopQ==
X-CSE-MsgGUID: KIk2tMn6SbubOvRRiBoIEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50455629"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="50455629"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 22:54:19 -0700
X-CSE-ConnectionGUID: ttH1NBXwR9Cl10OapbNsGw==
X-CSE-MsgGUID: p4GxCfjoSsWmeMyWpFYZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="179842433"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 22:54:17 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v12 4/5] tests/kms_async_flips: Remove allow_fail flag
 from async flip tests
Date: Tue, 27 May 2025 11:23:42 +0530
Message-Id: <20250527055343.247952-5-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527055343.247952-1-santhosh.reddy.guddati@intel.com>
References: <20250527055343.247952-1-santhosh.reddy.guddati@intel.com>
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

Remove allow_fail flag as the async supported format modifiers are
now known to the user space. The test now executes for all supported
format modifiers.

V2: Remove check for frame 1, as no longer needed now as valid
    modifiers are being in use. (Chaitanya)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_async_flips.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 44bc38c71..f824f60f9 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -136,7 +136,6 @@ typedef struct {
 	enum pipe pipe;
 	bool alternate_sync_async;
 	bool suspend_resume;
-	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
 	bool overlay_path;
@@ -429,11 +428,7 @@ static void test_async_flip(data_t *data)
 		}
 
 		ret = perform_flip(data, frame, flags);
-
-		if (frame == 1 && data->allow_fail)
-			igt_skip_on(ret == -EINVAL);
-		else
-			igt_assert_eq(ret, 0);
+		igt_assert_eq(ret, 0);
 
 		wait_flip_event(data);
 
@@ -810,12 +805,6 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			continue;
 
 		test_init(data);
-
-		if (data->linear_modifier && is_intel_device(data->drm_fd))
-			data->allow_fail = true;
-		else
-			data->allow_fail = false;
-
 		data->modifier = data->linear_modifier ? DRM_FORMAT_MOD_LINEAR : default_modifier(data);
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
-- 
2.34.1

