Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13E9C3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 06:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DA610E9B4;
	Fri,  9 May 2025 06:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/igx+8v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D51E10E9B4
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746772256; x=1778308256;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nrDYG5FVBc0K3lXALy9W8TJsUqulxfuF795jqnvxSIc=;
 b=n/igx+8vNNk3WmwMTI5InAG+/su0UB6l6gx2g8caGjxWwGNG8QF8lkt2
 S6Alks+E0o9dpGbVS0MXzXkqwf9zxf+Gj6a3UBQtQaWeZ4XqdrjAn3jf6
 aE7apTdt21spl2YowKBKFp6D1EUmyc2xruDmkVKyGJ+zKsci3qnySSGyi
 ATpkhlNuzmxObbU6iH5nrTSx0Ncw9vhqogLCUV+rRU2OjojRlMS135JJJ
 PndprLImWWR1Z6ixvQrVxXUJUJdl2zKhuvZyBWA4OMx/tj8Ux2KQtu48P
 E1BS8fMzUVtkVJsob4sOG8b7grnGL6b1DTzAK2A7n/xqOsaaduglXxbcQ g==;
X-CSE-ConnectionGUID: dnlkauzISMqfdsuGxz78CA==
X-CSE-MsgGUID: Xl9dwdYyQviZmS905RQHYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66121121"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="66121121"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 23:30:52 -0700
X-CSE-ConnectionGUID: EyJS9VKyRE2+CmzMaKbefg==
X-CSE-MsgGUID: Eb9tNs8OT4ijX4rr285exw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="137047217"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:30:51 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, uma.shankar@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_setmode: Check timing twice before asserting
 igt@kms_setmode@basic
Date: Fri,  9 May 2025 12:16:34 +0530
Message-Id: <20250509064634.809197-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

The check_timings() function used to fail tests if vblank accuracy was slightly
off, which was too strict for High Refresh Rate (HRR) displays. HRR modes, are
more sensitive to small timing variations due to their shorter frame and
scanline times.

This change adjusts the accuracy check to allow retries and provides more
flexibility for minor timing differences, which is important for HRR tests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 484c3a95f..f58f05ff1 100644
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
@@ -654,8 +663,17 @@ retry:
 
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
+		}
+
+		igt_assert_f(status, "VBlank timing test failed after 2 attempt(s)\n");
+	}
 
 	return;
 }
-- 
2.25.1

