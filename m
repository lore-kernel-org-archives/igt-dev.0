Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88050CDD1AE
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 14:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403EE10EC60;
	Fri, 27 Sep 2024 14:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFQuTph7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D779310EC60
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445838; x=1758981838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vs/dV6NrdvlCp7+Zf1gmwk7M86440i54rLxY1zGElVc=;
 b=oFQuTph7xdeJJp5o7mbtXVmbH07x6+wS7fcRj0ieYf+UKNrADiuYsD1a
 v4ETMlriqwECrmn5YvkLc4U4T4xl+IHCF2TeyNvFK6RYlfGLVgxcLhi7D
 9/mGzZOenPyOlTSW9KcNwjanNK28sVZ14bZKrZ6KzCD7IOB/kKHfUkHJO
 jSVdi1iFkrsUekEHC+f0qplzf6gQprpX0YKYzmQ9FBaZ8s8ycXwvysJm/
 Wllvu6g1ej8x8tlxxqelKNhUYuUcz8/qOJuBZ7F1XB9/i/VQT+DYNjiHJ
 MaKxgGSxP9J7WYAls0xbduN9VNccay/y3Gu53qGVmJU6ngT2Uad4jIysi g==;
X-CSE-ConnectionGUID: aQDDmavnRNeISFxZxI3bmQ==
X-CSE-MsgGUID: wPp5g1H0TSqmCpW3vGalXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30480488"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="30480488"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:03:58 -0700
X-CSE-ConnectionGUID: iOsF0LNCQJCq4T9Cq1kT9w==
X-CSE-MsgGUID: oIaPPUAbRI+o4H88bS6T/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72203123"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:03:57 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 3/4] lib/xe_eudebug: Warn on pipe timeouts
Date: Fri, 27 Sep 2024 16:53:34 +0300
Message-Id: <20240927135335.1107326-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927135335.1107326-1-mika.kuoppala@linux.intel.com>
References: <20240927135335.1107326-1-mika.kuoppala@linux.intel.com>
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

Future improvement could be to parametrize the
timeout value so that simple tests with quite
deterministic runtime could specify a shorter
timeout.

v2: differ token timeout warn from value timeout (Dominik)

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2c7cd2ae1..36763a184 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -47,6 +47,23 @@ struct match_dto {
 #define CLIENT_STAGE 5
 #define DEBUGGER_STAGE 6
 
+static const char *token_to_str(uint64_t token)
+{
+	static const char * const s[] = {
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
+		     "Pipe read timeout waiting for token value '%s:(%ld)'\n",
+		     token_to_str(token), token);
+
+	return in;
 }
 
 static uint64_t client_wait_token(struct xe_eudebug_client *c, const uint64_t token)
-- 
2.34.1

