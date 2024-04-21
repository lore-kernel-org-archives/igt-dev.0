Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ACDC07E8F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 09:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A611C10F4E5;
	Mon, 22 Apr 2024 09:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="QWhn9YY1";
	dkim-atps=neutral
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com
 [91.218.175.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E6510E9EB
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Apr 2024 23:32:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1713741772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAdDwzXX3P5SrbR57x50mdY9vR3uK3EuK3J2DEh+S20=;
 b=QWhn9YY1j6PqrnTu1xrNVEQ+WBo4JM/V/xp1vXPn8/xByRBtKFM5l06MTI7nSMner+Sqv3
 OEiOacvzGGYHshWLLd+ovJO2rhYwwxDiXss9Aq+tWWn6xSBTLchrXFAoS0xPg4MU+efuHN
 oRf0yULDR08hOTY790Eg97pZHsgcK2s=
From: Reagan Bohan <reagan@ourmail.work>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <xbjfk.github@gmail.com>
Subject: [PATCH 3/3] Change sys/signal.h to signal.h
Date: Sun, 21 Apr 2024 23:20:48 +0000
Message-ID: <20240421232204.31704-4-reagan@ourmail.work>
In-Reply-To: <20240421232204.31704-1-reagan@ourmail.work>
References: <20240421232204.31704-1-reagan@ourmail.work>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 22 Apr 2024 09:09:36 +0000
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

From: Reagan Bohan <xbjfk.github@gmail.com>

Not only is sys/signal.h non standard, it also:
a) emits a warning on musl libc
b) made the code inconsistent, as some files used signal.h and some
sys/signal.h
---
 tests/intel/gem_exec_await.c           | 2 +-
 tests/intel/gem_exec_balancer.c        | 2 +-
 tests/intel/gem_exec_fence.c           | 2 +-
 tests/intel/gem_exec_latency.c         | 2 +-
 tests/intel/gem_unref_active_buffers.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index fcbca1547..cc976f09d 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -22,8 +22,8 @@
  *
  */
 
+#include <signal.h>
 #include <sys/ioctl.h>
-#include <sys/signal.h>
 
 #include "drmtest.h"
 #include "i915/gem.h"
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 7504f3737..83cc7eea4 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -23,8 +23,8 @@
 
 #include <fcntl.h>
 #include <sched.h>
+#include <signal.h>
 #include <sys/ioctl.h>
-#include <sys/signal.h>
 #include <poll.h>
 
 #include "dmabuf_sync_file.h"
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index 28bad83f6..deff18abc 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -23,8 +23,8 @@
 
 #include <poll.h>
 #include <string.h>
+#include <signal.h>
 #include <sys/ioctl.h>
-#include <sys/signal.h>
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index b9d086afc..b802c2f31 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -30,10 +30,10 @@
 #include <fcntl.h>
 #include <inttypes.h>
 #include <errno.h>
+#include <signal.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
-#include <sys/signal.h>
 #include <time.h>
 #include <sched.h>
 
diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
index f8138c7ac..47f792738 100644
--- a/tests/intel/gem_unref_active_buffers.c
+++ b/tests/intel/gem_unref_active_buffers.c
@@ -34,8 +34,8 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
+#include <signal.h>
 #include <sys/ioctl.h>
-#include <sys/signal.h>
 #include <sys/time.h>
 
 #include "igt.h"
-- 
2.43.2

