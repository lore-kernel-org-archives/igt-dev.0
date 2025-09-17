Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826FECAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 14:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE1C10E859;
	Wed, 17 Sep 2025 14:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZSw4sLT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3F610E859
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758120201; x=1789656201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Si8VUlmPLjCZX7Bx5Lf2/p4ILa7+HVIernjyyiMEIYE=;
 b=hZSw4sLThHODmpUvjnOlg3ofqTMejWjJPxzuqMeKy9s3g6gKpr60p+wJ
 AQrZ2dWmVfR6L8km/E755LFrHu4p1HCqB50LG5q4PwqpmlhfQOIriF5hc
 Fpu5fAp7bGhSq+X9CVHbYNrlbKI+B2GWkS23ipDClT0CVReryC2qtRrZ+
 sQOoFfPdN5YQOZH6MpwSc09axFUOACthnIXjLcUGuP6MmTZXgoQ8GNVop
 wziLX4sN1vwS/fy4G1HDtBzZudHvImV9UoVoalE7bhGqBxVQ5ZyH3vZhN
 iSitrJII37HiYbEtEMD9moCXUzV9EVlERvf6lXkvEkg+xns/cUSYddupy A==;
X-CSE-ConnectionGUID: LCn3Vmj5TwOrbKkvC/n3mg==
X-CSE-MsgGUID: FtmL4nR3Rji6cti3QulG6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="64250007"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="64250007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 07:43:21 -0700
X-CSE-ConnectionGUID: CO0ibhC5RJCkaXZ/1Bz6yw==
X-CSE-MsgGUID: bjvKkKOYQEOqSoGj8k9hHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175062322"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 07:43:19 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_setmode: simplify mode selection by
 removing goto
Date: Wed, 17 Sep 2025 20:13:07 +0530
Message-ID: <20250917144308.1355953-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917144308.1355953-1-jeevan.b@intel.com>
References: <20250917144308.1355953-1-jeevan.b@intel.com>
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

replaced 'goto found' with early returns in get_mode_for_crtc() and
added braces around the fallback loop. This makes the logic cleaner
and easier to follow without changing behavior.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 484c3a95f..49fc45043 100644
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
@@ -258,11 +262,10 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 	 * scaling etc.
 	 */
 	mode = &crtc->cconfs[0].default_mode;
-	for (i = 1; i < crtc->connector_count; i++)
+	for (i = 1; i < crtc->connector_count; i++) {
 		if (crtc->cconfs[i].default_mode.clock < mode->clock)
 			mode = &crtc->cconfs[i].default_mode;
-found:
-	*mode_ret = *mode;
+	}
 }
 
 static int get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
-- 
2.43.0

