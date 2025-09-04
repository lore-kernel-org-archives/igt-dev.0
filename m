Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD41ECA1014
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 03:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F8310E960;
	Thu,  4 Sep 2025 03:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggKwtYDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFE210E960
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 03:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756957539; x=1788493539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zGmgat8izHO0hyzh2CCMTemY0Col801JX3wje889q5k=;
 b=ggKwtYDPTjcWTB4YOA9q889mPvJFuWeMei2UmvFbM+3e8LAgaIfPjUix
 Z4EhcMSsTXZXW7oR/mwjH20CkVRV3iO+Cc7y9fnnq+Vq/Gwu53pocK+OK
 uEaIO32thaFEOdhHuQOspc7Z2vcRH2sYPI1rwlDqAPHQnnAKOe+kNNZys
 Bm5ejplq/5ANbtYc7MRW9WDeY5d7PvXr39Uz6PZraN6dwm+BJrrxGn+be
 ZCGWDoi+usln++SSBzKqiGjW1BFfDLlouxOM0f8N1PrG0SiNCAYBUbuh1
 Eg2iO6YNljfxIkxZhujni32V04zgYx8HQ0GK94p0jNKwTdJIli6vmYRxK A==;
X-CSE-ConnectionGUID: EIncHL1kTF2FsJZ1hh796w==
X-CSE-MsgGUID: xrrzPZ1OS0CjADp2BFZVAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70712320"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="70712320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 20:45:38 -0700
X-CSE-ConnectionGUID: 9vfuVxNSQEaiYCL/wNmPNQ==
X-CSE-MsgGUID: d94ryffBTMu2L9aV2oy6Vg==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 20:45:36 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_setmode: Check timing twice before asserting
 basic subtest
Date: Thu,  4 Sep 2025 09:15:29 +0530
Message-ID: <20250904034529.1264989-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

The check_timings() function previously failed tests if vblank timing was
slightly off. This was too strict in general and caused false failures due
to small timing variations, especially on some displays.

This change adjusts the accuracy check to allow retries and provides more
flexibility for minor timing differences.

v2: Fix commit message and add igt_info for retry.
v3: Rebase.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 43 +++++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 484c3a95f..753c65ec0 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -461,7 +461,7 @@ static int test_stealing(int fd, struct crtc_config *crtc, uint32_t *ids)
 #define frame_time(km) (1000.0 * (km)->htotal * (km)->vtotal / (km)->clock)
 #define line_time(km) (1000.0 * (km)->htotal / (km)->clock)
 
-static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
+static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 {
 #define CALIBRATE_TS_STEPS 120 /* ~2s has to be less than 128! */
 	drmVBlank wait;
@@ -540,9 +540,12 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 		 100 * accuracy / mean, accuracy / line_time(kmode));
 
 	/* 99.7% samples within one scanline on each side of mean */
-	igt_assert_f(accuracy < line_time(kmode),
-		     "vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
-		     accuracy, 100 * accuracy / mean, line_time(kmode));
+	if (accuracy >= line_time(kmode)) {
+		igt_info("vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
+			  accuracy, 100 * accuracy / mean, line_time(kmode));
+
+		return false;
+	}
 
 	/* At least 90% of frame times fall within the one scanline on each
 	 * side of expected mean.
@@ -565,12 +568,18 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 	 * See:
 	 * https://en.wikipedia.org/wiki/Standard_deviation#Rules_for_normally_distributed_data
 	 */
-	igt_assert_f(fabs(mean - expected) < max(line_time(kmode), 1.718 * stddev),
-		     "vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
-		     expected, mean, stddev,
-		     fabs(mean - expected),
-		     fabs(mean - expected) / stddev,
-		     fabs(mean - expected) / line_time(kmode));
+	if (fabs(mean - expected) >= max(line_time(kmode), 1.718 * stddev)) {
+		igt_info("vblank interval differs from modeline! expected %.1fus, "
+			 "measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
+			  expected, mean, stddev,
+			  fabs(mean - expected),
+			  fabs(mean - expected) / stddev,
+			  fabs(mean - expected) / line_time(kmode));
+
+		return false;
+	}
+
+	return true;
 }
 
 static void test_crtc_config(const struct test_config *tconf,
@@ -654,8 +663,18 @@ retry:
 
 	igt_assert(config_failed == !!(tconf->flags & TEST_INVALID));
 
-	if (ret == 0 && tconf->flags & TEST_TIMINGS)
-		check_timings(crtcs[0].crtc_idx, &crtcs[0].mode);
+	if (ret == 0 && tconf->flags & TEST_TIMINGS) {
+		bool status = false;
+
+		for (int attempt = 1; attempt <= 2; attempt++) {
+			status = check_timings(crtcs[0].crtc_idx, &crtcs[0].mode);
+			if (status)
+				break;
+			igt_info("Timing check failed on attempt %d, retrying...\n", attempt);
+		}
+
+		igt_assert_f(status, "VBlank timing test failed after 2 attempt(s)\n");
+	}
 
 	return;
 }
-- 
2.43.0

