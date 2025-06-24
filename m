Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB05C77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 09:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DE889316;
	Tue, 24 Jun 2025 09:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/xClgdq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF1189316
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750757084; x=1782293084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aypU9KTuFBf3KUiUBv9MQtvi0OjeHhp342FFyjpYmC8=;
 b=I/xClgdqPID5C//uyVkrn/rnhmrsmBmIGtXB/1ThpATkHiICcRzIGw0h
 Wle0MKLzKBNoO0krv93tkm7016LBVeSXLqutuOlF0anqxPBg3jLRSJyPZ
 BMvteTqdiuVipKWaE8GNl6fOUzE9/G+37Q3kNFf7CJEX3GHHLJ6CUdpTT
 HajwwsvIk76Ql3Cvh0aZLylXuzHr3mI0TfHrmc9aSUFS64BL3ZGWHS3qO
 vuumqEV5sZEQFTSZ+NXIUiWvgbuPjl9T5nt0xAvVR4edZ9HnFP/V/8yL9
 NyIrLXkJqvyNqq3F2buV+EShKkIVvVPDsDB5tw7kS4jRg595FhyhPwHhu Q==;
X-CSE-ConnectionGUID: intt89QtS1GN/GJhE/74/g==
X-CSE-MsgGUID: X5vLee4WS/Wrny7djJB0bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64418977"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="64418977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:24:21 -0700
X-CSE-ConnectionGUID: 39vvLbVrRlKVT7txh1ne1g==
X-CSE-MsgGUID: 15vLf4UoSgmmwlc9Vadgkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="157630881"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:24:19 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 1/4] tests/kms_async_flips: Fix suspend-resume subtest
Date: Tue, 24 Jun 2025 14:54:17 +0530
Message-ID: <20250624092421.785063-1-karthik.b.s@intel.com>
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

Currently suspend-resume subtest is only running on the first pipe as
the variable is set to false in the first iteration.

Add a temp variable to avoid this and actually run the test on all the
pipes as intended.

Fixes: 982a8d7bbc0b ("tests/kms_async_flips: Async flips suspend resume test")

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_async_flips.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 065ac9c49..0f2d932e4 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -377,6 +377,7 @@ static void test_async_flip(data_t *data)
 	long long int fps;
 	struct timeval start, end, diff;
 	int suspend_time = RUN_TIME / 2;
+	bool temp = data->suspend_resume;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -432,8 +433,8 @@ static void test_async_flip(data_t *data)
 				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
 		}
 
-		if (data->suspend_resume && diff.tv_sec == suspend_time) {
-			data->suspend_resume = false;
+		if (data->suspend_resume && diff.tv_sec == suspend_time && temp) {
+			temp = false;
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
 		frame++;
@@ -1028,6 +1029,7 @@ igt_main
 		test_init_ops(&data);
 		data.suspend_resume = true;
 		run_test(&data, test_async_flip);
+		data.suspend_resume = false;
 	}
 
 	igt_fixture {
-- 
2.43.0

