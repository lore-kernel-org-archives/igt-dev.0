Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1096CC10F15
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 09:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6868810F43E;
	Mon, 22 Apr 2024 09:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="DLNZcYTg";
	dkim-atps=neutral
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC33010F401
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Apr 2024 23:32:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1713741759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dsxb/ORKMmjnHBTf2iM16SFJGsdi5stZ+cRlF2wR0g=;
 b=DLNZcYTgGWI7QG0ZP6DO2VdD2nhsZfMTQKh0dw7bdB3ZiIuqFeWj2eX7WQO9jX9+XfCUBZ
 fwVIHDDauEjWNrknXNmsXI82WfUZxEOYskyeXQEDAfem6W11WhM5cSzu6DKfYhwuLqBonM
 Zv9EMNx0x06tAo34DFfm2EL1QKhG7fQ=
From: Reagan Bohan <reagan@ourmail.work>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <xbjfk.github@gmail.com>
Subject: [PATCH 1/3] Define _LARGEFILE64_SOURCE for musl libc
Date: Sun, 21 Apr 2024 23:20:46 +0000
Message-ID: <20240421232204.31704-2-reagan@ourmail.work>
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

---
 lib/i915/gem_engine_topology.c       | 2 ++
 tools/i915-perf/i915_perf_recorder.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index afb576afb..9b8fb85e3 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -21,6 +21,8 @@
  * IN THE SOFTWARE.
  */
 
+#define _LARGEFILE64_SOURCE
+
 #include <fcntl.h>
 #include <sys/stat.h>
 #include <sys/syscall.h>
diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index ca4354832..5e7c233dd 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -20,6 +20,8 @@
  * SOFTWARE.
  */
 
+#define _LARGEFILE64_SOURCE
+
 #include <assert.h>
 #include <dirent.h>
 #include <errno.h>
-- 
2.43.2

