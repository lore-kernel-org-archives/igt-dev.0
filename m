Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450E2CA1013
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 03:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E877910E928;
	Fri, 19 Sep 2025 03:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VedeAEMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F0810E928
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 03:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758251872; x=1789787872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Lrgc1hp6d15PQembdDMz0RhLVsNLcIXwbaSGChd4kA=;
 b=VedeAEMFVneMo/MzxBMsXsOqXIFisYMUBjy+klnDAiemrWsrQGCQxkeM
 DvmjND3uS9p+FHk+l3aJga7YyENACc9vxOr5HSF3uKyKGGjPIJ/quB8kb
 FGHwj1fJtZ8MA1AYWGqKP+RQ9+BPRcFlDgDXGDsCMmqv0MSHRsUa7MxpX
 VYwX44lG+I475wJWQvRoJnR/Ih/0OL1fB46CIvE74EhHZ5P971Ggsp+OD
 ySro42ZmzrjTK0aNmZMfNJKxb9kEUMJoGZyt7d1vn0xO9TuZKAQrNbtAW
 efrSUou9YmMjaqS5nWbdFd0KM1pekzrJUfugfUe8QWDSLc5SPfp5035gX g==;
X-CSE-ConnectionGUID: Q/HyzoEnTlevwl9RMKKO2A==
X-CSE-MsgGUID: mbOEYw5/SbG8Vc/oUgsBfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60526898"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="60526898"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 20:17:52 -0700
X-CSE-ConnectionGUID: lFM1yufRSjqRubl/z5rzOg==
X-CSE-MsgGUID: aqajKKWVQZGVuYTToabwmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="179988708"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 20:17:50 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_setmode: simplify mode selection by
 removing goto
Date: Fri, 19 Sep 2025 08:47:35 +0530
Message-ID: <20250919031736.1362484-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919031736.1362484-1-jeevan.b@intel.com>
References: <20250919031736.1362484-1-jeevan.b@intel.com>
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

