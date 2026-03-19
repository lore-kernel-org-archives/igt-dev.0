Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710D31091926
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 21:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C28110E15A;
	Thu, 19 Mar 2026 21:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Us/iDruc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D3710E95B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 21:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773957097; x=1805493097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SL25OMw9PhzWoNQgwEVb7ZMasy5HQEaAtq37Eby3KJw=;
 b=Us/iDrucEbVLZFXqtKtoPK1i1SuKosvSBmrPZLspvKMlxwZA2R2M8pKc
 sXIFzNgAB0ouS3vw2/yBm+DCTVB6j6KRh1Dra5Jid3GMH1nutGwk/9eVF
 ks70EGV4n/K7Iher3hyZGt4toj1G7LD6UWZP53AEPlg8jtLr6pGIT5I3o
 UAQCXnrz3rEMjogIOXgWTiaukvDfRLIgkTXnX/DhdmaYzJb7kzCXB4aYh
 7wNZs1Ju8dZqc+AlSrxdBK5M3ppFJ+mgbh+4y1pECTwYQcwaY8zThQ2Wg
 YXxMphDqhkM/veEJ0Epgo8W1Nhn2D1YIt4rujxPiJTvFaDSj/Tm4kV+n+ w==;
X-CSE-ConnectionGUID: cH2occA3QqueTbH6JXZvCg==
X-CSE-MsgGUID: g/WJRgbHT1q9ws/sG0MdVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75010854"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75010854"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:51:37 -0700
X-CSE-ConnectionGUID: k7CPIoCOT3C32urghhTL7g==
X-CSE-MsgGUID: ZMBVbvCfSdWzKRMMIC8PYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253576841"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:51:35 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t 1/4] runner: Rename dirfd to avoid clash with dirfd()
Date: Thu, 19 Mar 2026 22:51:26 +0100
Message-ID: <20260319215124.2066611-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
References: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
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

Upcoming change within execute_next_entry() will call dirfd() so
rename local dirfd variable is necessary.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/executor.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 847abe481a..885a38a99f 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1772,7 +1772,7 @@ static int execute_next_entry(struct execute_state *state,
 			      char **abortreason,
 			      bool *abort_already_written)
 {
-	int dirfd;
+	int ddirfd;
 	int outputs[_F_LAST];
 	int kmsgfd;
 	int outpipe[2] = { -1, -1 };
@@ -1786,19 +1786,19 @@ static int execute_next_entry(struct execute_state *state,
 
 	snprintf(name, sizeof(name), "%zd", idx);
 	mkdirat(resdirfd, name, 0777);
-	if ((dirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
+	if ((ddirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
 		errf("Error accessing individual test result directory\n");
 		return -1;
 	}
 
-	if (!open_output_files(dirfd, outputs, true)) {
+	if (!open_output_files(ddirfd, outputs, true)) {
 		errf("Error opening output files\n");
 		result = -1;
 		goto out_dirfd;
 	}
 
 	if (settings->sync) {
-		fsync(dirfd);
+		fsync(ddirfd);
 		fsync(resdirfd);
 	}
 
@@ -1900,8 +1900,8 @@ out_pipe:
 	close_outputs(outputs);
 out_dirfd:
 	if (settings->sync)
-		fsync(dirfd);
-	close(dirfd);
+		fsync(ddirfd);
+	close(ddirfd);
 	if (settings->sync)
 		fsync(resdirfd);
 
-- 
2.43.0

