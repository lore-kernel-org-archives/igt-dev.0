Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC194C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 19:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC7C10E0D8;
	Fri, 21 Jun 2024 19:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iF1xZeie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3935F10E0D8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 19:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718999583; x=1750535583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FSIXSlueW+JXRgMCCgpyBH+L3jRElsq3liK4L7qYVz0=;
 b=iF1xZeieU9QC+VvWV2IGLf01xaTPQaahmTCWzaMxYJc8EtO6pOKjKDuH
 mc8USGmBKGM0i7VfysagwYUMpT7hWPzhv1n8LcnRqSyMI/tK4ToAMj9zY
 UT3I9gDmSAmnCUcDm6u/DzyQYSDZ9aRbylcpsjifUtI3pSHl1rNK86MzU
 mUZjNMRT+vKLXkxLp5Qv52APIFP03eynBb338iOaB9lO2gsJLfbkVhGZu
 WjStTtI6mIOKAptvn0vafQPsy9ChcNPNpmkuzZfcw76JkP3mbHn7y3ro9
 NfFRxW6vyHEqtINRSoUbmj18K3H+kKwe7pqq0qPrOfOQrfeYVM4QEUUym Q==;
X-CSE-ConnectionGUID: JURA6LhHSfuELGtG0zCDTg==
X-CSE-MsgGUID: x0Hm6OmtQee06vr4NSj0Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15925555"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="15925555"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:03 -0700
X-CSE-ConnectionGUID: 4FFZcDNISmeAfwFSEZTLVA==
X-CSE-MsgGUID: K+Fd0O0zRa+kybl++f7Odg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="73432154"
Received: from dgramcko-desk.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:02 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v2 2/7] runner: Make it easier to extend argv
Date: Fri, 21 Jun 2024 16:51:47 -0300
Message-ID: <20240621195150.390462-5-gustavo.sousa@intel.com>
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

In an upcoming change, we will be adding the option to forward the
--hook option to the test cases, which will require updating
execute_test_process() to add the option when asked by the user.

The current implementation makes that task not quite straightforward:
filling of argv is already dependent on stuff like entry->subtest_count
and dynbegin; if we want to keep on using constant indices, we would
need several conditional branches for adding arguments for --hook.

One way of simplifying this is to treat argv as a stack and have a
"head" index variable which is incremented after we are done setting the
current value. However, we would lose the benefit of static array bounds
analysis from the compiler, which we do have with the current code.

Let's instead define a static mapping in argv_refs of the possible
arguments that execute_test_process() could define and then generate
argv at the end with only those values that were set. With that, we keep
benefits of static array bounds analysis and make it easier to extend
argv, which is just a matter of adding more stuff into argv_refs and
setting them when necessary.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 runner/executor.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 4b374d2235b2..e9b037ebcaf9 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1506,7 +1506,18 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		     struct settings *settings,
 		     struct job_list_entry *entry)
 {
-	char *argv[6] = {};
+	char *arg0;
+	char *arg_run_subtest[2] = {};
+	char *arg_dyn_subtest[2] = {};
+	char **argv_refs[] = {
+		&arg0,
+		&arg_run_subtest[0],
+		&arg_run_subtest[1],
+		&arg_dyn_subtest[0],
+		&arg_dyn_subtest[1],
+		NULL,
+	};
+	char *argv[sizeof(argv_refs) / sizeof(argv_refs[0])] = {};
 	size_t rootlen;
 
 	dup2(outfd, STDOUT_FILENO);
@@ -1515,30 +1526,30 @@ execute_test_process(int outfd, int errfd, int socketfd,
 	setpgid(0, 0);
 
 	rootlen = strlen(settings->test_root);
-	argv[0] = malloc(rootlen + strlen(entry->binary) + 2);
-	strcpy(argv[0], settings->test_root);
-	argv[0][rootlen] = '/';
-	strcpy(argv[0] + rootlen + 1, entry->binary);
+	arg0 = malloc(rootlen + strlen(entry->binary) + 2);
+	strcpy(arg0, settings->test_root);
+	arg0[rootlen] = '/';
+	strcpy(arg0 + rootlen + 1, entry->binary);
 
 	if (entry->subtest_count) {
 		size_t argsize;
 		const char *dynbegin;
 		size_t i;
 
-		argv[1] = strdup("--run-subtest");
+		arg_run_subtest[0] = strdup("--run-subtest");
 
 		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
 			argsize = dynbegin - entry->subtests[0];
 		else
 			argsize = strlen(entry->subtests[0]);
 
-		argv[2] = malloc(argsize + 1);
-		memcpy(argv[2], entry->subtests[0], argsize);
-		argv[2][argsize] = '\0';
+		arg_run_subtest[1] = malloc(argsize + 1);
+		memcpy(arg_run_subtest[1], entry->subtests[0], argsize);
+		arg_run_subtest[1][argsize] = '\0';
 
 		if (dynbegin) {
-			argv[3] = strdup("--dynamic-subtest");
-			argv[4] = strdup(dynbegin + 1);
+			arg_dyn_subtest[0] = strdup("--dynamic-subtest");
+			arg_dyn_subtest[1] = strdup(dynbegin + 1);
 		}
 
 		for (i = 1; i < entry->subtest_count; i++) {
@@ -1547,13 +1558,18 @@ execute_test_process(int outfd, int errfd, int socketfd,
 
 			assert(dynbegin == NULL);
 
-			argv[2] = realloc(argv[2], argsize + sublen + 2);
-			argv[2][argsize] = ',';
-			strcpy(argv[2] + argsize + 1, sub);
+			arg_run_subtest[1] = realloc(arg_run_subtest[1], argsize + sublen + 2);
+			arg_run_subtest[1][argsize] = ',';
+			strcpy(arg_run_subtest[1] + argsize + 1, sub);
 			argsize += sublen + 1;
 		}
 	}
 
+	/* Build argv with only stuff that is set. */
+	for (size_t i = 0, j = 0; argv_refs[i]; i++)
+		if (*argv_refs[i])
+			argv[j++] = *argv_refs[i];
+
 	if (socketfd >= 0) {
 		struct runnerpacket *packet;
 
-- 
2.45.2

