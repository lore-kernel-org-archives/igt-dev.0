Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91266CCFA13
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 10:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3A810E16B;
	Thu, 26 Sep 2024 10:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWK9V4dJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9BC10E16B
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 10:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727347805; x=1758883805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rd7sEoDumZR80KTIOhndFGFK7TYWkGzYLGLyDLWKgJo=;
 b=kWK9V4dJml3Q+VA5/PANjMtg6Vjt7DodeZaiLlN9Sg/zpPSaRVTDyW4U
 jHIFuUH6V8ghwkccBsUTSbKPMEN6do6VX1dsJB33Cdzy6kBQS320gn7MF
 XY6LCB2jI5poYu39zCn8C7FWJp9B4CZWQ7GsYU7/waTw+HCxMeRsoV87X
 fl9U6UzkRvw3lZObzC42lgKNLYeN5bZauZ3WHkbc1hZ1TKBw5/V4/J8zu
 37Fgl/5SLTvRLMDr+9mWJ4ln/98HDxdRxnfgf/9S/Jy5D4FLI0wixi+dd
 gN5jrGRisEd9OC9CKoDe7dsso6hzBhlkMIU/L5BUT28g32EMu2RTuU503 A==;
X-CSE-ConnectionGUID: apTv/6/lT3yPsKE2KRdL7A==
X-CSE-MsgGUID: jmD8tXuRRuiSlvswvgWl8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48963139"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="48963139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:50:05 -0700
X-CSE-ConnectionGUID: AxNDmRlcRfeRwXAzlABBXw==
X-CSE-MsgGUID: w8YwwtYaQ0SYhh4YCeJk0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="72909335"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:50:03 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 3/3] lib/xe_eudebug: Warn on pipe timeouts
Date: Thu, 26 Sep 2024 13:39:39 +0300
Message-Id: <20240926103939.550907-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926103939.550907-1-mika.kuoppala@linux.intel.com>
References: <20240926103939.550907-1-mika.kuoppala@linux.intel.com>
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

eudebug test helpers use pipe between debugger/debuggee
communication. If we ever fail even a single pipe read
the whole test framework sync is lost. So if we get a
timeout we should be quite vocal about in instead of
just notifying that the pipe read size was not met.

Further with kernel debugs on, some discovery tests
can starve some of the debugger threads for quite
a long time so increase the default timeout value.

Future improvement could be to parametrize the
timeout value so that simple tests with quite
deterministic runtime could specify a shorter
timeout.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 43 +++++++++++++++++++++++++++++--------------
 lib/xe/xe_eudebug.h |  2 +-
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2c7cd2ae1..da93e9785 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -47,6 +47,23 @@ struct match_dto {
 #define CLIENT_STAGE 5
 #define DEBUGGER_STAGE 6
 
+static const char *token_to_str(uint64_t token)
+{
+	static const char *s[] = {
+		"client pid",
+		"client run",
+		"client fini",
+		"client stop",
+		"client stage",
+		"debugger stage",
+	};
+
+	if (token >= ARRAY_SIZE(s))
+		return "unknown";
+
+	return s[token];
+}
+
 static const char *type_to_str(unsigned int type)
 {
 	switch (type) {
@@ -248,18 +265,7 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 	if (ret > 0)
 		return read(pipe[0], buf, nbytes);
 
-	return 0;
-}
-
-static uint64_t pipe_read(int pipe[2], int timeout_ms)
-{
-	uint64_t in;
-	uint64_t ret;
-
-	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
-	igt_assert(ret == sizeof(in));
-
-	return in;
+	return -ETIMEDOUT;
 }
 
 static void pipe_signal(int pipe[2], uint64_t token)
@@ -279,12 +285,21 @@ static void pipe_close(int pipe[2])
 static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 {
 	uint64_t in;
+	int ret;
 
-	in = pipe_read(pipe, timeout_ms);
+	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
+	igt_assert_f(ret > 0,
+		     "Pipe read timeout waiting for token '%s:(%ld)'\n",
+		     token_to_str(token), token);
 
 	igt_assert_eq(in, token);
 
-	return pipe_read(pipe, timeout_ms);
+	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
+	igt_assert_f(ret > 0,
+		     "Pipe read timeout waiting for token '%s:(%ld)'\n",
+		     token_to_str(token), token);
+
+	return in;
 }
 
 static uint64_t client_wait_token(struct xe_eudebug_client *c, const uint64_t token)
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 29ab68fee..6e4666333 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -112,7 +112,7 @@ typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
  * Default abort timeout to use across xe_eudebug lib and tests if no specific
  * timeout value is required.
  */
-#define XE_EUDEBUG_DEFAULT_TIMEOUT_SEC		25ULL
+#define XE_EUDEBUG_DEFAULT_TIMEOUT_SEC		60ULL
 
 #define XE_EUDEBUG_FILTER_EVENT_NONE		BIT(DRM_XE_EUDEBUG_EVENT_NONE)
 #define XE_EUDEBUG_FILTER_EVENT_READ		BIT(DRM_XE_EUDEBUG_EVENT_READ)
-- 
2.34.1

