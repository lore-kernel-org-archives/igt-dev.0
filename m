Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52475C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BC310E95D;
	Thu, 15 May 2025 19:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTWD1CED";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D405910E959
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338773; x=1778874773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IWDWHv80IEWRgNI8BwGeDDsGA2aEGVvqnkvy4Uy7C2w=;
 b=gTWD1CEDOwJXUA33jIQlXOlGDMEnk/H4yoLKnYwjAC5UZHw9xAWO14mA
 gDmNsyKfG1JrFB9KMYfntaTJ6HMRZmuqZfxo05/jqz1UnMLPTchmWoJcs
 oFCIvY1x1De9FZVuho7vVhcS6FDo8kYVQL5kvwbBeUJD3FyYMxhAOBu6V
 NA6cm592yJ45eF98tgEj7w8BEYZye3XnuHf+G3sB32kHtErDe085CoOZq
 8/wG33MQskPV5x6xEh3nFQR3+2mP8z0Wb99aG5xu3DTSX8XOwnDbQNfCj
 DMBGYzDH2uZVFBfBAnm+eBlZmKVN+hX1AqbwQun8TliMIzcaGXGRRRqCL g==;
X-CSE-ConnectionGUID: kHyh6wP3RVG1n4ygaPOmeA==
X-CSE-MsgGUID: GPrEjkpySyyVLE66V8wCyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454479"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454479"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:52:53 -0700
X-CSE-ConnectionGUID: UUkpEReJQeuRb5nV91eRQg==
X-CSE-MsgGUID: GNyKHat9QZeQZyIsm9h0SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347380"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:52:51 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 09/14] lib/igt_core: Implement conditional backtrace support
 using HAVE_LIBUNWIND
Date: Thu, 15 May 2025 19:52:02 +0000
Message-ID: <20250515195207.106414-10-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
References: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
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
2.34.1

