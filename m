Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE529CA0EE4
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 12:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6769510E0B8;
	Fri, 30 Aug 2024 12:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7qSEnHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692A910E0B8
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725021575; x=1756557575;
 h=message-id:date:mime-version:from:subject:in-reply-to:to:
 cc:content-transfer-encoding;
 bh=gXw1kZKiTSm2+V9s0aFsoOEFwp0yI/tEsLZEt6w/DC8=;
 b=R7qSEnHJqAkoSarVXlvGZ+0xhkv5+P204CWyzvMEyJMNWBtW0ZaFvPZn
 J74+Fp9xSxKKgbE15p83A1MtTYLwTxY71GVBqYvmpB0+u8MAGFoRBotLg
 qWlTqukv7R+2MsErA2KUrvYxSAPjq6Q7DHaXdGK+vhwkGvNyfr9PL0Sb9
 eOlMs1aJ2QWbAcXqRAsFNHKA19TS0CaZ/YupLB86JOdCDMHe1rLaaz7QJ
 3XKNEoDDeverj+NOkMBnOrElbrDPw7mezGgqpRbcC3GzstQ3oBS3VRSXT
 To9Pnizqc1t058ra0Bj6sG+oOdX+0JVSsWcEb5tLh2qXRRo4mGdcIEKm0 g==;
X-CSE-ConnectionGUID: 9obwUU7gQWySQVTOi6z3nQ==
X-CSE-MsgGUID: skDiO5aPScuiVOUWt0M1wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34326478"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="34326478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 05:39:34 -0700
X-CSE-ConnectionGUID: fuyLO/HTSlm5PYnd1p/Lrw==
X-CSE-MsgGUID: DOcPCKunTV2cfYTvqIrbHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68787141"
Received: from lgrunert-mobl.ger.corp.intel.com (HELO [10.251.221.29])
 ([10.251.221.29])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 05:39:32 -0700
Message-ID: <d74e812e-c29a-42b1-8dcd-4dd7575db45f@linux.intel.com>
Date: Fri, 30 Aug 2024 14:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v3] runner/executor: Detect when child process is killed
 by a signal
Content-Language: en-US
In-Reply-To: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Make igt-runner aware about tests being killed by signals. Before this
patch, manually killing a test process would result in igt-runner silently
marking the test as incomplete.

Now igt-runner aborts the run verbosely. As an example the following was
extracted from results.json:
 This test caused an abort condition: Test terminated by a signal -9

 v3: do not interfere with igt-runner killing tests due
     to timeout and diskspace
 v2: fix race condition

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>
---
 runner/executor.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..e680fd106 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -888,6 +888,7 @@ static int monitor_output(pid_t child,
 	const int interval_length = 1;
 	int wd_timeout;
 	int killed = 0; /* 0 if not killed, signal number otherwise */
+	bool child_reaped = false;
 	struct timespec time_beg, time_now, time_last_activity, time_last_subtest, time_killed;
 	unsigned long taints = 0;
 	bool aborting = false;
@@ -960,6 +961,28 @@ static int monitor_output(pid_t child,
 
 		igt_gettime(&time_now);
 
+		/* The loop will run again after igt-runner decides to kill the test
+		 * for timeout or disk space. Testing for !killed ensures we are not
+		 * prematurely aborting on that code path.
+		 */
+		if (!killed && (child == waitpid(child, &status, WNOHANG)))
+			child_reaped = true;
+
+		if (child_reaped) {
+			if(WIFSIGNALED(status)) {
+				/* The test terminated by a signal */
+
+				aborting = true;
+				killed = -WTERMSIG(status);
+
+				sprintf(buf, "Test terminated by a signal %d\n", killed);
+				errf("%s", buf);
+				*abortreason = strdup(buf);
+
+				break;
+			}
+		}
+
 		/* TODO: Refactor these handlers to their own functions */
 		if (outfd >= 0 && FD_ISSET(outfd, &set)) {
 			char *newline;
@@ -1241,7 +1264,11 @@ static int monitor_output(pid_t child,
 				errf("Error reading from signalfd: %m\n");
 				continue;
 			} else if (siginfo.ssi_signo == SIGCHLD) {
-				if (child != waitpid(child, &status, WNOHANG)) {
+				if (!child_reaped) {
+					if (child == waitpid(child, &status, WNOHANG))
+						child_reaped = true;
+				}
+				if (!child_reaped) {
 					errf("Failed to reap child\n");
 					status = 9999;
 				} else if (WIFEXITED(status)) {
-- 
2.34.1

