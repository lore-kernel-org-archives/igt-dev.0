Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78851CAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 04:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E04B10E3A4;
	Mon, 22 Sep 2025 04:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMVSYdmX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D785E10E3A4
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 04:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758516198; x=1790052198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LNZBm/YxvWAMu5NsGcqc13lHhM9uacpKcrd/dt3jlSI=;
 b=PMVSYdmXpK4z57Et9mI6yNzh1pUxjgfijs69w56h4V5Hs/RB4c8aao11
 M2VkOfi5/jCs9W+2sc3FnnNRLMn9DVNxdpNaPvnN3DYVshSfnW5uPmQss
 F2l5H4+Dr+f/d1rkzqzC+yG843l+3k2x6+QvSt/Bfg47GuUo7QgzUAdtw
 PDrYLfD1SukbgGuzMHw3kSaFt6Lsn1A1Kek+6V+DvK/29SOwH51SGJ+2b
 xHQIABHWebCpmUW+++ceewjMXnJRrFQnup0S4YMhJvTp8wtpYFMJ3hkbK
 wizm14Tq13FErS/e5HN5h03hmhNXc28hn3qghpXV67+Nf0HZLzm6WbFQa A==;
X-CSE-ConnectionGUID: xAkMqGRvTmuXj+9byofLVw==
X-CSE-MsgGUID: MCF9dYS4SmGzaBtim1GOjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60467134"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60467134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 21:43:18 -0700
X-CSE-ConnectionGUID: eqELUAu+SYmApENTxjQVIw==
X-CSE-MsgGUID: JKF4qWEuSOKOCi5efzL1Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="207344501"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 21:43:16 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_setmode: simplify mode selection by
 removing goto
Date: Mon, 22 Sep 2025 10:12:48 +0530
Message-ID: <20250922044249.1374338-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922044249.1374338-1-jeevan.b@intel.com>
References: <20250922044249.1374338-1-jeevan.b@intel.com>
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

