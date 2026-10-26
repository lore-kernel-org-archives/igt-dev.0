Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D623606A31B
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LEueS2Zk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877E10E03B;
	Mon, 26 Oct 2026 14:20:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1331110E063
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 14:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793024271; x=1824560271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRlrI/xJTpHCOz7WgwR0j0FUxbi/aW0qxvRfPieZT5w=;
 b=LEueS2Zksm+MOpDf2LV3Cq2VmWfJhMUT9Ryq1B3ICXeIJodULFbHrqTl
 KEsqIyfLulbgE4UMD69+0X6B2Z09RbpoijFX41YrgA21s49d89zX4/lNX
 BefGo/6YpRcI0dHIHoH+98vkp4oTNSboeAbFhkfDmQt3ou07UFeIWaz/U
 Vep6WWZlwt07MdEt4yLtKDp50oWsq+/9L+0D4TCr3Qsl3+lPKqibb6SJE
 ZVDICWG0YJEOmVF+pWpDmnkarYy/aw9mJkVb+eYL+c1rgOWOR2S1S4tGC
 2QA4NaZ5/Ynt9NXZveYlqBxAvGCO6PJv4/0DCYyxH9sD+qLJvNMZGpDYK g==;
X-CSE-ConnectionGUID: DumuCOkIRcypGYeM9Pgi+g==
X-CSE-MsgGUID: ircR+kb5QPSymGqNkqXLVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1697969"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1697969"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:17:51 -0700
X-CSE-ConnectionGUID: 8KK4vC6TS7iI1TawTX69lQ==
X-CSE-MsgGUID: ATHzl9+hRF6plfHieYqRxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4285891"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.96])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:17:50 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/2] runner/executor: Build test command line before
 fork
Date: Mon, 26 Oct 2026 15:17:01 +0100
Message-ID: <20261026141702.44811-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
References: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Create a separate test command line building in main runner
process before forking, so it could be later processed for other
purposes like reporting.

v2: free cmd line before closing fd, rename label (Gustavo)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 68 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 25 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 8103c2a52..5bd95b929 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1618,28 +1618,29 @@ static int monitor_output(pid_t child,
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
@@ -1647,7 +1648,7 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		size_t i;
 
 		arg = strdup("--run-subtest");
-		igt_vec_push(&arg_vec, &arg);
+		igt_vec_push(arg_vec, &arg);
 
 		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
 			argsize = dynbegin - entry->subtests[0];
@@ -1670,35 +1671,49 @@ execute_test_process(int outfd, int errfd, int socketfd,
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
@@ -1776,6 +1791,7 @@ static int execute_next_entry(struct execute_state *state,
 			      bool *abort_already_written)
 {
 	int idirfd;
+	struct igt_vec arg_vec;
 	int outputs[_F_LAST];
 	int kmsgfd;
 	int outpipe[2] = { -1, -1 };
@@ -1829,6 +1845,7 @@ static int execute_next_entry(struct execute_state *state,
 		lseek(kmsgfd, 0, SEEK_END);
 	}
 
+	build_test_command(settings, entry, &arg_vec);
 
 	if (settings->log_level >= LOG_LEVEL_NORMAL) {
 		char buf[100];
@@ -1860,7 +1877,7 @@ static int execute_next_entry(struct execute_state *state,
 	if (child < 0) {
 		errf("Failed to fork: %m\n");
 		result = -1;
-		goto out_kmsgfd;
+		goto out_fork_failed;
 	} else if (child == 0) {
 		char envstring[16];
 
@@ -1880,7 +1897,7 @@ static int execute_next_entry(struct execute_state *state,
 		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
 		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
 
-		execute_test_process(outfd, errfd, socketfd, settings, entry);
+		execute_test_process(outfd, errfd, socketfd, settings, entry, &arg_vec);
 		/* unreachable */
 	}
 
@@ -1897,7 +1914,8 @@ static int execute_next_entry(struct execute_state *state,
 				outputs, time_spent, settings,
 				abortreason, abort_already_written);
 
-out_kmsgfd:
+out_fork_failed:
+	free_test_command(&arg_vec);
 	close(kmsgfd);
 out_pipe:
 	close(outpipe[0]);
-- 
2.55.0

