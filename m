Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A78CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 09:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA8510E3A5;
	Tue, 14 Oct 2025 09:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZXKUdQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781B210E58C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760434749; x=1791970749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5tdrZh13pRTTNZhQl9Qz5SnF72BHuqQlqzdWCOg3oqs=;
 b=cZXKUdQCq9dtP6asMbU14HT4zzoEXG/HV49TsvN4zkztdEB+5N8KAGJQ
 6PdDqEiv/iwkI/SITR5J6RAPIgolgNfZzssK0wuNSHGo3V2Z/XVytmJ7o
 9Ijwlo18yzBb7+vD2JoXcEnWZR5C1vihoHliBshIXDfBdyO88OxccWOWB
 vtbv55B7ERd53cJIbAUgmohCPPst/TNQAxd25MZjBVIuDMyjbzCqO4Vzj
 9xWhb+JPsP0bz7QkZG1V5xaDRnaFEJZB6KQDTe9gAVlVKLHnZRO2FS9IZ
 jcFK5RL/D4tly1TMWg06xtV+cLeQ4fCwtir2DhAW2wMBSoU7h5RthE5H2 g==;
X-CSE-ConnectionGUID: zahC6psLQXOPQ5kr24ccqg==
X-CSE-MsgGUID: CeBGswWcQTuTemzpCfDYDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73192501"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73192501"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:09 -0700
X-CSE-ConnectionGUID: xHhvSCTdQKKpRL+bPGx/8g==
X-CSE-MsgGUID: 2pSN/uHzRciKHUNDIxQKlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181066486"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:08 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 3/7] lib/xe/xe_eudebug: Improve pipe error messages
Date: Tue, 14 Oct 2025 12:38:44 +0300
Message-ID: <20251014093848.2394531-4-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
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

Client, debugger and session pipe communication
can be hard to debug. Make small improvement to debug output
to print when the actual otherside hung up early
to distinguish from just timeouts.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index f43903f5b0..0989330b39 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -261,7 +261,7 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 {
 	int ret;
 	int t = 0;
-	struct pollfd fd = {
+	struct pollfd r = {
 		.fd = pipe[0],
 		.events = POLLIN,
 		.revents = 0
@@ -273,9 +273,9 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 	do {
 		const int interval_ms = 1000;
 
-		ret = poll(&fd, 1, interval_ms);
-
+		ret = poll(&r, 1, interval_ms);
 		if (!ret) {
+			igt_debug("poll: timeout\n");
 			catch_child_failure();
 			t += interval_ms;
 		} else if (ret == -1) {
@@ -285,10 +285,20 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 			}
 			return -errno;
 		}
-	} while (!ret && t < timeout_ms);
 
-	if (ret > 0)
-		return read(pipe[0], buf, nbytes);
+		if (ret == 1) {
+			if (r.revents == POLLIN)
+				return read(pipe[0], buf, nbytes);
+
+			if (r.revents & ~POLLIN) {
+				igt_debug("pipe read failed: %s%s (0x%x)\n",
+					  r.revents & POLLHUP ? "pipe closed" : "",
+					  r.revents & POLLERR ? "poll error" : "",
+					  r.revents);
+				return -EIO;
+			}
+		}
+	} while (!ret && t < timeout_ms);
 
 	return -ETIMEDOUT;
 }
-- 
2.43.0

