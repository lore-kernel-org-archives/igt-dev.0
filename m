Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B09CC61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 06:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A99610E755;
	Thu, 12 Jun 2025 06:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5CiODBU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B577F10E722
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 06:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749709202; x=1781245202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lKoSKafhrwS2vAyr4Mgr0MTof490VnTNqDgfIvCKXO0=;
 b=l5CiODBUPb6ecBe42d7dPD/bkVlo9LeWwRjuiojtd6OtESx/PU42IjSf
 MnPOHpBlilEdQKksnvQJjJZxHJwSlLXBsmBT7W+ckDp3SnrgfqZKcXuMj
 S/SWWsv/J3+WUEmA9i7FHzGK2eB84Hd3bSzTyunzoXzoM/dr05iTk6jhN
 20PaSrFffog0UCPOUbpCYXDo+SFhWkaB1/WEe1GAbZo6KGS3kcFf3OV+6
 B/NQI2+8kMtAiLP8tb+ybk64orjmdiPCMVh7S9KZUBgcJcvZ+nGdRz7TV
 36pJpfDDYK5SSI3b6Fwk2VhTLbTo3CWTCCnERftopmYJG9N2Gr9CtXZwN g==;
X-CSE-ConnectionGUID: WfI7mGZiTNmYguV1ROkHBQ==
X-CSE-MsgGUID: 3gAZvUCWQEG8cJ9mWm6P9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63282226"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63282226"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 23:20:02 -0700
X-CSE-ConnectionGUID: nqA5TzJ/S/G752MIFAck2A==
X-CSE-MsgGUID: UL6qwAiSTgaEZZYwl4m4hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152189580"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 23:20:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: Fix for HRR panels
Date: Thu, 12 Jun 2025 11:48:29 +0530
Message-Id: <20250612061829.431231-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 97128cfad..5669d450e 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -139,6 +139,18 @@ typedef struct {
 	bool linear_modifier;
 } data_t;
 
+static int min_flips_per_frame(unsigned int refresh_rate)
+{
+	if (refresh_rate >= 480)
+		return 1;
+	else if (refresh_rate >= 240)
+		return 2;
+	else if (refresh_rate >= 144)
+		return 3;
+	else
+		return MIN_FLIPS_PER_FRAME;
+}
+
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
 			 unsigned int tv_usec, void *_data)
 {
@@ -377,6 +389,9 @@ static void test_async_flip(data_t *data)
 	long long int fps;
 	struct timeval start, end, diff;
 	int suspend_time = RUN_TIME / 2;
+	int min_flips;
+
+	min_flips = min_flips_per_frame(data->refresh_rate);
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -421,10 +436,10 @@ static void test_async_flip(data_t *data)
 		timersub(&end, &start, &diff);
 
 		if (data->alternate_sync_async) {
-			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * min_flips),
 				     "Flip interval not significantly smaller than vblank interval\n"
 				     "Flip interval: %lfms, Refresh Rate = %dHz, Threshold = %d\n",
-				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
+				     data->flip_interval, data->refresh_rate, min_flips);
 		}
 
 		if (data->suspend_resume && diff.tv_sec == suspend_time) {
@@ -712,9 +727,12 @@ static void test_crc(data_t *data)
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
@@ -763,7 +781,7 @@ static void test_crc(data_t *data)
 	igt_pipe_crc_free(data->pipe_crc);
 
 	/* make sure we got at a reasonable number of async flips done */
-	igt_assert_lt(data->frame_count * 2, data->flip_count);
+	igt_assert_lt(data->frame_count * min_flips, data->flip_count);
 }
 
 static void run_test(data_t *data, void (*test)(data_t *))
-- 
2.34.1

