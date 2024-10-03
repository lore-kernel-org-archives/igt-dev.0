Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF74CF34A9
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 13:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EB310E242;
	Thu,  3 Oct 2024 13:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nqnfqx1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE12510E242
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727962062; x=1759498062;
 h=message-id:date:mime-version:from:subject:in-reply-to:to:
 cc:content-transfer-encoding;
 bh=ug6FllTvJyB/l+1WJAthYNQuqpdlY0FBtunlPrX7Jm4=;
 b=Nqnfqx1DXzIkpDjPLFpynm4h7xF0vLf0y/KyB1FKWBjLRf83z4r9QSVZ
 FUe40fttzzygthaQ89liFzqabOFXhv+nLxXb5qOZ/SqaqQBpJl5CwkFnE
 c5rVFfG6nSd0wJhKuyL2gdBWe56XeemJCKsVa0CGFUJiBH3yYd45Nrz5a
 QJBLpSG5Cz15AeTjgMNAqT7qcnALDDEFEauNUJrZR1mWFM3FIu24lQkCZ
 kTAE/ckNXYzksMQQXIghCsGtJ0Hg5SRrZDJ034YHAE7gr9Lelmht0d7EW
 LJ3hLLSU4H2CNdy28quIC+iNcInSE6c/r+B1k5VaL2MY/EomYztYtMUk3 g==;
X-CSE-ConnectionGUID: W6FgvlbfTD2ofmdel9sy6w==
X-CSE-MsgGUID: yGXVxtrCQvycY7uDpPvMkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="52561252"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="52561252"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 06:27:41 -0700
X-CSE-ConnectionGUID: /jYoLM2VQ0+gucjbajVHaQ==
X-CSE-MsgGUID: Ny/v+v2nRBOk/zkxtyeggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="105119388"
Received: from amarkelo-mobl.ger.corp.intel.com (HELO [10.213.201.3])
 ([10.213.201.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 06:27:40 -0700
Message-ID: <999b078d-4338-4158-915e-3bc83338f4e1@linux.intel.com>
Date: Thu, 3 Oct 2024 15:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v6] runner/executor: Abort when child process is killed
 by a signal
Content-Language: en-US
In-Reply-To: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
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

Manually killing a test process results in igt-runner silently marking the
test as incomplete. Change the behavior to abort verbosely when a test is
killed.

In order for the new behavior to work, child termination is probed on
every iteration of the while loop inside monitor_output(). Add the
bool test_timed_out to track when igt_runner is intentionally terminating
a test, and do not interfere with it.

Tested by:
 - using the --per-test-timeout flag and checking that results.json labels
   the test as a timeout.
 - manually killing a test process and checking that results.json labels
   the test as an abort with a message stating the test was killed.

 v6: - clear code comments
     - move child termination probing closer to where sigfd is handled
     - add a bool test_timed_out to ensure we will not interfere with
       igt_runner intentionally killing tests.
     - move the aborting code to outside the while loop

 v5: do not use sigdescr_np() as it seems to be a fairly new lib function
     that does not compile on older Ubuntu
 v4: improve abort code path to not interfere with igt-runner timeouts
 v3: do not interfere with igt-runner killing tests due to timeout and
     diskspace
 v2: fix race condition

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 runner/executor.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..69b4ed939 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -888,12 +888,15 @@ static int monitor_output(pid_t child,
 	const int interval_length = 1;
 	int wd_timeout;
 	int killed = 0; /* 0 if not killed, signal number otherwise */
+	bool child_reaped = false;
+	bool child_killed_by_signal = false;
 	struct timespec time_beg, time_now, time_last_activity, time_last_subtest, time_killed;
 	unsigned long taints = 0;
 	bool aborting = false;
 	size_t disk_usage = 0;
 	bool socket_comms_used = false; /* whether the test actually uses comms */
 	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
+	bool test_timed_out = false;
 
 	igt_gettime(&time_beg);
 	time_last_activity = time_last_subtest = time_killed = time_beg;
@@ -1233,6 +1236,14 @@ static int monitor_output(pid_t child,
 			}
 		}
 
+		/* Always check for abort conditions */
+		if (child == waitpid(child, &status, WNOHANG)) {
+			child_reaped = true;
+			if (WIFSIGNALED(status)) {
+				child_killed_by_signal = true;
+				killed = WTERMSIG(status);
+			}
+		}
 		if (sigfd >= 0 && FD_ISSET(sigfd, &set)) {
 			double time;
 
@@ -1241,7 +1252,12 @@ static int monitor_output(pid_t child,
 				errf("Error reading from signalfd: %m\n");
 				continue;
 			} else if (siginfo.ssi_signo == SIGCHLD) {
-				if (child != waitpid(child, &status, WNOHANG)) {
+				if (!child_reaped) {
+					/* Was child killed since we last checked? */
+					if (child == waitpid(child, &status, WNOHANG))
+						child_reaped = true;
+				}
+				if (!child_reaped) {
 					errf("Failed to reap child\n");
 					status = 9999;
 				} else if (WIFEXITED(status)) {
@@ -1303,7 +1319,6 @@ static int monitor_output(pid_t child,
 							fdatasync(outputs[_F_JOURNAL]);
 					}
 				}
-
 				aborting = true;
 				killed = SIGQUIT;
 				if (!kill_child(killed, child))
@@ -1447,6 +1462,7 @@ static int monitor_output(pid_t child,
 						 disk_usage);
 
 		if (timeout_reason) {
+			test_timed_out = true;
 			if (killed == SIGKILL) {
 				/* Nothing that can be done, really. Let's tell the caller we want to abort. */
 
@@ -1485,6 +1501,15 @@ static int monitor_output(pid_t child,
 		}
 	}
 
+	if (!test_timed_out && child_killed_by_signal) {
+		sprintf(buf, "Test terminated by a signal %s (%d).\n",
+				strsignal(killed), -killed);
+		errf("%s", buf);
+
+		*abortreason = strdup(buf);
+		aborting = true;
+	}
+
 	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
 	if (settings->sync)
 		fdatasync(outputs[_F_DMESG]);
-- 
2.34.1

