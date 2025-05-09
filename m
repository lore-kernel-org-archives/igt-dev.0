Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF66C3ABC6
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 05:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D063D10E9B4;
	Fri,  9 May 2025 05:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2paky3j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4980110E9B4
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 05:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746768437; x=1778304437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yx6n0euC+JXsnzqBdtsTVp+R/1OkhCJONs/6YCWwY10=;
 b=V2paky3jRERZKIBu9nUcq8FzXEl7yRlsCwp5PEr796PAgtgEAhNp3xpi
 X3aKNaOh6zCcpo0+EEBzSLjl0fBTT8fHzSdb8duIfOhtsecuzV9eSmDyI
 qXc7nzYn4LJ+jXVWtIW+MAsP4xS+Lc39vH/cDfT/qMIgkzjvgUgd+Rgey
 si/c9iWHAnsXuk7Al38aEwscBVLK4NC7/Am69SlgAjrTVbKReMXxmSfoi
 +ZsG/p8IFoj+I6VB1GQ6lgbvDR226YyzfcAHoy5aoI2jWg3KI9mVBxA7Z
 dRWl6BzWLFKmI/5o0S6GEaAmMb8lGDrpkJd6L426oS8zQMpp+WA3hbYum Q==;
X-CSE-ConnectionGUID: E5LJ19FeRlOv9hQno5Rgcw==
X-CSE-MsgGUID: cn3IqpP5TyG5BF0/p/ye+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66116665"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="66116665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:27:17 -0700
X-CSE-ConnectionGUID: tTJJwiCDTOKgtWy1oyiDIA==
X-CSE-MsgGUID: k3E18EI5T4ORtLvzFBM8jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="159815409"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:27:15 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 3/4] tests/kms_flip: Adjust frame time checks based
 on refresh rate
Date: Fri,  9 May 2025 10:56:42 +0530
Message-ID: <20250509052643.1607987-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509052643.1607987-1-ramanaidu.naladala@intel.com>
References: <20250509052643.1607987-1-ramanaidu.naladala@intel.com>
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

