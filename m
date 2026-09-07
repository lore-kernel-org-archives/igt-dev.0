Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E51C79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 05:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBDB10E437;
	Mon,  7 Sep 2026 05:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgcBtuFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B913910E0C1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 05:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788758421; x=1820294421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6FlECL9V91GJa6Xp2j7JQMh8iHypHWch/XoCp47mhvU=;
 b=GgcBtuFk8gE3zq0w5judXuz/eUknDNAGiYwYcnh5vSVl0z4XzYkKI20e
 AMtaidKELX6WpfOqBG1wrPIH1NDQnrRUYWU5AetGBoWcfwoNOq28y+G76
 sZpdvNBtjd0BrPF1V5qiR46ZuXhSU5QMRAUKk0vsV1FAs9zQ8L4/bVCGT
 /y6TDhCYAxQWJWOkrEkp6mpD8gDan7RZsaNUmBdAW30qf2Q3kIEzE3MiY
 YBQexyDDGcfshb8sIQMCvbJvcdjfiauiJ7okNt4sbUycwnKlSa9Rh+r1n
 dhPMD9gFux7LCyLbn5RehHpiUTW/tTOioFdTPWaBobSabH2wOS5Hykq3V Q==;
X-CSE-ConnectionGUID: sZ8n/5q8QD2yvquZFg5f0A==
X-CSE-MsgGUID: kw7J9GQeSGes376SPTO5YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89083156"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="89083156"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:20:21 -0700
X-CSE-ConnectionGUID: o/2EXmc4Q2Goyf3CPc3d4Q==
X-CSE-MsgGUID: v3CwJPybRfud1H+/JY6MtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="295478773"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:20:20 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] lib/igt_core: buffer signal-safe log output per line
Date: Mon,  7 Sep 2026 10:50:12 +0530
Message-ID: <20260907052012.3948192-1-jeevan.b@intel.com>
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

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_core.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index af9d93762..e376a972c 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2105,13 +2105,37 @@ static void write_stderr(const char *str)
 #ifdef HAVE_LIBUNWIND
 static const char hex[] = "0123456789abcdef";
 
+/*
+ * Buffer output and flush it in one write() per line, instead of one
+ * write() per character. Concurrent single-byte writes from multiple
+ * processes (e.g. forked children all dumping a backtrace after
+ * receiving the same fatal signal) interleave on the shared stderr/
+ * runner fd and produce unreadable, garbled logs.
+ */
+static char xputch_buf[256];
+static size_t xputch_buf_len;
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
@@ -2166,6 +2190,7 @@ xprintfmt(const char *fmt, va_list ap)
 	while (1) {
 		while ((ch = *(const unsigned char *) fmt++) != '%') {
 			if (ch == '\0') {
+				xflush();
 				return;
 			}
 			xputch(ch);
-- 
2.43.0

