Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1EBF89251
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 11:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE9610E1A1;
	Tue, 21 Apr 2026 11:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMZ1kTvt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC7310E1A1
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 11:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776770239; x=1808306239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8lVw1dGDUi6oNUn6Q5SjDjBIaECMwNeA/Tojlg8sfw8=;
 b=kMZ1kTvtUbUpqhVh3FKbLq48tF9gq7rDbtTTNRZdk6tPfJgrOqdpoe27
 bwNiCR7jYVueXmWpCG0VpNAXQx3wKxFGKSgrRW6bn7kPG5sKiRT6HEjSy
 qpyNm7/2YeM6iknpaPzqdBw9gFxGQVRdenXHjG/UjNhyMbD171xONh++G
 p3Xn+FNb/GosYyap/JmczJYI78Qq5jyLLqIwVwIxEZblvOVcIz0lywCwA
 YoCLgYZZToIVPuXyl5RhiozBes9TzNwxq+7x0ZOEI3gQwwjnonckykpwT
 cQH3nLpGdOQomnAVsDmDZ5tOCL7W+g/hbxRpySF3eMms5pyQYEtNYWfc0 g==;
X-CSE-ConnectionGUID: 3wIkKgDzRfC1TfTV6z6YNw==
X-CSE-MsgGUID: pv3Uq2olRQWEVpSjfVyR2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77401516"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="77401516"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:17:19 -0700
X-CSE-ConnectionGUID: 70GOKhmTRja7JM+7HF8PlA==
X-CSE-MsgGUID: Y0ueYbUSSRm4LFzH+maD4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="229340691"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:17:17 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t 1/4] runner: Rename dirfd to avoid clash with dirfd()
Date: Tue, 21 Apr 2026 13:17:11 +0200
Message-ID: <20260421111709.3163253-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
References: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
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
2.43.0

