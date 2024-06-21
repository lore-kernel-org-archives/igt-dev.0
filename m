Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E4FC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 19:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6431D10E15E;
	Fri, 21 Jun 2024 19:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3qrawwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7079D10E15E
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718999587; x=1750535587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kq8pxNQFjARl5IPVgceKhj4pQqI/oh6iXS0vSK5N7J8=;
 b=G3qrawwTfyGFj4m9W/lwhpEoUQ6U5ZGfux6LeDY8AZi0zZYvrYAluidR
 RMpWE1i6PxAKzCJHR6Hafw/JBea1j8dXLb5crXBfA19jyM7eDFhWSAg2A
 PssX+l6uUM8FRL8LDP6cLCY4GRm0L34xPNHDR8wZY4VoieTFrupa//Fu4
 +Dp8b1JqcqvEqgQNDn2xmMCLwusJralzjhvD51Oe2rz4hT3ki72YIYvHF
 Qulwaffl/dvYIubU0sYXLvJHj/j+7A+SsIm1XJQefV1++gQuxi0/Gk3o2
 GOrsXjpdYmwWgpXJpAmK9W2mcMuNIGAGs5Ve/zudkU4MfJD5GfFx5thbA g==;
X-CSE-ConnectionGUID: VIRlEBThTdi3cMn5iNvJ8g==
X-CSE-MsgGUID: WiNa4ldRR8GkUZpDqAeVKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15925560"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="15925560"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:06 -0700
X-CSE-ConnectionGUID: mm6qQWbBRDmFafxHgQtchA==
X-CSE-MsgGUID: XJ6dn2nkRzGOT18B4A8DrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="73432161"
Received: from dgramcko-desk.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:05 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v2 4/7] igt_hook: Implement and use set_fake_argv() in
 test
Date: Fri, 21 Jun 2024 16:51:49 -0300
Message-ID: <20240621195150.390462-7-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621195150.390462-1-gustavo.sousa@intel.com>
References: <20240621195150.390462-1-gustavo.sousa@intel.com>
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

In upcoming changes, fake_argv will need to allow a variable number of
elements. As such, implement the variadic function set_fake_argv() to
allow that.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/tests/igt_hook_integration.c | 49 +++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
index f5ba25e92897..c552d5a4e796 100644
--- a/lib/tests/igt_hook_integration.c
+++ b/lib/tests/igt_hook_integration.c
@@ -3,6 +3,7 @@
  * Copyright(c) 2024 Intel Corporation. All rights reserved.
  */
 
+#include <stdarg.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
@@ -11,11 +12,9 @@
 
 #include "igt_tests_common.h"
 
-char prog[] = "igt_hook_integration";
-char hook_opt[] = "--hook";
-char hook_str[128];
-char *fake_argv[] = {prog, hook_opt, hook_str};
-int fake_argc = sizeof(fake_argv) / sizeof(fake_argv[0]);
+char fake_argv_buffer[1024];
+char *fake_argv[64];
+int fake_argc;
 
 #define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, result) \
 { \
@@ -51,6 +50,32 @@ const char *post_test_env[] = TEST_ENV("post-test", "FAIL");
 
 #define num_env_vars (sizeof(pre_test_env) / sizeof(pre_test_env[0]))
 
+static void set_fake_argv(const char *arg0, ...)
+{
+	va_list ap;
+	const char *arg;
+	size_t buf_size;
+
+	fake_argc = 0;
+	buf_size = 0;
+
+	va_start(ap, arg0);
+
+	arg = arg0;
+	while (arg != NULL) {
+		internal_assert(buf_size + strlen(arg) < sizeof(fake_argv_buffer));
+		internal_assert((size_t)fake_argc < sizeof(fake_argv) / sizeof(fake_argv[0]));
+
+		strcpy(fake_argv_buffer + buf_size, arg);
+		fake_argv[fake_argc++] = fake_argv_buffer + buf_size;
+		buf_size += strlen(arg) + 1;
+
+		arg = va_arg(ap, typeof(arg));
+	}
+
+	va_end(ap);
+}
+
 __noreturn static void fake_main(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
@@ -85,7 +110,7 @@ static void test_invalid_hook_str(void)
 	static char err[4096];
 	int errfd;
 
-	sprintf(hook_str, "invalid-event:echo hello");
+	set_fake_argv("igt_hook_integration", "--hook", "invalid-event:echo hello", NULL);
 
 	pid = do_fork_bg_with_pipes(fake_main, NULL, &errfd);
 
@@ -196,6 +221,7 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
 	int ret;
 	int pipefd[2];
 	pid_t pid;
+	char hook_str[128];
 	FILE *f;
 
 	ret = pipe(pipefd);
@@ -204,10 +230,13 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
 	/* Use grep to filter only env var set by us. This should ensure that
 	 * writing to the pipe will not block due to capacity, since we only
 	 * read from the pipe after the shell command is done. */
-	sprintf(hook_str,
-		"%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
-		evt_descriptors,
-		pipefd[1]);
+	ret = snprintf(hook_str, sizeof(hook_str),
+		     "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
+		     evt_descriptors,
+		     pipefd[1]);
+	internal_assert(0 < ret && ret < sizeof(hook_str));
+
+	set_fake_argv("igt_hook_integration", "--hook", hook_str, NULL);
 
 	pid = do_fork_bg_with_pipes(fake_main, NULL, NULL);
 	internal_assert(safe_wait(pid, &ret) != -1);
-- 
2.45.2

