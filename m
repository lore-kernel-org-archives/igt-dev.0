Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAB2CD043A
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 05:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEF510E416;
	Tue,  6 Jan 2026 05:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqf/gSDH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C7310E37D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 05:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767677537; x=1799213537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=glYfjXwrdGVFWK7sh+zoVfSJLnffqkiZ1BUbUgyVvvY=;
 b=mqf/gSDHz3UjOcMFxZgqyHAfysHh5k+NgwmOQUdrlUpOI1TUBKboxZ7E
 bvxz6SMzssVhq1TPkVMW/fiWG0oAHmyw1ib/mqMqNSmuzNELijRP5KSm6
 QvgCOGsKCenmqzEaYh9o4TgXhZrjxMWLODZecZ8L1Sj6KXIUsRIweyUK/
 tKt9zu0Kk5HmCeX3bLIXLkEkR86aXK0FjW4ZfSq6+9yIqzxzadZCm+pE6
 V0SrcXiFCZTiLnHtGJ+SqU1ZvfF1DpmAHlN3w41bKkiSupKisk+34UPw2
 z3HY1czT1XmJmH84+Ewfpg5tkanP/Iu43fLBtAVDeXA+EIVWVYE/bFLeR g==;
X-CSE-ConnectionGUID: rGrpq4Y9RgyGf3zrmWqXew==
X-CSE-MsgGUID: tJZj4Z3HRt6A7JhJhj2cOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71621983"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="71621983"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 21:32:17 -0800
X-CSE-ConnectionGUID: xqPN6TLMSP6HBXHfFrUGlw==
X-CSE-MsgGUID: X0noYRs6RMGPQISWC0NHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201707732"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 21:32:15 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/igt_psr: Fix selective fetch detection to
 check sink support
Date: Tue,  6 Jan 2026 11:00:01 +0530
Message-Id: <20260106053002.104612-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106053002.104612-1-santhosh.reddy.guddati@intel.com>
References: <20260106053002.104612-1-santhosh.reddy.guddati@intel.com>
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

The i915_psr2_selective_fetch_check() is failing to detect PSR2/Panel
Replay selective fetch capability during test execution, causing tests
like kms_async_flips cursor subtests to run when they should skip.

During test initialization, PSR gets disabled because of display commits.
When disabled, debugfs shows "PSR mode: disabled" without the
"PSR2 selective fetch: enabled" line that the code was checking for.

However, the sink capability is always present in the debugfs output:
  Sink support: Panel Replay Selective Update = yes

Fix selective_fetch_check() to also check for "Panel Replay Selective
Update = yes" in addition to "PSR2 selective fetch: enabled". This
ensures tests correctly skip on PSR2 selective fetch capable panels
regardless of PSR's current enabled/disabled state.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_psr.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 7e50c3dc6..1504ef110 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -50,7 +50,14 @@ bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
 	igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				sizeof(buf));
 
-	return strstr(buf, "PSR2 selective fetch: enabled");
+	/*
+	 * Check if selective fetch is currently enabled OR if sink supports it.
+	 * When PSR is disabled during test init, we won't see "PSR2 selective fetch: enabled"
+	 * but we still need to skip tests that are incompatible with selective fetch
+	 * if the sink supports it.
+	 */
+	return strstr(buf, "PSR2 selective fetch: enabled") ||
+	       strstr(buf, "Panel Replay Selective Update = yes");
 }
 static bool psr_active_sink_check(int debugfs_fd, igt_output_t *output)
 {
-- 
2.34.1

