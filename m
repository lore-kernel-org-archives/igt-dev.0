Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D60BCA5FE2
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 13:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7DB10E38E;
	Fri,  2 Oct 2026 13:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXqhJ9cy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CDF10E38E
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 13:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790946332; x=1822482332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7nhYHT4hFXPkLUKW4THNHXnvJMqD0uvHUUD6DR7h8mE=;
 b=JXqhJ9cyRWw94vWbCOUECrX7GKs+1YHKyfGFVF0S1dGOlt05hgG4SNy3
 0zubS+m5odISGidnXMAYuYN0D5GZkPXSyxB7um+6NfMiy+pRUeqNoHXLY
 rt+dRnYxbGOS/rUWvKipcdzhv9rhgXVw1Kllq6PPhRpAtw3us7geAJekg
 FAlIIglxuitpbswaZfYYmX78/4fdnzeWjJ67GbGVml05HIIiuv0qGpljf
 LNaMUr/XkmK25e4/fFL+88mRamgTRvQb15vDukJy9K+olBCingT4vhzKd
 6KfZ94kgDHd8CG4BrwVjnObd4rBqiJ+cJRao2e9PkU4a0IeX2+zlRAxIq A==;
X-CSE-ConnectionGUID: NXkyaRJLRkyEO2Zdo3FiqA==
X-CSE-MsgGUID: lPiSPRFGRMSK5m4KnbAYQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102233423"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="102233423"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 06:05:32 -0700
X-CSE-ConnectionGUID: D2KTTNxQTuKxmXRFOlD9WA==
X-CSE-MsgGUID: 0A4+DCdYTKmvin9no/RqXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="274891656"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.244])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 06:05:30 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v1] runner/executor: Fix writing endtime
Date: Fri,  2 Oct 2026 15:05:22 +0200
Message-ID: <20261002130522.42708-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

When option --save-results-after-each-test is set, file
endtime.txt is rewritten with current time, but O_EXCL option
will make open fail and this in turn prevent creating partial
results.json with already executed tests, except the very first
test. Fix it and use O_TRUNC instead.

Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Fixes: 8d3284b5ae16 ("runner: Create results after each tests end")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index bbe011cbc..8103c2a52 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -2480,7 +2480,7 @@ static int open_comms_if_valid(int resdirfd, size_t testidx)
 
 static int write_endtime(int resdirfd, double a_time)
 {
-	int timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666);
+	int timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_TRUNC, 0666);
 
 	if (timefd >= 0) {
 		dprintf(timefd, "%f\n", a_time);
-- 
2.55.0

