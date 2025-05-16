Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EA5C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F191D10EB20;
	Fri, 16 May 2025 16:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBMPxaC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429B510EB1B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411601; x=1778947601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wYPgANfZyXJMhZoyanjiFKspUmIFizuGDdI/mRGfzSA=;
 b=fBMPxaC18NbP3ty5nIEFxwE8bYubO6OWmgcbAbEB/GdqWFoebzbXd5Sz
 M4Tcbe8dwE2vg3K8+FMDVBB+3EwFD9guwlanFvuPsLH4VZwOy2vwPMX06
 XqLE8NikNNt52gOdOe3K1+BHaOx4T2OuXrN+5PXiL4d+DEx48r0neW2Ba
 8gJOhb0GkcqOemD0UNs9paBLVavN96n6+3QOAGfLRdGiiHYEEnwou5Bfx
 yA9PYb/kHklljrRStxKyW3DWHIQyxFoL8EAZfFtr3Xy0UHBwaT8fS//xU
 JXQbu+FBpy8qYjhuOmvcdWJXa6cj66y1QxsN3ohekjaoHbFuP2HUMYxa+ A==;
X-CSE-ConnectionGUID: Fg5E2OSCTk2nqVaYtPdDsA==
X-CSE-MsgGUID: 5ABTGyArTs+E8Msqvs16ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941152"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:39 -0700
X-CSE-ConnectionGUID: X/1wAW6TRXunzGYDLI60Xw==
X-CSE-MsgGUID: cDAaVzRVRR+OcHXqecE7vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772592"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:36 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v6 09/14] lib/igt_core: Implement conditional backtrace
 support using HAVE_LIBUNWIND
Date: Fri, 16 May 2025 16:05:46 +0000
Message-ID: <20250516160551.58760-10-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
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

Add a log message indicating "backtrace not implemented" in the
print_backtrace function and return when HAVE_LIBUNWIND is not defined.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 1d7402cb7..097a556c9 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -383,6 +383,9 @@ static int _igt_dynamic_tests_executed = -1;
 
 static void print_backtrace(void)
 {
+#ifndef HAVE_LIBUNWIND
+	igt_info("backtrace not implemented\n");
+#else
 	unw_cursor_t cursor;
 	unw_context_t uc;
 	int stack_num = 0;
@@ -440,6 +443,7 @@ static void print_backtrace(void)
 
 	if (dwfl)
 		dwfl_end(dwfl);
+#endif
 }
 
 __attribute__((format(printf, 2, 3)))
-- 
2.49.0

