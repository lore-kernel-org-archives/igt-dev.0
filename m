Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E67CC54754
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0677110EB4C;
	Fri, 16 May 2025 17:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWYsNjmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE2B10EB4C
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415555; x=1778951555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZU1VcHamD37xmuvJdVCyqXZ4TLiC/KM880tuseyGDqA=;
 b=CWYsNjmby4eVuacT5tJ5U+/nZtnzR7d8m+MpcNGwRmiAXhLZ6YC6WKP5
 8g3Dy9kkI1ost9BAsGIU0ZS5e+efhOcKRCy5+ZZby4mxGrC0mIUhmiwnJ
 gaJpsI7/OhxvNsHZWG0WxV60p+pVlOo4lgbJ3GBVvTn8yKvLKAzmsdPgk
 PtGA+Gdd3ylxgGYjv58Eun9yW/EW317/kncrkAuOuaZPQgXAQkLJZ1aoF
 jbLH2K+h6bhAbHjPmamtT9XOKlP9TQNkTl+VmBIR6WFva4qhu3zGpLef1
 4fx2apEXhPAdVio6nr0EcWqPnv036ToMtIeWiGVv5/Lf6Jkd/iSYV4Ayv g==;
X-CSE-ConnectionGUID: 8z0Ba+DsS8yarE8Fgj7SFw==
X-CSE-MsgGUID: INwknXzJTlK2Qa9kQRQT3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49297114"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49297114"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:12:34 -0700
X-CSE-ConnectionGUID: XMGq/3/lRyeZA9xjP/u4tw==
X-CSE-MsgGUID: 93iBD/IfSSCtkCgSk9CMKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138793520"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:12:32 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v7 09/14] lib/igt_core: Implement conditional backtrace
 support using HAVE_LIBUNWIND
Date: Fri, 16 May 2025 17:11:48 +0000
Message-ID: <20250516171153.74079-10-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
References: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
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
 meson.build    | 3 +++
 2 files changed, 7 insertions(+)

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

