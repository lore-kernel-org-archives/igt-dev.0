Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63910C49EA1
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 14:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8C610E83C;
	Thu, 25 Jul 2024 14:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E1tZKbG/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30BD10E83A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721917256; x=1753453256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kq8pxNQFjARl5IPVgceKhj4pQqI/oh6iXS0vSK5N7J8=;
 b=E1tZKbG/t1SNlqgjSSAKULu26Kbr4Pif1sBcilu1eKTFWqo49Kf/FIts
 h04QaKSQPrAdIc7a2xAjYTp/SuhYQ2oIWoBIZqmQU0LhMYJmgrUeU1dMS
 CzW4GFQjZMn/xsUgcrKEpbs+zZ5m5dNSo612LtZM75nwbhJ2vlu8ojLPf
 loFGOhO0cbvyJGayF5AYdmxPq0S/Z+RtviibfDJnoW/GcDEKNLGhi0Vpm
 4xb6UxJTPmWvmWkqfBfGmwcEUv1gemTnF/PS3SC9LMtEUuhPMS/AqzN+e
 f0AX7SnQwO10eRYaWtBKrWnhLKKQsv4Hb01IW94MWTCgT5G2vOSYPBuF1 w==;
X-CSE-ConnectionGUID: yFo2ngU8Rb+D515xOhCOzA==
X-CSE-MsgGUID: kMVnlvFhQwuFgb48WxIQwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23463860"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="23463860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:53 -0700
X-CSE-ConnectionGUID: Im+s0lSERyev8nzar8UBwQ==
X-CSE-MsgGUID: uAbEBmUMSruVFcn41gJeog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="83938450"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.111.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:52 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 4/6] igt_hook: Implement and use set_fake_argv() in
 test
Date: Thu, 25 Jul 2024 11:19:37 -0300
Message-ID: <20240725142028.51735-5-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725142028.51735-1-gustavo.sousa@intel.com>
References: <20240725142028.51735-1-gustavo.sousa@intel.com>
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

