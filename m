Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22662CD6E4C
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 07:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7320112F29;
	Mon,  1 Jun 2026 07:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBvgOdYr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B21112F20
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780300315; x=1811836315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OYrqRi8kufg7D3ooIf6cbuDepYH3FPWLDk/mYrlGyT4=;
 b=TBvgOdYrUojBNhyALnCbu6SGGiUpD8Sf3liPmF6Xt5CsiXw/Hm9JkmJ5
 l6WVZLnwmeYTsdEQeKwA9fcpZwkL0sSnTD/M9HckLsEbZkx/gPKaeRkLb
 bAdLVFeRxBsBFmViZdjis9FLx5R6XbyY9sOmr/bSDs45e6SzlYNJSJVgw
 vyDoBJ8AzAl4jP8DTeATFhKEkb2Z5aqHrMTViLGkIMtnyCfYMm4x8IHOY
 b+6Z4yExChQLfr26bQqfBnVTSHih9nL8LSZeWySDBPtt+qMNWcJQ9gNwh
 0SucyNyFwz7LMWDTnOCONC3jcRABWiMa1JkVN2+bp9jZYJC68+d6bgJkN w==;
X-CSE-ConnectionGUID: SlDmK5dNQ8abTw46MXSpew==
X-CSE-MsgGUID: 9G4me7HWRbyFYXfGnG+G8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="98618997"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="98618997"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 00:51:54 -0700
X-CSE-ConnectionGUID: dn6oXoOgTaqfyCgDEMqLaQ==
X-CSE-MsgGUID: baLuHqKsTP2kuY8sh+to2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243331944"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 00:51:53 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3 1/4] runner: Rename dirfd to avoid clash with dirfd()
Date: Mon,  1 Jun 2026 09:51:45 +0200
Message-ID: <20260601075143.187633-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601075143.187633-6-zbigniew.kempczynski@intel.com>
References: <20260601075143.187633-6-zbigniew.kempczynski@intel.com>
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

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 runner/executor.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 847abe481a..1485b59d1f 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1772,7 +1772,7 @@ static int execute_next_entry(struct execute_state *state,
 			      char **abortreason,
 			      bool *abort_already_written)
 {
-	int dirfd;
+	int idirfd;
 	int outputs[_F_LAST];
 	int kmsgfd;
 	int outpipe[2] = { -1, -1 };
@@ -1786,19 +1786,19 @@ static int execute_next_entry(struct execute_state *state,
 
 	snprintf(name, sizeof(name), "%zd", idx);
 	mkdirat(resdirfd, name, 0777);
-	if ((dirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
+	if ((idirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
 		errf("Error accessing individual test result directory\n");
 		return -1;
 	}
 
-	if (!open_output_files(dirfd, outputs, true)) {
+	if (!open_output_files(idirfd, outputs, true)) {
 		errf("Error opening output files\n");
 		result = -1;
 		goto out_dirfd;
 	}
 
 	if (settings->sync) {
-		fsync(dirfd);
+		fsync(idirfd);
 		fsync(resdirfd);
 	}
 
@@ -1900,8 +1900,8 @@ out_pipe:
 	close_outputs(outputs);
 out_dirfd:
 	if (settings->sync)
-		fsync(dirfd);
-	close(dirfd);
+		fsync(idirfd);
+	close(idirfd);
 	if (settings->sync)
 		fsync(resdirfd);
 
-- 
2.54.0

