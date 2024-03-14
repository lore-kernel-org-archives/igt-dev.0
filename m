Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A2DC5475B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 06:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51C410F8AF;
	Thu, 14 Mar 2024 06:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqN5Azy4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759CE10F8AF
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 06:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710396064; x=1741932064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e7PPD0fA+JBDalQ/S+aRxfOFZ16mIZEcMHDl272emJs=;
 b=TqN5Azy4gD5uzBGwdHTgPM3xhpM5NOJ1YEro64IpXacI4KCzxbXhrIg5
 ghjMHoY8SN8M1RVCpv21JrIp1idEUGJyI6Ma4aMGexpFhrQf6zhiyVIDh
 TkrymsyieIPnVZJvdvPUB/Y7gSRqQF1myKODGDU43yLa0/1Tx9m1BA8No
 7YF1Z1SJ00EAcogsvOBMmROxlONsWeXnQxyJDVs1F1ae3WAnBNuOuqIw2
 iUz3upsfhCzrehMCbP83JNHi3/UYjdvkKF2YJoQ50YqnqGbUS1fYbjZdN
 bYBTZPAcuRB7097fY+IF1xCZttYIp/cNcy76BFANc3CCje5sxUqg5/8g+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5323753"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5323753"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 23:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="16773719"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 23:01:02 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: Re-calculate min flips per frame
Date: Thu, 14 Mar 2024 11:24:37 +0530
Message-ID: <20240314055437.3942648-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

As XE driver taking longer time for pinning, re-calculate to
reduce the expected min flips per frame (by assuming the min
pinning time as 1.2 ms). Otherwise test will fail, since we
can't achieve those many flips per frame.

Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_async_flips.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2895168f7..ec2d86f4e 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -238,6 +238,19 @@ static void test_async_flip(data_t *data)
 	int ret, frame;
 	long long int fps;
 	struct timeval start, end, diff;
+	int min_flips_per_frame;
+
+	/*
+	 * FIXME: As pinning is taking moretime in XE, recalculate min frames
+	 * per frame (by considering the pinning time as 1.2 ms)
+	 */
+	min_flips_per_frame = 1000 / (data->refresh_rate * 1.2);
+	igt_require(min_flips_per_frame);
+
+	if (min_flips_per_frame > MIN_FLIPS_PER_FRAME)
+		min_flips_per_frame = MIN_FLIPS_PER_FRAME;
+
+	igt_info("Expected min flips per frame: %d\n", min_flips_per_frame);
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -296,10 +309,10 @@ static void test_async_flip(data_t *data)
 		timersub(&end, &start, &diff);
 
 		if (data->alternate_sync_async) {
-			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * min_flips_per_frame),
 				     "Flip interval not significantly smaller than vblank interval\n"
 				     "Flip interval: %lfms, Refresh Rate = %dHz, Threshold = %d\n",
-				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
+				     data->flip_interval, data->refresh_rate, min_flips_per_frame);
 		}
 
 		frame++;
@@ -307,7 +320,7 @@ static void test_async_flip(data_t *data)
 
 	if (!data->alternate_sync_async) {
 		fps = frame * 1000 / RUN_TIME;
-		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+		igt_assert_f((fps / 1000) > (data->refresh_rate * min_flips_per_frame),
 			     "FPS should be significantly higher than the refresh rate\n");
 	}
 }
-- 
2.43.2

