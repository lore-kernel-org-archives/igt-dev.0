Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C0BF8A144
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 08:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6213B10E1AC;
	Thu, 16 Apr 2026 08:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SztnTxu2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9100310E1AC
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776328423; x=1807864423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=66TMhYeWtws7Ty5tQ6mQNv16uMJO3HrGR2ygV0Dltc4=;
 b=SztnTxu2CdTV7dQlCXePUzRTjwri3eGURqkJmO4/CQbiz+IiEpoR1y5L
 QhshwZiM1hgSAXOQhHCZiOo1M85toIZOn3DviQEF7+Yg6G8o11/R9PCXh
 +TqkJQmUnUp2gofMRDf68qQRDgub9oaYxxftaum0jaQjbivyIGAt4HmSD
 GL/IoaYvY76ZajvICyohB0Mp2QHvZtrviF58n0XXueJ3TfCy8s4NdXty6
 Tc6XwtbhS3kgo4LdkAv/rBEDYh4U/UO4+VkDAfbWgfjbU4rsuW2RPRq47
 Qfw6z14386gNaeXzQJribsq0oQyaN/jfrCgt32BdTR8XtTTS+MYWNz3i4 Q==;
X-CSE-ConnectionGUID: AIDzlxwqSFSnIASMXwzyyw==
X-CSE-MsgGUID: HD8hyitxRwOXHMlVg9OZAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77196643"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77196643"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 01:33:43 -0700
X-CSE-ConnectionGUID: tepl3tGhQLi4kczzl4KD5w==
X-CSE-MsgGUID: rWZCy2pKQHeLCIvP12RvyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229838400"
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 01:33:41 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, peter.senna@linux.intel.com,
 piotr.rudnicki@intel.com, mika.kuoppala@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v2 1/1] lib/igt_core: flush output on each line
Date: Thu, 16 Apr 2026 10:39:10 +0200
Message-ID: <20260416083910.1011732-1-jan.sokolowski@intel.com>
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

v2: Only flushes if no runner is connected as it's not needed otherwise.

---
 lib/igt_core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 65325f08d4..4479201972 100644
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
 
@@ -3309,6 +3307,13 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 		_log_line_fprintf(file, "%s%s", thread_id, line);
 	}
 
+	/* Ensure output is flushed explicitly, as concurrent test threads
+	 * may otherwise cause messages to be dropped or reordered.
+	 * Runner uses sockets so it's not needed there.
+	 */
+	if (!runner_connected())
+		fflush(file);
+
 	pthread_mutex_unlock(&print_mutex);
 
 out:
-- 
2.43.0

