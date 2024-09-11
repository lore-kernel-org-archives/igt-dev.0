Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BA3EE01F3
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 05:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1086E10E969;
	Wed, 11 Sep 2024 05:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/x+qWOM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D9B10E969
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 05:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726033841; x=1757569841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qSZneQIGYOfctgF8Pq04yF9FY2NBjtBBlsRpQWGkIUg=;
 b=g/x+qWOMZDVRFYyeSgi5/z2eoMVMMCOK8gDp0pbuowPGQIli6u4j6YFH
 Ce9Vw40luDpVy9VtFK0LKh6zSeCBqKYa0Oexy8n+VWkCQpnwImM8PvZHy
 KvvVZEHY6oPKLm9UcB3bhOgVa53bCxUShyQppgrX3gYhZUCb7Vxfoj0bI
 ploTe5Mv+vwgrhqN1925bz7fbdyJu5QFMCAIBOmzRyckQu0GktYoMX/j5
 67/CaQnDQ740f2yNr2vqHYImAxvtpUEBvXp0wblHAxPbi1wbi6sUr/dHp
 lgp2+AhxQVPoXy1lTy42+VOwVb9rRWGyAcNELymOJHv1Z9L8Vlz/7IvEP A==;
X-CSE-ConnectionGUID: oDfhAvlQQLq8H8derOF8Uw==
X-CSE-MsgGUID: O/hEVAwoQw+1BUplhdyeag==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25009398"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="25009398"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:41 -0700
X-CSE-ConnectionGUID: 6dAAjJ29Q8iBu8MidSbtCA==
X-CSE-MsgGUID: oPWubna9Shu0TbnBIE2tRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67540726"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 jhogande-mobl1..) ([10.245.244.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 3/5] tests/intel/kms_fbt: Add psr_sink_error_check to
 PSR tests
Date: Wed, 11 Sep 2024 08:49:56 +0300
Message-Id: <20240911054958.1023925-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911054958.1023925-1-jouni.hogander@intel.com>
References: <20240911054958.1023925-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are ignoring possible errors detected by the sink in our
testcases using PSR. Fix this by add psr_sink_error_check to each of them.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e45d17dd6..913c7b234 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2722,10 +2722,11 @@ static void do_status_assertions(int flags)
 						   prim_mode_params.pipe));
 	}
 
-	if (flags & ASSERT_PSR_ENABLED)
+	if (flags & ASSERT_PSR_ENABLED) {
 		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
 			     "PSR still disabled\n");
-	else if (flags & ASSERT_PSR_DISABLED)
+		psr_sink_error_check(drm.debugfs, PSR_MODE_1, prim_mode_params.output);
+	} else if (flags & ASSERT_PSR_DISABLED)
 		igt_assert_f(psr_wait_update(drm.debugfs, PSR_MODE_1, NULL),
 			     "PSR still enabled\n");
 }
-- 
2.34.1

