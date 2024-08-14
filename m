Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CB5C5320E
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 20:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE4510E0AC;
	Wed, 14 Aug 2024 20:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/CRFn2g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3773C10E042
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 20:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723668528; x=1755204528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r0wKlG0bab5XqF0PSfKYDIzZif4nP0djovhHdWdPnIU=;
 b=X/CRFn2gUTRaS8EytTEgWyftDrT6KTmY0SDF11F5Qvz95zxYdeJGUqMl
 c4rCEz/XWUDF3osCa2Rm6iwmh6kQfdqsHDCHMGet4tei9BZtZM0bMl14H
 CH5TA0EW2bZaJhmUXhINnIDlL76jp6HkEbjAPcqi0FdCPVy7BuQIW9rEb
 ZEe2h0hxeZQ75jjPd9q73MRQw0MXbM2BjHJb3gY407WVDFvelQpZ3ouFp
 pv2pr6M1UZ2Y35PrpR8kV0/CKPDvKV5fD5swTXXJvvLr57hv6vh1B0yPR
 pB32tCSeNvmH6z2JjP6xMhGPwaTr0PxtJ6klUI4BGx+adoxP021L2nR19 g==;
X-CSE-ConnectionGUID: sJbXPCyrT3uXndJrQCqM7Q==
X-CSE-MsgGUID: wmA9tLVpS+uWeekoPBE/oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21723265"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="21723265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 13:48:44 -0700
X-CSE-ConnectionGUID: 0GHGfYmcSjCWa5JCUDzJLw==
X-CSE-MsgGUID: yR5y4EdFQJmZ3b0WaGkHzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="59108153"
Received: from ldmartin-desk2.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.110.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 13:48:43 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t v4 4/6] igt_hook: Implement and use set_fake_argv() in
 test
Date: Wed, 14 Aug 2024 17:47:59 -0300
Message-ID: <20240814204822.95283-5-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814204822.95283-1-gustavo.sousa@intel.com>
References: <20240814204822.95283-1-gustavo.sousa@intel.com>
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

v2:
  - Replace "while" loop with the more concise "for" loop. (Lucas)

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> # v1
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/tests/igt_hook_integration.c | 46 +++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
index f5ba25e92897..25328f975de8 100644
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
@@ -51,6 +50,29 @@ const char *post_test_env[] = TEST_ENV("post-test", "FAIL");
 
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
+	for (arg = arg0; arg != NULL; arg = va_arg(ap, typeof(arg))) {
+		internal_assert(buf_size + strlen(arg) < sizeof(fake_argv_buffer));
+		internal_assert((size_t)fake_argc < sizeof(fake_argv) / sizeof(fake_argv[0]));
+
+		strcpy(fake_argv_buffer + buf_size, arg);
+		fake_argv[fake_argc++] = fake_argv_buffer + buf_size;
+		buf_size += strlen(arg) + 1;
+	}
+
+	va_end(ap);
+}
+
 __noreturn static void fake_main(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
@@ -85,7 +107,7 @@ static void test_invalid_hook_str(void)
 	static char err[4096];
 	int errfd;
 
-	sprintf(hook_str, "invalid-event:echo hello");
+	set_fake_argv("igt_hook_integration", "--hook", "invalid-event:echo hello", NULL);
 
 	pid = do_fork_bg_with_pipes(fake_main, NULL, &errfd);
 
@@ -196,6 +218,7 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
 	int ret;
 	int pipefd[2];
 	pid_t pid;
+	char hook_str[128];
 	FILE *f;
 
 	ret = pipe(pipefd);
@@ -204,10 +227,13 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
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
2.46.0

