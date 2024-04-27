Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91DCC4345F
	for <igt-dev@archiver.kernel.org>; Sat, 27 Apr 2024 11:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E9610F582;
	Sat, 27 Apr 2024 11:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="adX/NRYf";
	dkim-atps=neutral
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B05510F582
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Apr 2024 11:27:52 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1714217270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcUTMxZCfr7wnvtQ6lvZsbuiZX77ktvnmshH/JGntOE=;
 b=adX/NRYfhFMC2qZiUwl3KYkuY9bYf6lCHz2A28mVY0ahH/kRj6VYqzFu1t6sPY621jAdd0
 yz4x1jehH5mWSb+Fz4vjMJbBIh9Ex+Da7OAtgjoeCPOBbg3g2GRt+Scyirb7BfNp23ti10
 VUKdGF2OeWgP3uXyDvgteMnEMgfROWA=
From: Reagan Bohan <reagan@ourmail.work>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <reagan@ourmail.work>
Subject: [PATCH i-g-t v2 6/7] tools: use poll.h in includes
Date: Sat, 27 Apr 2024 11:18:44 +0000
Message-ID: <20240427112045.10987-7-reagan@ourmail.work>
In-Reply-To: <20240427112045.10987-1-reagan@ourmail.work>
References: <20240421232204.31704-1-reagan@ourmail.work>
 <20240427112045.10987-1-reagan@ourmail.work>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

sys/poll.h is non-standard and including it on musl produces a warning.

Signed-off-by: Reagan Bohan <reagan@ourmail.work>
---
 tools/intel_dp_compliance.c | 2 +-
 tools/intel_guc_logger.c    | 2 +-
 tools/intel_gvtg_test.c     | 2 +-
 tools/msm_dp_compliance.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 2e20d7f09..99196a450 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -113,9 +113,9 @@
 #include <stdint.h>
 #include <stdbool.h>
 #include <strings.h>
+#include <poll.h>
 #include <unistd.h>
 #include <termios.h>
-#include <sys/poll.h>
 #include <sys/time.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 5f1de8db5..629b4e660 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -29,10 +29,10 @@
 #include <sys/ioctl.h>
 #include <string.h>
 #include <errno.h>
+#include <poll.h>
 #include <signal.h>
 #include <stdlib.h>
 #include <unistd.h>
-#include <sys/poll.h>
 #include <sys/wait.h>
 #include <sys/types.h>
 #include <sys/syscall.h>
diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
index ad5ee6a65..408e703bf 100644
--- a/tools/intel_gvtg_test.c
+++ b/tools/intel_gvtg_test.c
@@ -37,9 +37,9 @@
 #include <stdint.h>
 #include <stdbool.h>
 #include <strings.h>
+#include <poll.h>
 #include <unistd.h>
 #include <termios.h>
-#include <sys/poll.h>
 #include <sys/time.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index 6941d3855..c37b3bc1c 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -115,8 +115,8 @@
 #include <stdbool.h>
 #include <strings.h>
 #include <unistd.h>
+#include <poll.h>
 #include <termios.h>
-#include <sys/poll.h>
 #include <sys/time.h>
 #include <sys/ioctl.h>
 #include <sys/types.h>
-- 
2.43.2

