Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9199BC4345F
	for <igt-dev@archiver.kernel.org>; Sat, 27 Apr 2024 11:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2979310E5F2;
	Sat, 27 Apr 2024 11:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="Ec+9r+AQ";
	dkim-atps=neutral
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68CE10E5F2
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Apr 2024 11:27:37 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1714217255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gs+8Ex+CPDRrjQ8BVdBgaXKDawt4bceCGPsrmcJWo7o=;
 b=Ec+9r+AQaqQ+ijzqAI3Db96XPE/Kwx8I6fLJUVfK0N/c0VYjVzmbhysNxLs3LEYBqiHvNq
 cCHhTPrjgQvgdNMe/xdrvXf4TPags51oqq9A+KyNHt66IbvELEPE+sBR5ZpZltyaAuLgpO
 Z2VUCjbWyg1kLUEuCRi4Idj8mIgI2wI=
From: Reagan Bohan <reagan@ourmail.work>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <reagan@ourmail.work>
Subject: [PATCH i-g-t v2 4/7] runner: use poll.h in includes
Date: Sat, 27 Apr 2024 11:18:42 +0000
Message-ID: <20240427112045.10987-5-reagan@ourmail.work>
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
 runner/executor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index d3e6296dd..4b374d223 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -16,7 +16,6 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <sys/select.h>
-#include <sys/poll.h>
 #include <sys/signalfd.h>
 #include <sys/socket.h>
 #include <sys/stat.h>
@@ -25,6 +24,7 @@
 #include <sys/utsname.h>
 #include <sys/wait.h>
 #include <dirent.h>
+#include <poll.h>
 #include <time.h>
 #include <unistd.h>
 
-- 
2.43.2

