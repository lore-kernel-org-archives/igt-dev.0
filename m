Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9235D3F074
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 14:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F6C10E6E1;
	Wed, 28 Jan 2026 14:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfheb5Z1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA1710E6DF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769611412; x=1801147412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0C3pTuuZ950hXJm0QNG/1OopmL1oB+k2jwLFnyQsE/U=;
 b=dfheb5Z1AlKEj78ZmaKDbb8nVI3+M2wAIIUbxDdvivjnTNilnQL0yWwI
 GHlrQ5wJt8pp1lwboaWxCYqlPqZ2yhiDOWHLIf05X8doe9gpdqdaODZ6l
 jg1B4AC+tFIdSnYFLSaMTbIo2X6WjC6gf2QxSWG+fyXRXRP+rwJDyD8Eq
 alugnM3eNVGUelWVN/rKOvCjackZlExoR7xGvcbxPtCwgrNnuRgn9GCmE
 njKJ4Pkps83ZyjGkmog9P4QjbZUoxjfsDWRgAl7Pung2tLwHCk6rKDa38
 oHJPFZIdd/9oqIN9XbiwTcGiQYBwMO1gRx++YXYUIbJYaLFmx/liOdZVi A==;
X-CSE-ConnectionGUID: CfOYmj3fQPuaeBvKo/qplw==
X-CSE-MsgGUID: Wj646TWbTW2IyzYjaIBEgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93482111"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="93482111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:43:32 -0800
X-CSE-ConnectionGUID: ko4TGR12Sde0ydavQb3Xaw==
X-CSE-MsgGUID: Xv+ugE3jSXCqgYBnj1nhrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207903716"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:43:31 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
 Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/xe_eudebug: Add pipe validation and cleanup
 improvements
Date: Wed, 28 Jan 2026 15:46:28 +0100
Message-ID: <20260128144626.452925-5-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128144626.452925-4-piotr.rudnicki@intel.com>
References: <20260128144626.452925-4-piotr.rudnicki@intel.com>
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
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
V1 -> V2: Split into separate library and test commits
V2 -> V3: Improved commit message

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

