Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90495C83F25
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 05:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC4610E745;
	Wed, 23 Jul 2025 05:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6Xu+OWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BA910E745
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 05:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753250031; x=1784786031;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lp8Ct0OtSnOn8dLDZcCIBi6n8gWPH4LOT0kDl1hFFRc=;
 b=a6Xu+OWT44YJSzLMpJROahrrhL1AnW7MpRRE9G3zReYSmHO0KJzI6oDS
 wGpGLifPplU+LwLkxLBZ+3+V5zzhNnls8PbKhYdMjSmRZf79bgyRiIbkm
 4z7BNbJZZMnAiQMhMFbd4/6xTC8mhBe6MlMFyZAUeXhjxuOU/bXYwOrxe
 9Ip1Pon82XeYlzSc/oljwpJp4MTQY8P6D0Hk6mjnDiMXjhJ9B5f0R8TMt
 qzlYlcUiR3cqs5tKO5mxpfhCdX9J4Y/92DEf8pSNe+ARp0aaijwhONJwa
 YJqGKtvlHINjtWC/E0WzxCQ+2hXiCk9+oKi4zi003jedZRY2uzSuX64C4 g==;
X-CSE-ConnectionGUID: gryxh7mRQMSwLVlhC5nJug==
X-CSE-MsgGUID: fhY6hzt/T/C18cij/4++iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66950128"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66950128"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:53:51 -0700
X-CSE-ConnectionGUID: cmKjwxr4Ts27qQ5FO68eyw==
X-CSE-MsgGUID: +IagVVI8S2ixL3rx2n8N8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="164794377"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:53:48 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 1/5] tests/kms_async_flips: Fix suspend-resume subtest
Date: Wed, 23 Jul 2025 11:23:49 +0530
Message-ID: <20250723055353.1137242-1-karthik.b.s@intel.com>
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
index ddac904ce..4088d8211 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -388,6 +388,7 @@ static void test_async_flip(data_t *data)
 	long long int fps;
 	struct timeval start, end, diff;
 	int suspend_time = RUN_TIME / 2;
+	bool temp = data->suspend_resume;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -452,8 +453,8 @@ static void test_async_flip(data_t *data)
 				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
 		}
 
-		if (data->suspend_resume && diff.tv_sec == suspend_time) {
-			data->suspend_resume = false;
+		if (data->suspend_resume && diff.tv_sec == suspend_time && temp) {
+			temp = false;
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
 
@@ -1161,6 +1162,7 @@ igt_main
 		test_init_ops(&data);
 		data.suspend_resume = true;
 		run_test(&data, test_async_flip);
+		data.suspend_resume = false;
 	}
 
 	igt_describe("Verify basic modeset with all supported modifier and format combinations");
-- 
2.43.0

