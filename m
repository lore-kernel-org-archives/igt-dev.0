Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DF6C021A6
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D8510E299;
	Mon, 24 Feb 2025 13:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfR5bjSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8E510E057
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740402511; x=1771938511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QzTrb2hU+7aq3zYUQDoZUq/Wdyw8UxmtE4DNdIVWU3M=;
 b=NfR5bjSSLj1h6aPGKPIbOUv2d5I9qD0Bp6n0th3xP9ihJQvrNifj+1ZP
 W9SCQTX5NvlCulmi2mLkzQWEQ/3/wa7gCB/IM7ZCpXJWtJwMIacbmzNfp
 Fesgmzpm6z/cDvjwWSiK4cydY9L4ZKNOa00Fe/Dv3rHag+hf4DTbF0ksz
 tlrEzxiN41wfM64uP/9zFJeT68v6Vo1+YrXq/rx8GSfTgZ5JTszicWTfh
 Kolyle/zoZqE7ZTmQHIys07+m2OnadX/3LOJGFy6eDmvpTx3yGIs4YJjO
 8U9M/IKatyVTIzUvf9XTjxPRXe4aV+Zj3rM33EMUEFi/RyZ0yucCZIgms A==;
X-CSE-ConnectionGUID: B6LXrtfTSHKt3vwWaCfpFw==
X-CSE-MsgGUID: U1IackHPTHeNKBhFych/Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51783823"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51783823"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:08:31 -0800
X-CSE-ConnectionGUID: dbocw8jISNeUXyp71Y7OYA==
X-CSE-MsgGUID: IZYyzNH8QZaG9ufcSaaYrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153251850"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:08:29 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 2/3] lib/eudebug: Fix xe_eudebug_client_stop corner case
Date: Mon, 24 Feb 2025 14:08:06 +0100
Message-Id: <20250224130807.9249-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224130807.9249-1-dominik.karol.piatkowski@intel.com>
References: <20250224130807.9249-1-dominik.karol.piatkowski@intel.com>
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

After `token_signal(c->p_in, CLIENT_STOP, c->pid)`, the client is
expected to end its work and exit. By the time the waitpid() is called,
the client process may be gone already, resulting in a failed assert.

Fix it by skipping the assert in case of errno being ECHILD, meaning
the process already exited.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index ad8bdf68a..58acb1dea 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1450,12 +1450,16 @@ void xe_eudebug_client_stop(struct xe_eudebug_client *c)
 {
 	if (c->pid) {
 		int waitstatus;
+		int ret;
 
 		xe_eudebug_client_wait_done(c);
 
 		token_signal(c->p_in, CLIENT_STOP, c->pid);
-		igt_assert_eq(waitpid(c->pid, &waitstatus, 0),
-			      c->pid);
+		ret = waitpid(c->pid, &waitstatus, 0);
+		/* process may be gone already */
+		if (!(ret == -1 && errno == ECHILD))
+			igt_assert_eq(ret, c->pid);
+
 		c->pid = 0;
 	}
 }
-- 
2.34.1

