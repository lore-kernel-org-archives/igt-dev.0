Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C80BC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 18:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D2E10EB65;
	Fri, 16 May 2025 18:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHwdHbx0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FE910EB65
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 18:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747420071; x=1778956071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fRtu4ilb1xEQIIoeB1ow17eiMeLCMOb1QGveUjx4C8s=;
 b=QHwdHbx0bylZHSbi6e3aOnQkYhHh3lytGAesLc6Yh5d/sqcn2efqRivl
 EqtTNS0H7qTZ+GcNizKl9LJFebKNHEvFupZh/5vvzL/+CHwzBPKl8hx1j
 l0K7ZzaqGRn3LJPF+fw9BE9DYVdXsHOeB4xCnqILjYU5J6TlKkaxWynlJ
 8lAySqFi6bI+RRz7jVOTC216o/tYYior2O4pbIDv4nKQzEeiz86dLsEeC
 aS9Sba1KATuJvbuxZJn++mod/6HtaG53VY4OsqTvJjX6wqHqR4ZcrTXag
 HfQf+kGjsjUWFSudXDfk1BgrW05RfLgOF8F+ftqdIL9fAd/hwMIzwmOQG w==;
X-CSE-ConnectionGUID: 0fLetjmxTc+gh8b9AKr1gg==
X-CSE-MsgGUID: uJNxbO81T92bEfvte5cvcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60059903"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60059903"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:27:51 -0700
X-CSE-ConnectionGUID: IiwnTLVGTwSDPlVMSNqGng==
X-CSE-MsgGUID: rApjJP1GRQSZLq7ifyN/bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="143736954"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa004.jf.intel.com with ESMTP; 16 May 2025 11:27:49 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com, adrinael@adrinael.net,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v8 09/14] lib/igt_core: Add a dummy workaround when
 libunwind is not present
Date: Fri, 16 May 2025 18:26:59 +0000
Message-ID: <20250516182704.97912-10-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
References: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
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

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_core.c | 11 +++++++++++
 meson.build    |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 2cea47214..9d1d0fbd5 100644
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
@@ -2237,6 +2243,10 @@ xprintf(const char *fmt, ...)
 
 static void print_backtrace_sig_safe(void)
 {
+
+#ifndef HAVE_LIBUNWIND
+	igt_info("backtrace not implemented\n");
+#else
 	unw_cursor_t cursor;
 	unw_context_t uc;
 	int stack_num = 0;
@@ -2256,6 +2266,7 @@ static void print_backtrace_sig_safe(void)
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

