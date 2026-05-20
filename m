Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A36CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 15:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AD410E40B;
	Wed, 20 May 2026 15:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hX/BsLq6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8B610E569
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779292196; x=1810828196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SkeHHquGr+wgwxZ6npYpIq4yKb0KyHd5TNC9q4LlYQc=;
 b=hX/BsLq64BorjULcnQkuAJmZogChq+dxcO3Q/mIKhSL+4OaGx8Exq7tv
 LaD7wcbeVNWD2IaS4m3AJSBd4HukdSFEDQhZ4aPBZNGCfYkRVo1kJsY/7
 mTgn7F/WuTD3IeGgvOp81cpLewppPt7gmqJd6pIhZsaOxPDeWhXP3geUy
 ee3XtAOguWLAIrN25DXfpP2GC+1MwoAc22qPryW2gv6MB2T49abaTcfdN
 zYs8bO5Uq4BJAMgLxDzlhaPWbRepiWBOZFWXxcID30YVOLEE5uPsYsVji
 EsFn8S9gM+ryyPT+tGAkdfp/A/Iykxql5bZXtCgasUghShNXRm6NSnni3 g==;
X-CSE-ConnectionGUID: g4uyYcbET9K1cbfhcQM1/A==
X-CSE-MsgGUID: uvk4EZFgS4GwBYU7+30mig==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80162355"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80162355"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:49:56 -0700
X-CSE-ConnectionGUID: Nf3XedAPR8a+uCSatUMrSg==
X-CSE-MsgGUID: WoSNlIeZRBOH+jEvqotOzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="245232667"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.126])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:49:55 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/4] runner/executor: Create temporary unlimited
 dmesg save
Date: Wed, 20 May 2026 17:49:43 +0200
Message-ID: <20260520154947.116726-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
References: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
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

Scan incoming dmesg message for '[IGT] ulimit' and if seen lift
disk limit for this particular test. Later on results will take
following params and create a report within limits, either by
dropping lines matched by regex or by taking only a few
important parts from it.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 847abe481..a95d278bd 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -638,7 +638,7 @@ const char *get_out_filename(int fid)
 }
 
 /* Returns the number of bytes written to disk, or a negative number on error */
-static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
+static long dump_dmesg(int kmsgfd, int outfd, ssize_t size, bool *ulimit)
 {
 	/*
 	 * Write kernel messages to the log file until we reach
@@ -653,7 +653,7 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 	unsigned long long seq, cmpseq, usec;
 	bool underflow_once = false;
 	char cont;
-	char buf[2048];
+	char buf[4096];
 	ssize_t r;
 	long written = 0;
 
@@ -690,7 +690,7 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 			}
 		}
 
-		r = read(kmsgfd, buf, sizeof(buf));
+		r = read(kmsgfd, buf, sizeof(buf) - 1);
 		if (r < 0) {
 			if (errno == EPIPE) {
 				if (!underflow_once) {
@@ -714,6 +714,10 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 		write(outfd, buf, r);
 		written += r;
 
+		buf[r] = '\0';
+		if (strstr(buf, "[IGT] ulimit"))
+			*ulimit = true;
+
 		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
 					    &flags, &seq, &usec, &cont) == 4) {
 			/*
@@ -820,11 +824,11 @@ static const char *show_kernel_task_state(const char *msg)
 	return msg;
 }
 
-static bool disk_usage_limit_exceeded(struct settings *settings,
+static bool disk_usage_limit_exceeded(size_t disk_limit,
 				      size_t disk_usage)
 {
-	return settings->disk_usage_limit != 0 &&
-		disk_usage > settings->disk_usage_limit;
+	return disk_limit != 0 &&
+		disk_usage > disk_limit;
 }
 
 static const char *need_to_timeout(struct settings *settings,
@@ -833,7 +837,8 @@ static const char *need_to_timeout(struct settings *settings,
 				   double time_since_activity,
 				   double time_since_subtest,
 				   double time_since_kill,
-				   size_t disk_usage)
+				   size_t disk_usage,
+				   size_t disk_limit)
 {
 	int decrease = 1;
 
@@ -896,7 +901,7 @@ static const char *need_to_timeout(struct settings *settings,
 		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
 	}
 
-	if (disk_usage_limit_exceeded(settings, disk_usage))
+	if (disk_usage_limit_exceeded(disk_limit, disk_usage))
 		return "Disk usage limit exceeded.\n";
 
 	return NULL;
@@ -984,6 +989,8 @@ static int monitor_output(pid_t child,
 	long dmesgwritten;
 	bool socket_comms_used = false; /* whether the test actually uses comms */
 	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
+	bool disk_limit = settings->disk_usage_limit;
+	bool unlimit;
 
 	runner_gettime(&time_beg);
 	time_last_activity = time_last_subtest = time_killed = time_beg;
@@ -1307,9 +1314,13 @@ static int monitor_output(pid_t child,
 	socket_end:
 
 		if (kmsgfd >= 0 && FD_ISSET(kmsgfd, &set)) {
+			unlimit = false;
 			time_last_activity = time_now;
 
-			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
+			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size, &unlimit);
+			if (unlimit)
+				disk_limit = 0;
+
 			if (settings->sync)
 				fdatasync(outputs[_F_DMESG]);
 
@@ -1462,7 +1473,7 @@ static int monitor_output(pid_t child,
 				 * Same goes for stopping because we
 				 * exceeded the disk usage limit.
 				 */
-				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
+				if (killed && disk_usage_limit_exceeded(disk_limit, disk_usage)) {
 					timeoutresult = false;
 
 					if (socket_comms_used) {
@@ -1537,7 +1548,7 @@ static int monitor_output(pid_t child,
 						 igt_time_elapsed(&time_last_activity, &time_now),
 						 igt_time_elapsed(&time_last_subtest, &time_now),
 						 igt_time_elapsed(&time_killed, &time_now),
-						 disk_usage);
+						 disk_usage, disk_limit);
 
 		if (timeout_reason) {
 			if (killed == SIGKILL) {
@@ -1552,8 +1563,8 @@ static int monitor_output(pid_t child,
 					asprintf(abortreason, "Child refuses to die, tainted 0x%lx.", taints);
 				}
 
-				dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
-				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
+				dmsg_chunk_size = calc_last_dmesg_chunk(disk_limit, disk_usage);
+				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size, &unlimit);
 				if (settings->sync)
 					fdatasync(outputs[_F_DMESG]);
 
@@ -1583,13 +1594,13 @@ static int monitor_output(pid_t child,
 		}
 	}
 
-	dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
-	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
+	dmsg_chunk_size = calc_last_dmesg_chunk(disk_limit, disk_usage);
+	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size, &unlimit);
 	if (settings->sync)
 		fdatasync(outputs[_F_DMESG]);
 	if (dmesgwritten > 0) {
 		disk_usage += dmesgwritten;
-		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
+		if (disk_limit && disk_usage > disk_limit) {
 			char disk[1024];
 
 			snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded at dmesg dump, %zu > %zu\n", disk_usage, settings->disk_usage_limit);
-- 
2.54.0

