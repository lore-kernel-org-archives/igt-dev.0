Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E32C3ABC6
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 05:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027E410E211;
	Fri,  9 May 2025 05:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuiWV9hM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8C710E211
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 05:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767666; x=1778303666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yx6n0euC+JXsnzqBdtsTVp+R/1OkhCJONs/6YCWwY10=;
 b=RuiWV9hMXPmY6kbHzJS9Y8OFBcIgjTgLJZug2K681Z4AT3BtcdFuWh7z
 BmYO7YAF5uD8qLm1UiIoNtGsUtpLFBDhyLGyAs4YX/9EvkNoGzICU/z5u
 vTDiUlWWzpaJF9DSalHe8E9/BCIOb3SJp0rm2aSThsTtWGPKSSgYSleaI
 lUd9fdc0FSUY6ppGwaK4Dqp5ij8eQ9U4tWlzdmy7fzqOuxmeyWUFLoqxR
 OG1F7grCMSpQusAKJ/dlTBYFdGUjDa0VKRDUOhln1q5kOq1VoFP5A64I2
 P5ChyWw2A1F5X68zxC1LyVQdxKB3ZYAqZOEJaAELKMsEYDtgzQMJVl6zb g==;
X-CSE-ConnectionGUID: 45F4XzohRv+smMvPQNHsBQ==
X-CSE-MsgGUID: m+ZotzjvRbiHiap8OHb4Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48286634"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48286634"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:14:26 -0700
X-CSE-ConnectionGUID: bvi7eqxOSOS4zrh0L4/w8w==
X-CSE-MsgGUID: 7VsJzXLHTYiaaq0AJZSVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="140566426"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:14:23 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/kms_flip: Adjust frame time checks based
 on refresh rate
Date: Fri,  9 May 2025 10:43:52 +0530
Message-ID: <20250509051352.1607604-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509051352.1607604-1-ramanaidu.naladala@intel.com>
References: <20250509051352.1607604-1-ramanaidu.naladala@intel.com>
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

Optimize check_final_state function for high refresh rates by
adjusting frame time checks.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 91e9da690..294624762 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -56,6 +56,8 @@
 #include "igt_stats.h"
 #include "xe/xe_query.h"
 
+#define USECS_PER_SEC (1000000ull)
+
 /**
  * SUBTEST: %s
  * Description: %arg[1] test to validate pageflips with available fences
@@ -1230,9 +1232,17 @@ static bool check_final_state(const struct test_output *o,
 	/* Verify we drop no frames, but only if it's not a TV encoder, since
 	 * those use some funny fake timings behind userspace's back. */
 	if (o->flags & TEST_CHECK_TS) {
+		uint32_t min, max;
 		int count = es->count * o->seq_step;
-		unsigned int min = actual_frame_time(o) * (count - 1);
-		unsigned int max = actual_frame_time(o) * (count + 1);
+		uint32_t refresh_rate = NSECS_PER_SEC / actual_frame_time(o);
+
+		if (refresh_rate <= 60) {
+			min = actual_frame_time(o) * (count - 1);
+			max = actual_frame_time(o) * (count + 1);
+		} else {
+			min = actual_frame_time(o) * (count - 2);
+			max = actual_frame_time(o) * (count + 2);
+		}
 
 		igt_debug("expected %d, counted %d, encoder type %d\n",
 			  (int)(elapsed / actual_frame_time(o)), count,
-- 
2.43.0

