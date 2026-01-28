Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D75D3569C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 10:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808C010E635;
	Wed, 28 Jan 2026 10:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZyTj05Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137FB10E635
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769595183; x=1801131183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9+v8Hhz5XdJdqiY4xC4nm0H95emNEYA6gTI78cS8BCQ=;
 b=aZyTj05Zn7Wim8TJe43IhhEjZ3k8V+aE/lJESyjBxcMHn8BkPrKwMoKd
 2YblmjraNz+vYd/ycIpgb/wTr4WB392IsUIQM/Z88UXUyqTAb0+uuWAON
 4bRKLqIMh7En9AGZMcqzsXWM/q2wS2BxWGVEA32Ra3MSIghPcCss2Pbec
 fqtJYtgV0SBT2Tvoc5XvZpWhLP09J93hdTGHMi7zxQMkqgqhQmlgIJyYJ
 ijKuAEtXpUCewjiv1FlQw06yLDNXmarVVNxuoDk75E/hXG4+Rj0FE7ZpN
 udWVfaMsudxeJ3V35E1R8fha7gUf8NzQNx+5JAE8Taa6TzbT+xMuHIVKy Q==;
X-CSE-ConnectionGUID: DdI12z62Sg+DoZdKyGlWjQ==
X-CSE-MsgGUID: oiO2W7GySuCK7t8YkzdC+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="96264756"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="96264756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 02:13:03 -0800
X-CSE-ConnectionGUID: H5vof64aSeC3J+dMpQHneA==
X-CSE-MsgGUID: F09CRlPcT+WhmV26UN79wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207362684"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 02:13:01 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
 Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/xe: xe_eudebug - Add pipe validation and
 cleanup improvements
Date: Wed, 28 Jan 2026 11:15:14 +0100
Message-ID: <20260128101529.401653-5-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128101529.401653-4-piotr.rudnicki@intel.com>
References: <20260128101529.401653-4-piotr.rudnicki@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add pipe validation in pipe_signal() to prevent writes to closed pipes.
Update pipe_close() to set descriptors to -1 after closing to ensure
the guard condition works correctly.

Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
V1 -> V2: Split into separate library and test commits

 lib/xe/xe_eudebug.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2abee7ba2..2387b74f8 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -304,16 +304,22 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 
 static void pipe_signal(int pipe[2], uint64_t token)
 {
-	igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
+	/* Skip signaling if pipe was already closed */
+	if (pipe[1] >= 0)
+		igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
 }
 
 static void pipe_close(int pipe[2])
 {
-	if (pipe[0] != -1)
-		close(pipe[0]);
+	if (pipe[0] >= 0) {
+		igt_assert_eq(close(pipe[0]), 0);
+		pipe[0] = -1;
+	}
 
-	if (pipe[1] != -1)
-		close(pipe[1]);
+	if (pipe[1] >= 0) {
+		igt_assert_eq(close(pipe[1]), 0);
+		pipe[1] = -1;
+	}
 }
 
 #define DEAD_CLIENT 0xccccdead
-- 
2.43.0

