Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0BBC54E71
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 18:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F6910E757;
	Wed, 21 May 2025 18:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSO0t1eK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DE710E757
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 18:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747852309; x=1779388309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=90ou2RMLUgaUrAtoI8C/x8knD1JhB1mSvqcHl26NNgE=;
 b=XSO0t1eKjbZs4mXN4YQ3exbcRz6KlwMFMNojXPRWMuXf6Nja7+2zyrq5
 15BIvr72F+8gFv+5qDWHHK81Zjr/RI23r6qnxnSrX/QFZ9u+gWSoVHnBd
 o0niKrM0rWai/Adp4pIFsKj/xosrMc82ViQ9DgewZcvDCjcjSHhWqXpDS
 Be3tGaWjJi/BSA1yrKyKzNl0OtbN20WbKGgVjMVc92T/9LqS/4Fkrzs/s
 HUCkNyIsyWvNDcQvxufmKa1ALE4iPAqEKuKvZJfzG9z5DP1ZEqPaFpkVT
 HdTlThk3fwZngcXf4mEBImcY2oAKJRG1S9ZeUyc1FN9t9YiDY0AwYZQeg g==;
X-CSE-ConnectionGUID: xjhqGkmmTgeX0BdLH8Es1g==
X-CSE-MsgGUID: SbhGIY2dTteK8TB7Qy4wDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60486713"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="60486713"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 11:31:48 -0700
X-CSE-ConnectionGUID: urj9QhkBRv+RX11zVIhFZQ==
X-CSE-MsgGUID: ZlA+wYL3S42mfU8uNufqFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="144162369"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa003.fm.intel.com with ESMTP; 21 May 2025 11:31:47 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t] lib/igt_core: Workaround igt_thread failure when
 libunwind is not present
Date: Wed, 21 May 2025 18:31:20 +0000
Message-ID: <20250521183120.87121-1-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
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

igt_thread test expects the test failure accompanied by a stack trace
and it matches the trace prefix "Stack trace: " to determine test result.

With the commit "Add a dummy workaround when libunwind is not present",
this trace prefix "Stack trace: " is not printed, resulting in an
igt_thread test failure.

There are 2 solutions to fix this issue:
1. Print the trace "Stack trace: not implemented"
2. Run the failure test only if libunwind is present.

This patch implements the first approach.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index f698494e1..b06cdfd89 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -378,7 +378,7 @@ static int _igt_dynamic_tests_executed = -1;
 static void print_backtrace(void)
 {
 #ifndef HAVE_LIBUNWIND
-	igt_info("backtrace not implemented\n");
+	igt_info("Stack trace: not implemented\n");
 #else
 	unw_cursor_t cursor;
 	unw_context_t uc;
@@ -2242,7 +2242,7 @@ xprintf(const char *fmt, ...)
 static void print_backtrace_sig_safe(void)
 {
 #ifndef HAVE_LIBUNWIND
-	igt_info("backtrace not implemented\n");
+	igt_info("Stack trace: not implemented\n");
 #else
 	unw_cursor_t cursor;
 	unw_context_t uc;
-- 
2.49.0

