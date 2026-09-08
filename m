Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E450DC79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 05:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8045310E044;
	Tue,  8 Sep 2026 05:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYGSmBtU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F51F10E044
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 05:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788843678; x=1820379678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aoxUiogUJBaCGp0PJ4HL12IalIngmRj90xgTqell1zA=;
 b=GYGSmBtUQbuAWJVqG5Xjy2nQv8dxUg8d6w3SG10eVa8flLR2CtDBX9FR
 KwTpRB8eE/6/Q0MH2WrF5E08q5nJhdQyoK3n3RCsJIHL21LXRQAxtPB+P
 NI7xDdx1I85FYHAqq9lvyznJ5WQI3IOG1S/p4kGt3fLJj0O7vB6+A+Nq0
 cfwcTl04Czp1y6bdPHpjTFcJv5+aW44HzJ7/VYrDcyNRliAG18OC1Ny7i
 knfwJDobjocV9tSBUSYhR2qs6HT2SJDl252Zb7FeEKbVFpujiy6jhrKcz
 EFEISORNyo+TMOhlK3kF1Zs3dxAwvYfs/RIDLlvcRyTpvJePaCCf0na2Y A==;
X-CSE-ConnectionGUID: 7hBsbZRbSn6E25dXBc6JsA==
X-CSE-MsgGUID: qUEXh95rRZS8dIWHGUnIUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89080381"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89080381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 22:01:14 -0700
X-CSE-ConnectionGUID: +pPbs3poR9OQO1b9e/GG+Q==
X-CSE-MsgGUID: LEKyxXEqSz2a85oaIgbQRA==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 22:01:08 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] lib/igt_core: buffer signal-safe log output per line
Date: Tue,  8 Sep 2026 10:31:00 +0530
Message-ID: <20260908050100.4034282-1-jeevan.b@intel.com>
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

xputch() wrote one byte at a time via write(STDERR_FILENO, &c, 1) from
the async-signal-safe backtrace printer. When a fatal signal hits
multiple processes/threads at once (e.g. forked test children all
dumping a backtrace after the same signal), their single-byte writes
interleave on the shared stderr/runner fd, producing garbled or
truncated output. This showed up as tests (e.g.
igt@kms_cursor_legacy@*) being reported as incomplete with no useful
logs.

Buffer output in xputch() and flush it with a single write() (or
log_to_runner_sig_safe() call) per line via a new xflush(), instead of
one syscall per character. xprintfmt() now also flushes on reaching
the end of the format string, so a trailing partial line without a
newline is still emitted.

The buffer is thread-local (__thread) so concurrent threads of the
same process don't race on it; plain TLS access remains
async-signal-safe, unlike a lock.

v2: Make the xputch buffer thread-local instead of a plain static.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_core.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index af9d93762..4efddb908 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2105,13 +2105,40 @@ static void write_stderr(const char *str)
 #ifdef HAVE_LIBUNWIND
 static const char hex[] = "0123456789abcdef";
 
+/*
+ * Buffer output and flush it in one write() per line, instead of one
+ * write() per character. Concurrent single-byte writes from multiple
+ * processes/threads (e.g. forked children, or multiple threads of the
+ * same process, all dumping a backtrace after receiving the same
+ * fatal signal) interleave on the shared stderr/runner fd and produce
+ * unreadable, garbled logs. The buffer is thread-local so concurrent
+ * threads don't race on it; plain TLS access is async-signal-safe,
+ * unlike a lock.
+ */
+static __thread char xputch_buf[256];
+static __thread size_t xputch_buf_len;
+
 static void
-xputch(int c)
+xflush(void)
 {
+	if (!xputch_buf_len)
+		return;
+
 	if (runner_connected())
-		log_to_runner_sig_safe((const void *) &c, 1);
+		log_to_runner_sig_safe(xputch_buf, xputch_buf_len);
 	else
-		igt_ignore_warn(write(STDERR_FILENO, (const void *) &c, 1));
+		igt_ignore_warn(write(STDERR_FILENO, xputch_buf, xputch_buf_len));
+
+	xputch_buf_len = 0;
+}
+
+static void
+xputch(int c)
+{
+	xputch_buf[xputch_buf_len++] = c;
+
+	if (c == '\n' || xputch_buf_len == sizeof(xputch_buf))
+		xflush();
 }
 
 static int
@@ -2166,6 +2193,7 @@ xprintfmt(const char *fmt, va_list ap)
 	while (1) {
 		while ((ch = *(const unsigned char *) fmt++) != '%') {
 			if (ch == '\0') {
+				xflush();
 				return;
 			}
 			xputch(ch);
-- 
2.43.0

