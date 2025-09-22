Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E2FCAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 04:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B83E10E030;
	Mon, 22 Sep 2025 04:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIz7A6G1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11DD10E030
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 04:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758513740; x=1790049740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LNZBm/YxvWAMu5NsGcqc13lHhM9uacpKcrd/dt3jlSI=;
 b=nIz7A6G1Agcz/Lab86uDiY7IU04XgVy3Rzias9fCjo9gfq6K9rAaZve/
 N3GLNkkYYrtslSWS4pgSere51ZYJlsPN5cR/6Gj8v1Yw8crfRxnl0qZi7
 HalR38J2NuR0nvRyVSgN4d5InELUBQmILApDr0amo+FlkLpI8ayQUh429
 AAsoDJ3As0oaUwzc9WItFIiHDi3gE3q+6w+XziyjwltE5xo2fkVmDfmRl
 g6MUTBpGFO+d9yjB2c8pH+Tl32M+ucQO0ppexrvomav9oOy845NdU58yn
 6GEL/NHhi8DGLHx3fvxW8SXRAqYbKdKCnwHfZ0rLxsczulwT6IuBJgIPM w==;
X-CSE-ConnectionGUID: hjuDdC2vQuO3FymupqBSsA==
X-CSE-MsgGUID: 6HgMXsurTKWS60j1MQUxXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="48347796"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="48347796"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 21:02:05 -0700
X-CSE-ConnectionGUID: LeytkX6tQ9WdnC9ZT6bCKQ==
X-CSE-MsgGUID: XNMJd7p6RtKSfvTJYe7mpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176192647"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 21:02:04 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_setmode: simplify mode selection by
 removing goto
Date: Mon, 22 Sep 2025 09:31:50 +0530
Message-ID: <20250922040151.1374078-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922040151.1374078-1-jeevan.b@intel.com>
References: <20250922040151.1374078-1-jeevan.b@intel.com>
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

Replaced 'goto found' with early returns in get_mode_for_crtc() and
added braces around the fallback loop. This makes the logic cleaner
and easier to follow without changing behavior.

v2: write to *mode_ret before returning from function.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_setmode.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 484c3a95f..48d0c3e1e 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -238,8 +238,10 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 	 */
 	for (i = 0; i < crtc->connector_count; i++) {
 		mode = &crtc->cconfs[i].default_mode;
-		if (crtc_supports_mode(crtc, mode))
-			goto found;
+		if (crtc_supports_mode(crtc, mode)) {
+			*mode_ret = *mode;
+			return;
+		}
 	}
 
 	/*
@@ -248,8 +250,10 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 	 */
 	for (i = 0; i < crtc->cconfs[0].connector->count_modes; i++) {
 		mode = &crtc->cconfs[0].connector->modes[i];
-		if (crtc_supports_mode(crtc, mode))
-			goto found;
+		if (crtc_supports_mode(crtc, mode)) {
+			*mode_ret = *mode;
+			return;
+		}
 	}
 
 	/*
@@ -258,10 +262,11 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 	 * scaling etc.
 	 */
 	mode = &crtc->cconfs[0].default_mode;
-	for (i = 1; i < crtc->connector_count; i++)
+	for (i = 1; i < crtc->connector_count; i++) {
 		if (crtc->cconfs[i].default_mode.clock < mode->clock)
 			mode = &crtc->cconfs[i].default_mode;
-found:
+	}
+
 	*mode_ret = *mode;
 }
 
-- 
2.43.0

