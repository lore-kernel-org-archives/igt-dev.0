Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D69103A9AD
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 11:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A215F10E89A;
	Wed, 25 Mar 2026 11:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeBmX2xs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F9410E89A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774439033; x=1805975033;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OpLqqW8QlkYz6+e+lzjAkFvaBrm8Ki0r/ODwRz4If1c=;
 b=aeBmX2xs0W6hDQtcu1jyp8KRnIZBAQIDoQXgiJnsGa5H9jBY/r7Y+t7m
 EChElyo/35NaAbnsl4uV4sHWY9HHxYszaigpfIScUL0Xx0Y1ch2zvp0EY
 +NsHyMJ3nLOfBGzg7QdWqMX5eCmGTpMyeNEDdFIyhLalechVurNfd6lTe
 dFdFfIK8b4wuJfESR9bw5ZZvTYEsR8KtcepBcjPCwTwrlcqaP4Fs78qRJ
 9R9+xoDo2r2xOcTgHf0gGqbFxYC/xszgaIbIvF/L5/2RA7hq64E/2+1eA
 B/kiWlWoSRS/kBa1XWWlMa6wqNuFY77TLDbVKYARjfYEbHgfn+PwojW6o Q==;
X-CSE-ConnectionGUID: 9Idn2PgBQF2+Obvwrx6bpQ==
X-CSE-MsgGUID: +5t+eDuqQwKjeLcWnI8GkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79379734"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="79379734"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:43:53 -0700
X-CSE-ConnectionGUID: bMaB+Rg4Tg+2okHAHiTuDA==
X-CSE-MsgGUID: sipEvuI9QuenG7ZYAvtdXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="255156093"
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:43:51 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, peter.senna@linux.intel.com,
 piotr.rudnicki@intel.com, Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 1/1] lib/igt_core: flush output on each line
Date: Wed, 25 Mar 2026 12:49:01 +0100
Message-ID: <20260325114901.256229-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.43.0
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

It was found while running tests that if a test launches threads with
even more subthreads, some igt_debug calls might not print their lines.

Fflush after each line to make sure we see everything we want to see.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/igt_core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 65325f08d..ed4f48d86 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3294,10 +3294,8 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 	pthread_mutex_lock(&print_mutex);
 
 	/* use stderr for warning messages and above */
-	if (level >= IGT_LOG_WARN) {
+	if (level >= IGT_LOG_WARN)
 		file = stderr;
-		fflush(stdout);
-	}
 	else
 		file = stdout;
 
@@ -3309,6 +3307,11 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 		_log_line_fprintf(file, "%s%s", thread_id, line);
 	}
 
+	/* Ensure output is flushed explicitly, as concurrent test threads
+	 * may otherwise cause messages to be dropped or reordered.
+	 */
+	fflush(file);
+
 	pthread_mutex_unlock(&print_mutex);
 
 out:
-- 
2.43.0

