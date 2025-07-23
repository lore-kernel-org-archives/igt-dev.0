Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2C0C83F25
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 05:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102C210E747;
	Wed, 23 Jul 2025 05:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L36jfTBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50A310E747
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 05:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753250035; x=1784786035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H7vERr9P+0QwThHnxMeyZQnwOv2ItQtUuTybv0+HUh4=;
 b=L36jfTBAx5z3An9nKYXvQ+Gz+WLxGGrRR+xcAKdE8oLOI4pxDJ0fXHYb
 Spe9rvZO90f+E3hwZlQ/cu/6oUo7nx1pLGQ/3/oNcX4+2x/eO/vwE4naI
 XRKEKCjxbOG6AEtRiZSf+EB2dq9pigFDihUTyT5VUAGzADJTolfn2T4uo
 NlytDd3eGdyTFHC9/rayJnYjbZCwr1UU2I836Ap3gWe8+t7OXYH9ncrIS
 ZFzwNzkh0egKkxPJjdMUJqkOx8pEWaW9UwJyaI07+nCuwtzDu8ranb9+c
 zUcK1C/pR/bGLprvfo74yplSETTi2R5O+iCeH7yigNQvxHek6XZ7hIINO w==;
X-CSE-ConnectionGUID: 509O63WtRoavwZECcX+zCg==
X-CSE-MsgGUID: RC5uqDRSSmuKyPP0Qk75EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66950133"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66950133"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:53:55 -0700
X-CSE-ConnectionGUID: vjm3Z68YRk6aDGKVFO/u0Q==
X-CSE-MsgGUID: LDeR5ACDR668bLpfKWCnPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="164794396"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:53:50 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 2/5] tests/kms_async_flips: Modify subtest runtime
 for suspend resume subtest
Date: Wed, 23 Jul 2025 11:23:50 +0530
Message-ID: <20250723055353.1137242-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723055353.1137242-1-karthik.b.s@intel.com>
References: <20250723055353.1137242-1-karthik.b.s@intel.com>
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
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4088d8211..2fa4f2e6f 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -388,6 +388,7 @@ static void test_async_flip(data_t *data)
 	long long int fps;
 	struct timeval start, end, diff;
 	int suspend_time = RUN_TIME / 2;
+	float run_time;
 	bool temp = data->suspend_resume;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -474,8 +475,13 @@ static void test_async_flip(data_t *data)
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
+	if (data->suspend_resume)
+		run_time = RUN_TIME - (1.0 / data->refresh_rate);
+	else
+		run_time = RUN_TIME;
+
 	if (!data->alternate_sync_async && !data->async_mod_formats) {
-		fps = frame * 1000 / RUN_TIME;
+		fps = frame * 1000 / run_time;
 		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
 			     "FPS should be significantly higher than the refresh rate\n");
 	}
-- 
2.43.0

