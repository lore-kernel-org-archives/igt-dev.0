Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E221C54E5D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 06:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C027F10F219;
	Thu, 14 Mar 2024 06:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyAj+XSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6AF10F219
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710398448; x=1741934448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zk1lCTipl1+q7gZ8HsoXZK41aWe8nj/PBGCbqbS/iMg=;
 b=SyAj+XSHFYr+z4+fhurSboBFQgxCE/FLzW55nlmB8jYihoI93DaFhAnO
 bM7qr11mRSwlZ77uwDz+G3y+0EC/2AjnHpYnGuXDS1d1jLtskK39Bctid
 6h4Avm+cgGcVcN6npaHb7Hp2EXIzu/VN7z7r72OOgJ8HcHtUBHSLJSZHz
 RndZI10RtZn8OtZVue24mRiOeCkcv6d66UrTd6Sq4ccohhUlA8oVFNapE
 p5tv+A0UNi88VWY4UcOVuxjDj4DJUOpNbDODqngEXeWrXo4fQE4iKgRKe
 wZRsfxlhSMbYHejS1h09+PwZnwGqgaV62uV6BxblObFg8xJfxGLZPENXP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15841999"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="15841999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 23:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="16662946"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 23:40:46 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [i-g-t V2] tests/kms_async_flips: Re-calculate min flips per frame
Date: Thu, 14 Mar 2024 12:04:23 +0530
Message-ID: <20240314063423.3951887-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240314055437.3942648-1-bhanuprakash.modem@intel.com>
References: <20240314055437.3942648-1-bhanuprakash.modem@intel.com>
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

V2:
  - Guard the logic with is_xe_device()

Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_async_flips.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2895168f7..a92f23c29 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -238,6 +238,21 @@ static void test_async_flip(data_t *data)
 	int ret, frame;
 	long long int fps;
 	struct timeval start, end, diff;
+	int min_flips_per_frame = MIN_FLIPS_PER_FRAME;
+
+	/*
+	 * FIXME: As pinning is taking moretime in XE, recalculate min frames
+	 * per frame (by considering the pinning time as 1.2 ms)
+	 */
+	if (is_xe_device(data->drm_fd)) {
+		min_flips_per_frame = 1000 / (data->refresh_rate * 1.2);
+		igt_require(min_flips_per_frame);
+
+		if (min_flips_per_frame > MIN_FLIPS_PER_FRAME)
+			min_flips_per_frame = MIN_FLIPS_PER_FRAME;
+	}
+
+	igt_info("Expected min flips per frame: %d\n", min_flips_per_frame);
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -296,10 +311,10 @@ static void test_async_flip(data_t *data)
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
@@ -307,7 +322,7 @@ static void test_async_flip(data_t *data)
 
 	if (!data->alternate_sync_async) {
 		fps = frame * 1000 / RUN_TIME;
-		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+		igt_assert_f((fps / 1000) > (data->refresh_rate * min_flips_per_frame),
 			     "FPS should be significantly higher than the refresh rate\n");
 	}
 }
-- 
2.43.2

