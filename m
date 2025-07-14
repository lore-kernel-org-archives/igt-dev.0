Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB17C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 16:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B34E10E4EC;
	Mon, 14 Jul 2025 16:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZlST5LL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BEF10E4EC
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752509813; x=1784045813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PvLsglNreSUxfjwc8508aMAby5x6WUaVVhDHNxbIoGk=;
 b=fZlST5LLkFDWNXgEPWAguX4LoaWkUkoJw2bwvPRpJ7pF8qhPIxh4VYX3
 XtAe3UdS1yWCsFKgHzBQDiePYYx1DSEIgu9eXxLfYsGO/lGpNGf2uXFbQ
 5eka+mAaqr59qOL8dsiqAuMtwkoo9BWzfhijbQ2c+oZulsbrnnVoXaHOm
 +JugvPSJa6qQ2KBK+gRec7WDLsfvy2XUUG/6bdJ/W+Ght268e9QcW4VYK
 DZhLg0QgOL2MzMVyt1RdWOE64GOxI9ggT37kb7afkItGTmcIkzNekCJBe
 j8G92M6CqKA1UUln8qB88TvWT7akvPjZoROo4i7wHfeKBgQfXTb1gBbU9 A==;
X-CSE-ConnectionGUID: qC+HlhYzTC6sW5rU95f+bw==
X-CSE-MsgGUID: /8f8S8G+T7uJHZw/PAWZEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58514527"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="58514527"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:16:53 -0700
X-CSE-ConnectionGUID: EZ3QAYduRHqOMGV6ym+MCQ==
X-CSE-MsgGUID: 704QGmtISdOgGShwilsV4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156378782"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP; 14 Jul 2025 09:16:52 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 RERUN 2/2] tests/intel/kms_frontbuffer_tracking: pass
 non-NULL output pointer
Date: Mon, 14 Jul 2025 18:18:02 +0200
Message-ID: <20250714161802.821516-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250714161802.821516-1-michal.grzelak@intel.com>
References: <20250714161802.821516-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Currently, there is NULL pointer passed to the test as output. Pass
non-NULL output pointer to the test.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0809352cb..d0b21b694 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2329,7 +2329,7 @@ static void do_status_assertions(int flags)
 	}
 
 	if (flags & ASSERT_PSR_ENABLED) {
-		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
+		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, prim_mode_params.output),
 			     "PSR still disabled\n");
 		psr_sink_error_check(drm.debugfs, PSR_MODE_1, prim_mode_params.output);
 	} else if (flags & ASSERT_PSR_DISABLED)
-- 
2.45.2

