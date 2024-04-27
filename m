Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE68C4345F
	for <igt-dev@archiver.kernel.org>; Sat, 27 Apr 2024 11:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4C410E623;
	Sat, 27 Apr 2024 11:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="FxbZYnj4";
	dkim-atps=neutral
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF5310E623
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Apr 2024 11:27:28 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1714217247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SnVWMlEYzg87SwkgxYJgCGa3Klg8hghC2R1GYB2n54=;
 b=FxbZYnj4pRmOMz9IFyqp4Bh3cvoBmNbewDdh+c5a/n/m/3YZpoNFbqCwc4yZe6+putzCE1
 QtFUrwFQVadBJb9advSUB75FGxRxLv7pL+UU/fyvYtoFzH85Z1lJtszm7BApd5E8FnO7vH
 6veC1sk5+BwX0DlQ98yl1nS1NPOkTrM=
From: Reagan Bohan <reagan@ourmail.work>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <reagan@ourmail.work>
Subject: [PATCH i-g-t v2 3/7] benchmarks: use poll.h in includes
Date: Sat, 27 Apr 2024 11:18:41 +0000
Message-ID: <20240427112045.10987-4-reagan@ourmail.work>
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
 benchmarks/gem_busy.c    | 2 +-
 benchmarks/gem_latency.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
index 514e3387e..95d0fb971 100644
--- a/benchmarks/gem_busy.c
+++ b/benchmarks/gem_busy.c
@@ -33,8 +33,8 @@
 #include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
+#include <poll.h>
 #include <sys/stat.h>
-#include <sys/poll.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <time.h>
diff --git a/benchmarks/gem_latency.c b/benchmarks/gem_latency.c
index 6abf366f9..d3ebab005 100644
--- a/benchmarks/gem_latency.c
+++ b/benchmarks/gem_latency.c
@@ -36,10 +36,10 @@
 #include <inttypes.h>
 #include <limits.h>
 #include <errno.h>
+#include <poll.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
-#include <sys/poll.h>
 #include <sys/resource.h>
 
 #include "drm.h"
-- 
2.43.2

