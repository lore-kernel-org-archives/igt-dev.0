Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CD2C28B2E
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DECB10E212;
	Thu, 13 Mar 2025 14:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPhxxvE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410FE10E882
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741870241; x=1773406241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IZpk8NMyWZno7ptacpmDiWYCh5q99ATxk5RPFzG2A30=;
 b=jPhxxvE9H8tPohILgTb/9adQlW9JRaCMVcQSw5BE6sNYGjED6abe6Kyc
 LVF/BI9UUUcg8ZZ63oNsfVvsi0IyhEvowBDTq2+zSFr2qlkXbar6zKzn/
 gGOn/QSNNbr4BNmFO0LZdQ7wtJYFye7gkY1uM66+bPtS4D3CKTvaoLj63
 8Ym4vYgFzFFkxU4TXQ3CaiK2r4zxkQ+RZR5d54z4+K/TvVUi86St19Ego
 wFeEobGlNhSm41Uuskb9cRZfhPv37T7Co10Koiwq3gC8Fg7J6nHP7HU4F
 fSb1OqPGa9Q+DiOr2QMQJYTCscnLl9sx2rL2gRjJlFD1KYP2NeqjV4ckd w==;
X-CSE-ConnectionGUID: LI+58ZrIRD+7uwoi/w0azA==
X-CSE-MsgGUID: CplexNlNQWmNBePM+qDgmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60383840"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="60383840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 05:50:40 -0700
X-CSE-ConnectionGUID: PkNgUMVYQeircnwQIJF62w==
X-CSE-MsgGUID: cNvMH29jT1SMkGog14mt0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="144124729"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 05:50:37 -0700
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Thomas Wood <thomas.wood@intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 1/1] lib/igt_core: capture logs for child processes
Date: Thu, 13 Mar 2025 13:50:04 +0100
Message-Id: <20250313125004.3881354-2-pawel.sikora@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313125004.3881354-1-pawel.sikora@linux.intel.com>
References: <20250313125004.3881354-1-pawel.sikora@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Mar 2025 14:34:31 +0000
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

This change addresses the issue of missing logs for child
processes in the IGT runner.

The '_igt_log_buffer_dump()' function is now called before
exiting child processes, ensuring that logs are properly
captured and not lost when IGT fails and child processes
dump logs before exiting.

Signed-off-by: Pawel Sikora <pawel.sikora@linux.intel.com>
---
 lib/igt_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 9702a9417..33e5ca7cd 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1905,12 +1905,11 @@ void igt_fail(int exitcode)
 		failed_one = true;
 	}
 
-	/* Silent exit, parent will do the yelling. */
+	_igt_log_buffer_dump();
+
 	if (test_child)
 		exit(exitcode);
 
-	_igt_log_buffer_dump();
-
 	if (test_multi_fork_child)
 		exit(exitcode);
 
-- 
2.34.1

