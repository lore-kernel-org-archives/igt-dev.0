Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE86CC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 19:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6651710E198;
	Fri, 21 Jun 2024 19:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjAqaWio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B912A10E0D6
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 19:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718999590; x=1750535590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PMDLeR1dAX/ZV/5LbsMEzfu5nNaW2z6g7h3SegUCz3g=;
 b=CjAqaWio8yADOixkYoGnslvmqZNKS7+y5Pw6mCfK5G9IibxHrW7xNiPI
 Fmy65gX8+pLBAkAhrQSi0q8MMTPLqd7C4x/cvAMw+U1hJuc9SWFPXfG9x
 f6X1imNszm/GnZAfdWtakJjYLuDJ4rtyAziXbBY+yHHQVN1wrC7JrT6Zw
 gEz+qYAxhO0W9eRzyp7WHDw2tXE9pqIiuyPJpc93KGG0YcdXtwrVuop3R
 sLC32LUH7d04lhtKnWvIwAkuLPrrOKjjicNAcWs4lxf8mZaS0eDObTC8B
 5/XPmYeZi+ULxM2NC+TsSoOEhQtV7c2Kp6dT3yO2eNCGSRzoYszbTOqiu w==;
X-CSE-ConnectionGUID: rsTQ0is8TsOgmsaHNl5osQ==
X-CSE-MsgGUID: 0O2nX8+MTpOOlc0D+jh16Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15925566"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="15925566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:10 -0700
X-CSE-ConnectionGUID: GcKHOnb+RxCJZ9lKh43xWg==
X-CSE-MsgGUID: Eg09F2gIQ3qddjD0zFp9lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="73432168"
Received: from dgramcko-desk.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:08 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v2 6/7] runner: Use dynamic vector for test argv
Date: Fri, 21 Jun 2024 16:51:51 -0300
Message-ID: <20240621195150.390462-9-gustavo.sousa@intel.com>
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

With an upcoming update to allow multiple hook options, we need to allow
for a dynamicly sized argument vector in execute_test_process(). Do that
by using a struct igt_vec.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 runner/executor.c | 77 +++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 40 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 92dee6e32f6f..a23cd58c0781 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -31,6 +31,7 @@
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_taints.h"
+#include "igt_vec.h"
 #include "executor.h"
 #include "output_strings.h"
 #include "runnercomms.h"
@@ -1506,21 +1507,8 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		     struct settings *settings,
 		     struct job_list_entry *entry)
 {
-	char *arg0;
-	char *arg_run_subtest[2] = {};
-	char *arg_dyn_subtest[2] = {};
-	char *arg_hook[2] = {};
-	char **argv_refs[] = {
-		&arg0,
-		&arg_run_subtest[0],
-		&arg_run_subtest[1],
-		&arg_dyn_subtest[0],
-		&arg_dyn_subtest[1],
-		&arg_hook[0],
-		&arg_hook[1],
-		NULL,
-	};
-	char *argv[sizeof(argv_refs) / sizeof(argv_refs[0])] = {};
+	struct igt_vec arg_vec;
+	char *arg;
 	size_t rootlen;
 
 	dup2(outfd, STDOUT_FILENO);
@@ -1528,32 +1516,31 @@ execute_test_process(int outfd, int errfd, int socketfd,
 
 	setpgid(0, 0);
 
+	igt_vec_init(&arg_vec, sizeof(char *));
+
 	rootlen = strlen(settings->test_root);
-	arg0 = malloc(rootlen + strlen(entry->binary) + 2);
-	strcpy(arg0, settings->test_root);
-	arg0[rootlen] = '/';
-	strcpy(arg0 + rootlen + 1, entry->binary);
+	arg = malloc(rootlen + strlen(entry->binary) + 2);
+	strcpy(arg, settings->test_root);
+	arg[rootlen] = '/';
+	strcpy(arg + rootlen + 1, entry->binary);
+	igt_vec_push(&arg_vec, &arg);
 
 	if (entry->subtest_count) {
 		size_t argsize;
 		const char *dynbegin;
 		size_t i;
 
-		arg_run_subtest[0] = strdup("--run-subtest");
+		arg = strdup("--run-subtest");
+		igt_vec_push(&arg_vec, &arg);
 
 		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
 			argsize = dynbegin - entry->subtests[0];
 		else
 			argsize = strlen(entry->subtests[0]);
 
-		arg_run_subtest[1] = malloc(argsize + 1);
-		memcpy(arg_run_subtest[1], entry->subtests[0], argsize);
-		arg_run_subtest[1][argsize] = '\0';
-
-		if (dynbegin) {
-			arg_dyn_subtest[0] = strdup("--dynamic-subtest");
-			arg_dyn_subtest[1] = strdup(dynbegin + 1);
-		}
+		arg = malloc(argsize + 1);
+		memcpy(arg, entry->subtests[0], argsize);
+		arg[argsize] = '\0';
 
 		for (i = 1; i < entry->subtest_count; i++) {
 			char *sub = entry->subtests[i];
@@ -1561,32 +1548,42 @@ execute_test_process(int outfd, int errfd, int socketfd,
 
 			assert(dynbegin == NULL);
 
-			arg_run_subtest[1] = realloc(arg_run_subtest[1], argsize + sublen + 2);
-			arg_run_subtest[1][argsize] = ',';
-			strcpy(arg_run_subtest[1] + argsize + 1, sub);
+			arg = realloc(arg, argsize + sublen + 2);
+			arg[argsize] = ',';
+			strcpy(arg + argsize + 1, sub);
 			argsize += sublen + 1;
 		}
+
+		igt_vec_push(&arg_vec, &arg);
+
+		if (dynbegin) {
+			arg = strdup("--dynamic-subtest");
+			igt_vec_push(&arg_vec, &arg);
+			arg = strdup(dynbegin + 1);
+			igt_vec_push(&arg_vec, &arg);
+		}
 	}
 
 	if (settings->hook_str) {
-		arg_hook[0] = strdup("--hook");
-		arg_hook[1] = strdup(settings->hook_str);
+		arg = strdup("--hook");
+		igt_vec_push(&arg_vec, &arg);
+		arg = strdup(settings->hook_str);
+		igt_vec_push(&arg_vec, &arg);
 	}
 
-	/* Build argv with only stuff that is set. */
-	for (size_t i = 0, j = 0; argv_refs[i]; i++)
-		if (*argv_refs[i])
-			argv[j++] = *argv_refs[i];
+	arg = NULL;
+	igt_vec_push(&arg_vec, &arg);
 
 	if (socketfd >= 0) {
 		struct runnerpacket *packet;
 
-		packet = runnerpacket_exec(argv);
+		packet = runnerpacket_exec(arg_vec.elems);
 		write(socketfd, packet, packet->size);
 	}
 
-	execv(argv[0], argv);
-	fprintf(stderr, "Cannot execute %s\n", argv[0]);
+	arg = *((char **)igt_vec_elem(&arg_vec, 0));
+	execv(arg, arg_vec.elems);
+	fprintf(stderr, "Cannot execute %s\n", arg);
 	exit(IGT_EXIT_INVALID);
 }
 
-- 
2.45.2

