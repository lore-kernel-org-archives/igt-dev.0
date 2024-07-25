Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29302C3DA7E
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 14:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22FE10E836;
	Thu, 25 Jul 2024 14:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvGsJmzo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83ACB10E835
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721917251; x=1753453251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WmKzU/dtSTbTBEyKRavAXdQNdXzRACuYRObZEmRLUYU=;
 b=KvGsJmzoOQIPD6Dmfsa//tzSUJTK6HPYeWwCYROW75J3yEmL/VVWO4K2
 ZV1/adO0osvT2wpm/P+Ujf3KpyuRcympJz+mwnkyZoJboqNolZPoo8THk
 of97wmFvO5Zvt8OrO+vJ9wXbFATiiruJ7WdXe3LL2ZG9Bltx8mzfstPrX
 xccL4toMN+1hsIx2YG7fw3BbCt9F3aIToQ5EBfqhaLWk1Q4uUY0DlnMTA
 8BBvWcdzZ1vyaHHUemXIDCPmquSKpXgK5UGf/OqF+3XAhUYw8SwcVG2Qc
 63GxwLKGE25hWyLeUHJnCcp1v5rFDvgjk3BjM540U1fowkJ/PA9nuM11y g==;
X-CSE-ConnectionGUID: ZIKm5PfqQr+6zrQJZk6OAw==
X-CSE-MsgGUID: PXj33pj9Ro2sHwLZ7gmPOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23463852"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="23463852"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:50 -0700
X-CSE-ConnectionGUID: JKhKmcloRfq2U0yy+9MI8Q==
X-CSE-MsgGUID: Icgv/iIrT9y7JVnPgsi78Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="83938432"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.111.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:50 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 2/6] runner: Make it easier to extend argv
Date: Thu, 25 Jul 2024 11:19:35 -0300
Message-ID: <20240725142028.51735-3-gustavo.sousa@intel.com>
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

In an upcoming change, we will be adding the option to forward the
--hook option to the test cases, which will require updating
execute_test_process() to add the option when asked by the user.

The current implementation makes that task not quite straightforward:
filling of argv is already dependent on stuff like entry->subtest_count
and dynbegin; if we want to keep on using constant indices, we would
need several conditional branches for adding arguments for --hook.

Let us change the current implementation to use a dynamic vector, to
make it easier to extend argv with more stuff as needed.

v2:
  - Squash the logic from patch "runner: Use dynamic vector for test
    argv" directly instead of using the original logic, which used a
    statically sized array. (Lucas)

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 runner/executor.c | 54 +++++++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 4b374d2235b2..a135cd46b849 100644
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
@@ -1506,7 +1507,8 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		     struct settings *settings,
 		     struct job_list_entry *entry)
 {
-	char *argv[6] = {};
+	struct igt_vec arg_vec;
+	char *arg;
 	size_t rootlen;
 
 	dup2(outfd, STDOUT_FILENO);
@@ -1514,32 +1516,31 @@ execute_test_process(int outfd, int errfd, int socketfd,
 
 	setpgid(0, 0);
 
+	igt_vec_init(&arg_vec, sizeof(char *));
+
 	rootlen = strlen(settings->test_root);
-	argv[0] = malloc(rootlen + strlen(entry->binary) + 2);
-	strcpy(argv[0], settings->test_root);
-	argv[0][rootlen] = '/';
-	strcpy(argv[0] + rootlen + 1, entry->binary);
+	arg = malloc(rootlen + strlen(entry->binary) + 2);
+	strcpy(arg, settings->test_root);
+	arg[rootlen] = '/';
+	strcpy(arg + rootlen + 1, entry->binary);
+	igt_vec_push(&arg_vec, &arg);
 
 	if (entry->subtest_count) {
 		size_t argsize;
 		const char *dynbegin;
 		size_t i;
 
-		argv[1] = strdup("--run-subtest");
+		arg = strdup("--run-subtest");
+		igt_vec_push(&arg_vec, &arg);
 
 		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
 			argsize = dynbegin - entry->subtests[0];
 		else
 			argsize = strlen(entry->subtests[0]);
 
-		argv[2] = malloc(argsize + 1);
-		memcpy(argv[2], entry->subtests[0], argsize);
-		argv[2][argsize] = '\0';
-
-		if (dynbegin) {
-			argv[3] = strdup("--dynamic-subtest");
-			argv[4] = strdup(dynbegin + 1);
-		}
+		arg = malloc(argsize + 1);
+		memcpy(arg, entry->subtests[0], argsize);
+		arg[argsize] = '\0';
 
 		for (i = 1; i < entry->subtest_count; i++) {
 			char *sub = entry->subtests[i];
@@ -1547,22 +1548,35 @@ execute_test_process(int outfd, int errfd, int socketfd,
 
 			assert(dynbegin == NULL);
 
-			argv[2] = realloc(argv[2], argsize + sublen + 2);
-			argv[2][argsize] = ',';
-			strcpy(argv[2] + argsize + 1, sub);
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
 
+	arg = NULL;
+	igt_vec_push(&arg_vec, &arg);
+
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

