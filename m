Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A783C83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 15:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68FD10E7D2;
	Wed, 16 Jul 2025 15:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LV9enD0I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A224910E7D1
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752679884; x=1784215884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7kQhCQ5CaHbbYH/R0DJaUTFCXPP4HrxYQ78G7Uy6u9M=;
 b=LV9enD0IiJGtw5JTYIE+smc7TCKR5JEV5gVOXWO7V3oI9K0r9UXMH0DB
 ME9zX49nrZ87VDbibno+zYr58zgheKGIIjJofpF7315Td5f5DguQw3mcY
 KjrNhFhHwf1u+pJ1GD8p2TxcoJ9/ZRbk1qLOoAPYTZbE/XJVmGlfD5TlY
 cZG2dhAzZk2kCZmDiYrQR2D8swJPUo+ltBNZjub017N219WAsbLJSbr8B
 XJ1+XRC5X8V2mwxSEQIshwmeRWDEQKcT9g8w7c3yHh/MBVKsaiYzGEr8d
 tE1/SRfSL/mOo6akOOpvUR62UpwuPNvIuS4beDYkcvAR4l8YKue+m3QtO A==;
X-CSE-ConnectionGUID: nynaLxeoQiWcycETAtopig==
X-CSE-MsgGUID: BcOr7l+YRZqTBR+pnektNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54641821"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="54641821"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 08:31:24 -0700
X-CSE-ConnectionGUID: iCV2poZ6Rty+KZjRg6wEGA==
X-CSE-MsgGUID: GiT5k74+QMKWDTZF1I3/Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="156921040"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 08:31:23 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/2] runner/executor: Build test command line before
 fork
Date: Wed, 16 Jul 2025 17:31:01 +0200
Message-ID: <20250716153102.165779-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716153102.165779-1-kamil.konieczny@linux.intel.com>
References: <20250716153102.165779-1-kamil.konieczny@linux.intel.com>
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

Create a separate test command line building in main runner
process before forking, so it could be later processed for other
purposes like reporting.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 64 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 847abe481..7565f2571 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1615,28 +1615,29 @@ static int monitor_output(pid_t child,
 	return killed;
 }
 
-static void __attribute__((noreturn))
-execute_test_process(int outfd, int errfd, int socketfd,
-		     struct settings *settings,
-		     struct job_list_entry *entry)
+static void free_test_command(struct igt_vec *arg_vec)
 {
-	struct igt_vec arg_vec;
-	char *arg;
-	size_t rootlen;
+	for (size_t i = 0; i < igt_vec_length(arg_vec); i++)
+		free(*((char **)igt_vec_elem(arg_vec, i)));
 
-	dup2(outfd, STDOUT_FILENO);
-	dup2(errfd, STDERR_FILENO);
+	igt_vec_fini(arg_vec);
+}
 
-	setpgid(0, 0);
+static void build_test_command(struct settings *settings,
+			       struct job_list_entry *entry,
+			       struct igt_vec *arg_vec)
+{
+	size_t rootlen;
+	char *arg;
 
-	igt_vec_init(&arg_vec, sizeof(char *));
+	igt_vec_init(arg_vec, sizeof(char *));
 
 	rootlen = strlen(settings->test_root);
 	arg = malloc(rootlen + strlen(entry->binary) + 2);
 	strcpy(arg, settings->test_root);
 	arg[rootlen] = '/';
 	strcpy(arg + rootlen + 1, entry->binary);
-	igt_vec_push(&arg_vec, &arg);
+	igt_vec_push(arg_vec, &arg);
 
 	if (entry->subtest_count) {
 		size_t argsize;
@@ -1644,7 +1645,7 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		size_t i;
 
 		arg = strdup("--run-subtest");
-		igt_vec_push(&arg_vec, &arg);
+		igt_vec_push(arg_vec, &arg);
 
 		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
 			argsize = dynbegin - entry->subtests[0];
@@ -1667,35 +1668,49 @@ execute_test_process(int outfd, int errfd, int socketfd,
 			argsize += sublen + 1;
 		}
 
-		igt_vec_push(&arg_vec, &arg);
+		igt_vec_push(arg_vec, &arg);
 
 		if (dynbegin) {
 			arg = strdup("--dynamic-subtest");
-			igt_vec_push(&arg_vec, &arg);
+			igt_vec_push(arg_vec, &arg);
 			arg = strdup(dynbegin + 1);
-			igt_vec_push(&arg_vec, &arg);
+			igt_vec_push(arg_vec, &arg);
 		}
 	}
 
 	for (size_t i = 0; i < igt_vec_length(&settings->hook_strs); i++) {
 		arg = strdup("--hook");
-		igt_vec_push(&arg_vec, &arg);
+		igt_vec_push(arg_vec, &arg);
 		arg = strdup(*((char **)igt_vec_elem(&settings->hook_strs, i)));
-		igt_vec_push(&arg_vec, &arg);
+		igt_vec_push(arg_vec, &arg);
 	}
 
 	arg = NULL;
-	igt_vec_push(&arg_vec, &arg);
+	igt_vec_push(arg_vec, &arg);
+}
+
+static void __attribute__((noreturn))
+execute_test_process(int outfd, int errfd, int socketfd,
+		     struct settings *settings,
+		     struct job_list_entry *entry,
+		     struct igt_vec *arg_vec)
+{
+	char *arg;
+
+	dup2(outfd, STDOUT_FILENO);
+	dup2(errfd, STDERR_FILENO);
+
+	setpgid(0, 0);
 
 	if (socketfd >= 0) {
 		struct runnerpacket *packet;
 
-		packet = runnerpacket_exec(arg_vec.elems);
+		packet = runnerpacket_exec(arg_vec->elems);
 		write(socketfd, packet, packet->size);
 	}
 
-	arg = *((char **)igt_vec_elem(&arg_vec, 0));
-	execv(arg, arg_vec.elems);
+	arg = *((char **)igt_vec_elem(arg_vec, 0));
+	execv(arg, arg_vec->elems);
 	fprintf(stderr, "Cannot execute %s\n", arg);
 	exit(IGT_EXIT_INVALID);
 }
@@ -1772,6 +1787,7 @@ static int execute_next_entry(struct execute_state *state,
 			      char **abortreason,
 			      bool *abort_already_written)
 {
+	struct igt_vec arg_vec;
 	int dirfd;
 	int outputs[_F_LAST];
 	int kmsgfd;
@@ -1821,6 +1837,7 @@ static int execute_next_entry(struct execute_state *state,
 		lseek(kmsgfd, 0, SEEK_END);
 	}
 
+	build_test_command(settings, entry, &arg_vec);
 
 	if (settings->log_level >= LOG_LEVEL_NORMAL) {
 		char buf[100];
@@ -1871,7 +1888,7 @@ static int execute_next_entry(struct execute_state *state,
 		}
 		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
 
-		execute_test_process(outfd, errfd, socketfd, settings, entry);
+		execute_test_process(outfd, errfd, socketfd, settings, entry, &arg_vec);
 		/* unreachable */
 	}
 
@@ -1890,6 +1907,7 @@ static int execute_next_entry(struct execute_state *state,
 
 out_kmsgfd:
 	close(kmsgfd);
+	free_test_command(&arg_vec);
 out_pipe:
 	close(outpipe[0]);
 	close(outpipe[1]);
-- 
2.50.1

