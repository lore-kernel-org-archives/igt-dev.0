Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4EDC87FD2
	for <igt-dev@archiver.kernel.org>; Fri,  8 Aug 2025 11:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D3310E0A5;
	Fri,  8 Aug 2025 11:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FURPgAV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FC710E0A5
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Aug 2025 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754653623; x=1786189623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pOg2keuCUeENw+E0WkDiEPyALnbLhfYQJWB3+WD4qwQ=;
 b=FURPgAV4yoZ0buOLq8FJEKPoTEi0icHYL9otOURHjCsz3yneS+W0P894
 u6Is74lzdHwH51eP4Ijhg8o3j0qVvPh3PlzcgfMPIVX91vkauL2LaIV6j
 8eJ9NhifYOL6romqZdFhscTIzth9ToIsBQ728oCKFWrbTxOPiKUsQCc3V
 ix177EBCNIpsm+CXAnMmhmk0ZmFEN1UauhFE+eJnkwYRUpIuM7JPMAaUd
 Jc5jWy9Rr8ZcfztZLMDzQgS9bPH/QF+su/z71NAR7mw3cCLqHELxtX7Kc
 b3b9wPNfMmq+EgRddpP+G0I0rQYJR32Y5nhO21SczEHD4sJpICZ7wqssy g==;
X-CSE-ConnectionGUID: 05GX17NnT2eAvEfyc66CQg==
X-CSE-MsgGUID: wkcbhnycQ8qxEax/KN/3eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56715740"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56715740"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:47:03 -0700
X-CSE-ConnectionGUID: G/ZEnEzYSuKXe3bZsABCYA==
X-CSE-MsgGUID: LcEkkO0dQzi1IwquMPkCGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="196134638"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:47:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_async_flips: Fix for HRR panels
Date: Fri,  8 Aug 2025 17:14:43 +0530
Message-Id: <20250808114443.988421-1-santhosh.reddy.guddati@intel.com>
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
v3: Revert changes in test_crc()

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1ac5e6db0..bbfcc0c10 100644
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
-- 
2.34.1

