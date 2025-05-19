Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DC7C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5708410E3AF;
	Mon, 19 May 2025 15:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuY6Q3Il";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FEB10E3AF
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747667542; x=1779203542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eVyWeBOFCLBvUla0qj2QtBixBEQRL5JgAbN6x1xOg4c=;
 b=NuY6Q3IlsMhZqU3PnlbEuT91GHo48OzN5bgR/A8uDiakknbktSi5VZW4
 NZBEfGF3gJYrJnmg9WTyelZdlgrrLIozhG8SjxW91ONBZVmRpBpS8/eXt
 FSt8r8dknET69k3c25fzrj58AQkReM0UYN+GfgXBra/tg5DnWL0Sk2xiE
 Ccfo+R55lkHalHERVt7fGpP/AiDnebw798JA9H5IdRb+tWIS6tlrtwkxb
 kd7IU2nJnZCLBvz95mD5RCAEXlLWHfrVkV5LXdqWDGpDNvKeIYJkkv7Zi
 X0FzsvjM67WuJ8+I1UHqpjOg7hKYX8YU6gCDA4bVWLxDm/vGtCHG6AwuN Q==;
X-CSE-ConnectionGUID: UoOAgNWEQBOq5/x99zSmpA==
X-CSE-MsgGUID: F6I4qL0PTImxBTlAmRJSuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710568"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49710568"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:12:21 -0700
X-CSE-ConnectionGUID: 3Uuh/nmkSe6ZtSR66e4nFA==
X-CSE-MsgGUID: YY1Gw+CAQ6KJd81yXJiSfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139287991"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 19 May 2025 08:12:19 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v9 09/14] lib/igt_core: Add a dummy workaround when
 libunwind is not present
Date: Mon, 19 May 2025 15:11:30 +0000
Message-ID: <20250519151135.43874-10-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
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

If HAVE_LIBUNWIND is not defined, print a log message indicating
"backtrace not implemented" in the print_backtrace* functions and
return.

As xputch, xpow, printnum, xstrlcpy, xprintfmt, xprintf are used
by backtrace functions, enabled those only if HAVE_LIBUNWIND is defined.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_core.c | 13 +++++++++++++
 meson.build    |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 2cea47214..679683958 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -86,7 +86,9 @@
 #include "runnercomms.h"
 
 #define UNW_LOCAL_ONLY
+#ifdef HAVE_LIBUNWIND
 #include <libunwind.h>
+#endif
 #include <elfutils/libdwfl.h>
 
 #ifdef HAVE_LIBGEN_H
@@ -379,6 +381,9 @@ static int _igt_dynamic_tests_executed = -1;
 
 static void print_backtrace(void)
 {
+#ifndef HAVE_LIBUNWIND
+	igt_info("backtrace not implemented\n");
+#else
 	unw_cursor_t cursor;
 	unw_context_t uc;
 	int stack_num = 0;
@@ -436,6 +441,7 @@ static void print_backtrace(void)
 
 	if (dwfl)
 		dwfl_end(dwfl);
+#endif
 }
 
 __attribute__((format(printf, 2, 3)))
@@ -2082,6 +2088,7 @@ static void write_stderr(const char *str)
 	__write_stderr(str, strlen(str));
 }
 
+#ifdef HAVE_LIBUNWIND
 static const char hex[] = "0123456789abcdef";
 
 static void
@@ -2234,9 +2241,14 @@ xprintf(const char *fmt, ...)
 	xprintfmt(fmt, ap);
 	va_end(ap);
 }
+#endif /* HAVE_LIBUNWIND */
 
 static void print_backtrace_sig_safe(void)
 {
+
+#ifndef HAVE_LIBUNWIND
+	igt_info("backtrace not implemented\n");
+#else
 	unw_cursor_t cursor;
 	unw_context_t uc;
 	int stack_num = 0;
@@ -2256,6 +2268,7 @@ static void print_backtrace_sig_safe(void)
 				(unsigned int) off);
 
 	}
+#endif
 }
 
 void __igt_fail_assert(const char *domain, const char *file, const int line,
diff --git a/meson.build b/meson.build
index 6a580bd7e..b88098234 100644
--- a/meson.build
+++ b/meson.build
@@ -147,6 +147,9 @@ else
 endif
 
 libunwind = dependency('libunwind', required : get_option('libunwind'))
+if libunwind.found()
+	config.set('HAVE_LIBUNWIND', 1)
+endif
 build_info += 'With libunwind: @0@'.format(libunwind.found())
 
 libdw = dependency('libdw', required : true)
-- 
2.49.0

