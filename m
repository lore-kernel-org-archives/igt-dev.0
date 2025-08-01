Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050EEC87FCA
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 10:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB7710E830;
	Fri,  1 Aug 2025 10:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFlJWqe8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49E410E830
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 10:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754045909; x=1785581909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r0F07i02WNrZmr/rNohal5TlU1pz0OMcYPhNha4wwUo=;
 b=mFlJWqe8rFRNpDCu9HDVJSeXlkGJiZvtf9wmj10IogSVmaoMgJEY+rnS
 Dgy8B8zPws7UPAQBVAYJs9K+eVaImlEGdznO9NjlFj0HBpNFaCgMs51lg
 /gknfsNZgkvpfkch66SBDtKbSV4x9rLGXrm4d+Cdh+KpvZl8WRnZE/KtU
 P/ST+2GTF1G1dB1fOvPqj2OXnMrhnELaZ3CkU8Owk1OOAoqv8FxWOJjdF
 dj7/AQ8fyngEMvGSrBMsY0s43dnpR//KxAiyPO4pB2iMe/bVFNqLQTmR0
 cix4iwJyn6fhF8LF7CqC3+maVvsZZ54ZFNnwc/O+GIl+nnjBc8V0a31i7 Q==;
X-CSE-ConnectionGUID: 9nkqBYBQRH2dHkY99bvP2Q==
X-CSE-MsgGUID: kgV9Nq+tRwiror6OyZZJtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67466075"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67466075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 03:58:28 -0700
X-CSE-ConnectionGUID: kezsibIOSOegis5I4L0kjw==
X-CSE-MsgGUID: aTGiWe4TSiecDSh4sPMEvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="168917523"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 03:58:27 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_async_flips: Fix for HRR panels
Date: Fri,  1 Aug 2025 16:26:40 +0530
Message-Id: <20250801105640.929381-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Current logic in the test is too strict for high refresh panels,
It expects the flips per frame to be 5x times the refresh rate which is
not ideal for high refresh like 240 , 360 Hz.

Introduce func to determine min flips per frame depending on refresh
rate of the panel.

v2: Remove hard coded values and calculate min flips based on refresh
rate dynamically (Karthik)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 8a943fe01..f2f3e0972 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -117,7 +117,7 @@
  */
 
 #define RUN_TIME 2
-#define MIN_FLIPS_PER_FRAME 5
+#define MIN_FLIPS_PER_FRAME_60HZ 5
 #define NUM_FBS 4
 
 IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
@@ -158,6 +158,22 @@ struct format_mod {
 	uint32_t format;
 };
 
+static int min_flips_per_frame(unsigned int refresh_rate)
+{
+	/*
+	 * Calculate minimum flips per frame based on refresh rate scaling from 60Hz baseline
+	 *
+	 * High refresh rate displays fail async flip tests due to
+	 * unrealistic timing expectations.
+	 * This ensures async flip tests remain meaningful across all refresh rates
+	 * while avoiding false failures due to overly strict timing requirements.
+	 */
+	int min_flips = MIN_FLIPS_PER_FRAME_60HZ * 60 / refresh_rate;
+
+	/* Ensure to have at least 1 flip per frame */
+	return max(min_flips, 1);
+}
+
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
 			 unsigned int tv_usec, void *_data)
 {
@@ -415,6 +431,9 @@ static void test_async_flip(data_t *data)
 	int mid_time = RUN_TIME / 2;
 	float run_time;
 	bool temp = data->suspend_resume || data->hang || data->dpms;
+	int min_flips;
+
+	min_flips = min_flips_per_frame(data->refresh_rate);
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -473,10 +492,10 @@ static void test_async_flip(data_t *data)
 		timersub(&end, &start, &diff);
 
 		if (data->alternate_sync_async) {
-			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * min_flips),
 				     "Flip interval not significantly smaller than vblank interval\n"
 				     "Flip interval: %lfms, Refresh Rate = %dHz, Threshold = %d\n",
-				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
+				     data->flip_interval, data->refresh_rate, min_flips);
 		}
 
 		if (data->suspend_resume && diff.tv_sec == mid_time && temp) {
@@ -527,7 +546,7 @@ static void test_async_flip(data_t *data)
 
 	if (!data->alternate_sync_async && !data->async_mod_formats) {
 		fps = frame * 1000 / run_time;
-		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+		igt_assert_f((fps / 1000) > (data->refresh_rate * min_flips),
 			     "FPS should be significantly higher than the refresh rate\n");
 	}
 }
@@ -803,9 +822,12 @@ static void test_crc(data_t *data)
 	unsigned int start;
 	int ret, width, height;
 	drmModeModeInfoPtr mode;
+	int min_flips;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
+	min_flips = min_flips_per_frame(data->refresh_rate);
+
 	/* make things faster by using a smallish mode */
 	mode = &data->output->config.connector->modes[0];
 	width = mode->hdisplay;
@@ -854,7 +876,7 @@ static void test_crc(data_t *data)
 	igt_pipe_crc_free(data->pipe_crc);
 
 	/* make sure we got at a reasonable number of async flips done */
-	igt_assert_lt(data->frame_count * 2, data->flip_count);
+	igt_assert_lt(data->frame_count * min_flips, data->flip_count);
 }
 
 static void require_linear_modifier(data_t *data)
-- 
2.34.1

