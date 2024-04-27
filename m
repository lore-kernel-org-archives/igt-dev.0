Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D4AC4345F
	for <igt-dev@archiver.kernel.org>; Sat, 27 Apr 2024 11:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF48110F591;
	Sat, 27 Apr 2024 11:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="tWB8bFCE";
	dkim-atps=neutral
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BB110F591
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Apr 2024 11:27:14 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1714217232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Bnq7egnnn0B1dsxe6tNgStlGTlqxi3Djvf5Wnxr+Rw=;
 b=tWB8bFCErMiuK+z/qxv01d1mEE2t3PQKUUK4mdLPxKBh54qXvipQ/kDZZHBCn2tGvon3/s
 G6EpZXeSE3aWEotlcnLts2JJS0SY9RpfyBofsbJ83iaBcT1W/sfbhGxiu1B5Soui7lABqO
 dEP7fGy+iggJbjwXaHPjR9/F6eIcevs=
From: Reagan Bohan <reagan@ourmail.work>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <reagan@ourmail.work>
Subject: [PATCH i-g-t v2 2/7] lib: use poll.h in includes
Date: Sat, 27 Apr 2024 11:18:40 +0000
Message-ID: <20240427112045.10987-3-reagan@ourmail.work>
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
 lib/dmabuf_sync_file.h | 2 +-
 lib/igt_aux.c          | 2 +-
 lib/igt_dummyload.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/dmabuf_sync_file.h b/lib/dmabuf_sync_file.h
index d642ff30c..e115b5f94 100644
--- a/lib/dmabuf_sync_file.h
+++ b/lib/dmabuf_sync_file.h
@@ -9,7 +9,7 @@
 #ifdef __linux__
 #include <linux/dma-buf.h>
 #endif
-#include <sys/poll.h>
+#include <poll.h>
 #include <stdbool.h>
 #include <stdint.h>
 
diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index d6aeb876b..e7210e5be 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -39,10 +39,10 @@
 #include <sys/mman.h>
 #include <signal.h>
 #include <pciaccess.h>
+#include <poll.h>
 #include <stdlib.h>
 #include <time.h>
 #include <unistd.h>
-#include <sys/poll.h>
 #include <sys/wait.h>
 #include <sys/resource.h>
 #include <sys/time.h>
diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 2e842929b..a9a2de077 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -24,8 +24,8 @@
 
 #include <time.h>
 #include <signal.h>
+#include <poll.h>
 #include <pthread.h>
-#include <sys/poll.h>
 #include <sys/timerfd.h>
 
 #include <i915_drm.h>
-- 
2.43.2

