Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EC2C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 15:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DE2890BB;
	Wed, 16 Jul 2025 15:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKSERWBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5945890BB
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 15:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752679888; x=1784215888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=913qcBpryMxmTcADGiA0nr8M0rSPVN6aarxMV7O8nlI=;
 b=cKSERWBmMRCpaOXk1nyzfUA1ziIKbtHM36T2TmboYm4PzCWEnIiefl+6
 szNr5nZ0A7YXErNjT/CS98/l8i5zPqLYvmq/BV+rgYAVdBnszt9TudaeK
 5sCR1343Q/oixQYHlJ/BkfYNG7CuCnYTRPnKYQXy8B97wIofv/gd88uiv
 EaSUmsNJYWntm7SYnwAH9z4i2Mohiqv7ZPFAwALGCXqjSkDxUFQpcuwA8
 UZOodEs4wrAvQDsEgg6lzGBPwmQncOVuBMD9qngOdQ9Wj2Q7Z4HOlYsuR
 GGixrVFlVhXDNA1BUaqMvcZx0eeNNIp1iLfHH8qXqFq5u9mBRWbgUe1dX Q==;
X-CSE-ConnectionGUID: a8MQCU/VRLaaP9E91otSIw==
X-CSE-MsgGUID: WTv4pMpRQmaxX8Qaa16JSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54641830"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="54641830"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 08:31:28 -0700
X-CSE-ConnectionGUID: TtaxuUnqQXWhlwZ3Y6DzNA==
X-CSE-MsgGUID: sF6En+tGQbGvPPRjmCLC6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="156921044"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 08:31:27 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] runner/executor: Report command used for test
 exec
Date: Wed, 16 Jul 2025 17:31:02 +0200
Message-ID: <20250716153102.165779-3-kamil.konieczny@linux.intel.com>
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

Add printing of command line used for executing a test, when
the log level is normal or above.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 7565f2571..6ee446cdb 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1623,17 +1623,20 @@ static void free_test_command(struct igt_vec *arg_vec)
 	igt_vec_fini(arg_vec);
 }
 
-static void build_test_command(struct settings *settings,
-			       struct job_list_entry *entry,
-			       struct igt_vec *arg_vec)
+static char *build_test_command(struct settings *settings,
+				struct job_list_entry *entry,
+				struct igt_vec *arg_vec)
 {
+	char *cmd_line;
+	size_t cmd_size;
 	size_t rootlen;
 	char *arg;
 
 	igt_vec_init(arg_vec, sizeof(char *));
 
 	rootlen = strlen(settings->test_root);
-	arg = malloc(rootlen + strlen(entry->binary) + 2);
+	cmd_size = rootlen + strlen(entry->binary) + 2;
+	arg = malloc(cmd_size);
 	strcpy(arg, settings->test_root);
 	arg[rootlen] = '/';
 	strcpy(arg + rootlen + 1, entry->binary);
@@ -1645,6 +1648,7 @@ static void build_test_command(struct settings *settings,
 		size_t i;
 
 		arg = strdup("--run-subtest");
+		cmd_size += strlen(arg) + 1;
 		igt_vec_push(arg_vec, &arg);
 
 		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
@@ -1668,25 +1672,47 @@ static void build_test_command(struct settings *settings,
 			argsize += sublen + 1;
 		}
 
+		cmd_size += strlen(arg) + 1;
 		igt_vec_push(arg_vec, &arg);
 
 		if (dynbegin) {
 			arg = strdup("--dynamic-subtest");
+			cmd_size += strlen(arg) + 1;
 			igt_vec_push(arg_vec, &arg);
+
 			arg = strdup(dynbegin + 1);
+			cmd_size += strlen(arg) + 1;
 			igt_vec_push(arg_vec, &arg);
 		}
 	}
 
 	for (size_t i = 0; i < igt_vec_length(&settings->hook_strs); i++) {
 		arg = strdup("--hook");
+		cmd_size += strlen(arg) + 1;
 		igt_vec_push(arg_vec, &arg);
 		arg = strdup(*((char **)igt_vec_elem(&settings->hook_strs, i)));
+		cmd_size += strlen(arg) + 1;
 		igt_vec_push(arg_vec, &arg);
 	}
 
+	cmd_size *= 2;
+	cmd_line = malloc(cmd_size);
+	if (cmd_line) {
+		char *elem;
+		int len;
+
+		elem = *((char **)igt_vec_elem(arg_vec, 0));
+		len = snprintf(cmd_line, cmd_size, "%s", elem);
+		for (size_t i = 1; i < igt_vec_length(arg_vec) && len < cmd_size; i++) {
+			elem = *((char **)igt_vec_elem(arg_vec, i));
+			len += snprintf(cmd_line + len, cmd_size - len, " %s", elem);
+		}
+	}
+
 	arg = NULL;
 	igt_vec_push(arg_vec, &arg);
+
+	return cmd_line;
 }
 
 static void __attribute__((noreturn))
@@ -1788,6 +1814,7 @@ static int execute_next_entry(struct execute_state *state,
 			      bool *abort_already_written)
 {
 	struct igt_vec arg_vec;
+	char *cmd_line;
 	int dirfd;
 	int outputs[_F_LAST];
 	int kmsgfd;
@@ -1837,7 +1864,7 @@ static int execute_next_entry(struct execute_state *state,
 		lseek(kmsgfd, 0, SEEK_END);
 	}
 
-	build_test_command(settings, entry, &arg_vec);
+	cmd_line = build_test_command(settings, entry, &arg_vec);
 
 	if (settings->log_level >= LOG_LEVEL_NORMAL) {
 		char buf[100];
@@ -1856,6 +1883,8 @@ static int execute_next_entry(struct execute_state *state,
 		free(displayname);
 
 		outf("%s\n", buf);
+		if (cmd_line)
+			outf("Exec test: %s\n", cmd_line);
 	}
 
 	/*
@@ -1908,6 +1937,8 @@ static int execute_next_entry(struct execute_state *state,
 out_kmsgfd:
 	close(kmsgfd);
 	free_test_command(&arg_vec);
+	if (cmd_line)
+		free(cmd_line);
 out_pipe:
 	close(outpipe[0]);
 	close(outpipe[1]);
-- 
2.50.1

