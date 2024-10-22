Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C407AD2CDF5
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8581610E6B0;
	Tue, 22 Oct 2024 15:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdZsrMwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A6110E6AE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729612363; x=1761148363;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=W8LfI8YNv65fVd4YsIIrRsuBJhG6YuMEn+Z2H4FSUjw=;
 b=jdZsrMwuqh3Rul7GD1M5dt2tC6meHtGlXUUyGiVmuyCDsfyCaRvN0wAg
 YFcGfxRCDOebtqrzApCxtH+PeURXJfg+HnwumdM4laE0faU4LghQYyQLB
 4mAcIvedUVKLUbHEM8ZqV8uMA2HNvgLzgW3wBDlZ7LO0DfuRLVzKSWQ9T
 TRXxeFe+urrY1vnXo7d6FOADlyLHzjsPbax4ThE5VF+9Y4Q4P28tYJreN
 yLJioi5Pjh9rU1upWWp5ZIP2lHSV/F6u7l7bJ7WghnO/xn+b7oMkDcrrF
 HZY+oKO7j4AsvpsQ68Xzi7n/eq0yR7zegA17gU+fyUDSV+88FT2tkX/HK g==;
X-CSE-ConnectionGUID: 4NpUwzhTREWl/AsMUyNLnA==
X-CSE-MsgGUID: wQlINDWBTY+Z9WIsrRBbEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29268532"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29268532"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:52:43 -0700
X-CSE-ConnectionGUID: 780/H2peTUOpeZA9Wbkxhw==
X-CSE-MsgGUID: TSPmFP8tTeyW7GD0benKMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80248401"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:52:41 -0700
From: Imre Deak <imre.deak@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 3/3] tests/i915/kms_flip_tiling: Fix pageflip timeout
 for low vrefresh modes
Date: Tue, 22 Oct 2024 18:53:11 +0300
Message-ID: <20241022155311.2797257-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241022155311.2797257-1-imre.deak@intel.com>
References: <20241022155311.2797257-1-imre.deak@intel.com>
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

The current fixed 50 ms timeout for pageflip completion is not long
enough for low vrefresh modes. In general the timeout should account for
one frame for the flip itself + one frame for vblank waiting due to FBC
invalidation + a fixed amount for scheduling overhead delivering the
completion event to userspace. For the usual 60Hz modes the 50 ms
timeout worked ok based on the above (2 * 17 ms + 16 ms), but didn't
work for 30 Hz modes (the minimum timeout for those being ~67 ms).

Based on the above use a timeout length of 2 * mode specific frame
time + 20 ms fixed scheduling delay.

Testcase: igt@kms_flip_tiling
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/intel/kms_flip_tiling.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index 3bf02564e..e937c2171 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -86,6 +86,18 @@ static int try_commit(igt_display_t *display)
 				       COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
+static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
+{
+	uint64_t timeout_ns;
+
+	/* 1 frame for flip + 1 frame for vblank wait due to FBC. */
+	timeout_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh) * 2;
+	/* 20 msec scheduling overhead. */
+	timeout_ns += 20000000;
+
+	return DIV_ROUND_UP(timeout_ns, 1000);
+}
+
 static void
 test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
 {
@@ -137,7 +149,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	igt_require(ret == 0);
 
 	data->flipevent_in_queue = true;
-	kmstest_wait_for_pageflip(data->drm_fd);
+	kmstest_wait_for_pageflip_timeout(data->drm_fd, pageflip_timeout_us(mode));
 	data->flipevent_in_queue = false;
 
 	/* Get a crc and compare with the reference. */
-- 
2.44.2

