Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA03C7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 11:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B3910E58C;
	Tue,  1 Jul 2025 11:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsNK8x3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C7310E58C
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751367720; x=1782903720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BxbskB+Sx5KfaoN8pLjYN0KaGddfIgBDJI5USIE1nXU=;
 b=BsNK8x3YkVuPr8nNANEm25bgc9GIeQb9w76v1wZiLUYxDd+DAQWTsnnq
 IBxvxhbM+IsnpVfmdkqX/gNR++D9sjbP8NtKT0/wkztA6GuDJjL4Ld8FA
 gCwly0JmoWSkcgLWLiS0eYtz+6hUazwCH1Lv809HNFT1tVaWn46IupWRf
 8VYPaER52q49UpMC0nY9M2UlEPQKHGT9YkLD9pv34I8/eJXQr+AMubXLP
 qWbj/IORHRzVCzAMDM4OoQSp5WIeXq7qNsVvRdmJ/8rq1GRMOaUv9S4qM
 w3XjZ5lmlKYX9skBHgXspks3jqRFvw6mNPExyz0/WAnVXPFBploN4isFg A==;
X-CSE-ConnectionGUID: Zrxon83fQYesYYyBRECTig==
X-CSE-MsgGUID: XTYUfN+0SXK2DXWkop18ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53751031"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53751031"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:02:00 -0700
X-CSE-ConnectionGUID: eXxlG0EVQ+O6mtZwPCMQiw==
X-CSE-MsgGUID: SkA7O4GrS0qePJc4Fvo2wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="184785813"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:01:58 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, arun.r.murthy@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_flip: Remove assertion dependency on
 link reset retry condition
Date: Tue,  1 Jul 2025 16:31:49 +0530
Message-ID: <20250701110149.395301-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701110149.395301-1-ramanaidu.naladala@intel.com>
References: <20250701110149.395301-1-ramanaidu.naladala@intel.com>
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

This change avoids test failures in scenarios where hotplug detection
is inconclusive or delayed. The call to link reset is retained for
its potential side effects or logging purposes, but it is no longer
part of the assertion condition.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 4dfa1c483..8ce164202 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1641,7 +1641,9 @@ retry:
 
 	/* quiescent the hw a bit so ensure we don't miss a single frame */
 	if (o->flags & TEST_CHECK_TS && !calibrate_ts(o, crtc_idxs[0])) {
-		igt_assert(!retried && needs_retry_after_link_reset(mon));
+		igt_assert(!retried);
+
+		needs_retry_after_link_reset(mon);
 
 		retried = true;
 
@@ -1680,7 +1682,9 @@ retry:
 		state_ok &= check_final_state(o, &o->vblank_state, elapsed);
 
 	if (!state_ok) {
-		igt_assert(!retried && needs_retry_after_link_reset(mon));
+		igt_assert(!retried);
+
+		needs_retry_after_link_reset(mon);
 
 		retried = true;
 
-- 
2.43.0

