Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E6BC3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7707910E851;
	Wed,  7 May 2025 16:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8HETYZZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D5910E861
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633892; x=1778169892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UfWmsq4Zxn4FLDE9xNY809p8XdFEqqUZcrwbyJNIZFk=;
 b=N8HETYZZm4lkILb0AEaFbdD8LBguW12fpfKe9APanJkFMfBilpFOtW64
 ze7rU/JyvESdHzvPZsMpVumK4O4T55swGDhO6q5mbOIGY4lCoVM/HaPW8
 UMNDed3W1lxxek4l6q/ySkMXfGhst5rPjnqCsHnwDfX4mJw0IRpS/RLhU
 A2Cz0xpOzyBm5fZKycQLw06AiYyeX0+F2L8SVQE41vwQ5tCOI7f2JFxYy
 Bi7uOELaHCaBZXQqwUPk3f/Pkv8mMrydANPIOjl1DcH6KYl20TSFrvIKH
 KQgjtQ0BiagsNmVQm2Q4jmjIj1mq8nV6QbGpPH5RSv8U+1YqkTpi5DQjg Q==;
X-CSE-ConnectionGUID: 0n+0/WTgSx204hVYroRyCA==
X-CSE-MsgGUID: N7rKDT4yQZCMYQKzJw61mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519369"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519369"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:03:55 -0700
X-CSE-ConnectionGUID: 51RVFJcuSpKmu2eQgCqDiQ==
X-CSE-MsgGUID: hCQgE1GDQKSMn2w7vIaPfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173201022"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:03:53 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 09/15] lib/igt_core: Add print_backtrace placeholder for
 Android
Date: Wed,  7 May 2025 16:01:42 +0000
Message-ID: <20250507160148.53857-10-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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

As libunwind is not built for Android, print_backtrace placeholder
aded with not implemented log.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 6c89e136b..e7d979042 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -381,6 +381,12 @@ static bool stderr_needs_sentinel = false;
 
 static int _igt_dynamic_tests_executed = -1;
 
+#ifdef ANDROID
+static void print_backtrace(void)
+{
+	igt_info("backtrace not implemented\n");
+}
+#else
 static void print_backtrace(void)
 {
 	unw_cursor_t cursor;
@@ -441,6 +447,7 @@ static void print_backtrace(void)
 	if (dwfl)
 		dwfl_end(dwfl);
 }
+#endif /* ANDROID */
 
 __attribute__((format(printf, 2, 3)))
 static void internal_assert(bool cond, const char *format, ...)
-- 
2.34.1

