Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2EEC3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 07:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B8E10E9D8;
	Fri,  9 May 2025 07:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wxvy3FZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3169210E9D8
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746777183; x=1778313183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z41Ac6izyJWdQOL6vDEG1YmVXLJX5+0hUHlZWsIp9Go=;
 b=Wxvy3FZfMOC7o2XbdppvVAZ7zJrRUY5IESXUtCeTfJaU/1VVC+bSRnsk
 Pt0Kvgpo3hF1KQVZM5bERWgG+cPJg4eOYIWxtTnFgFILNEIFfgC1yX9rl
 jmw0qHhYW2bpSRb4M5XvN1Vv+QdIvpVCq1EzvAVw0WE2m4HRZnx6D7Kva
 vftynQXCjy0jMIzQF7fsDWOW7Amj8lhkub+WCwYOhUlF4V/R1/Adim+QZ
 jZ/V9VpLNnkXRdUfXa9WHi5CDL9VVdkiiyGXAvW89M5ulZ4X2NY6u9rRR
 qxvLefRSZMYSgNNTfJDliKuPIIa2iwywfXhLah8Q1h+zOg7mfxRh1xjXJ A==;
X-CSE-ConnectionGUID: YvObAdHTS82J2m4ioGao2w==
X-CSE-MsgGUID: 7tE9f/dTRSaRvQ8CKD+AVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="36222484"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="36222484"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:53:03 -0700
X-CSE-ConnectionGUID: 6yIw2MLlQBKxnGLDB+WUag==
X-CSE-MsgGUID: nL/zCP7MR/ylqK0sWz/9HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167476520"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:53:01 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 3/4] tests/kms_flip: Adjust frame time checks based
 on refresh rate
Date: Fri,  9 May 2025 13:22:31 +0530
Message-ID: <20250509075232.1610123-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509075232.1610123-1-ramanaidu.naladala@intel.com>
References: <20250509075232.1610123-1-ramanaidu.naladala@intel.com>
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

v2: Resolved build issues.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 91e9da690..1d453eace 100755
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
+		uint32_t refresh_rate = USECS_PER_SEC / actual_frame_time(o);
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

