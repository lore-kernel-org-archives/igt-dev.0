Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ABEC77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 09:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763D48952F;
	Tue, 24 Jun 2025 09:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4+CaVkj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9D189316
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750757084; x=1782293084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sAV3Amu+dA+ro1as6p7+s+kqMA+warRkuvy10vLpSm8=;
 b=G4+CaVkjt8v1uhp1jK9NV1ZExIbVLL1zP8YRdNr7s1jKsG/4EQjoRMQY
 tfzbc+aJDtcgw6Uu+fs8Q21N4ojkW5otygXrFzCvt8F40ED74BJ80XrAP
 R75s8Xs4IpSCocrJwPGuZGojp6cvUKcscwezcl2qLjLJJKgFUk9Vvxy56
 vv6CAs7oGpA4oHk37HydDU2eCWkykRCttEzRDBt7PGnDZV+jg9sfWT27y
 jGd/ipbrvgkaK407udJ8HU+39h2tJl0LeY2133Wue9gBmhzYND+2GNlB/
 1tCW1u43ZV4gxat2TW61cauFV5mit8qBjuDnEblnWELeTBhjFLJhPmvtA g==;
X-CSE-ConnectionGUID: YSz1SiQbS5CcpdSINO2fSw==
X-CSE-MsgGUID: 2hgAmjMvRNKt754uHC/GnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64418984"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="64418984"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:24:26 -0700
X-CSE-ConnectionGUID: XlQmOWY1RJ28PX4C+/eW2A==
X-CSE-MsgGUID: 5YSo8eHnSPi5uLx028RrQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="157630898"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:24:23 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 2/4] tests/kms_async_flips: Modify subtest runtime
 for suspend resume subtest
Date: Tue, 24 Jun 2025 14:54:18 +0530
Message-ID: <20250624092421.785063-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624092421.785063-1-karthik.b.s@intel.com>
References: <20250624092421.785063-1-karthik.b.s@intel.com>
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

After a suspend cycle, the next flip will be treated as a sync flip and
will consume the full vblank time. To account for this remove this from
the runtime in FPS calculations.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 0f2d932e4..677da5aba 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -377,6 +377,7 @@ static void test_async_flip(data_t *data)
 	long long int fps;
 	struct timeval start, end, diff;
 	int suspend_time = RUN_TIME / 2;
+	float run_time;
 	bool temp = data->suspend_resume;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -440,8 +441,13 @@ static void test_async_flip(data_t *data)
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
+	if (data->suspend_resume)
+		run_time = RUN_TIME - (1.0 / data->refresh_rate);
+	else
+		run_time = RUN_TIME;
+
 	if (!data->alternate_sync_async) {
-		fps = frame * 1000 / RUN_TIME;
+		fps = frame * 1000 / run_time;
 		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
 			     "FPS should be significantly higher than the refresh rate\n");
 	}
-- 
2.43.0

