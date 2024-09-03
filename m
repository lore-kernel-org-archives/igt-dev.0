Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F3FCD3420
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 12:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B9110E51B;
	Tue,  3 Sep 2024 12:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ev32vM2m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF11410E519
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 12:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725365114; x=1756901114;
 h=message-id:date:mime-version:from:subject:in-reply-to:to:
 cc:content-transfer-encoding;
 bh=PZTKYp9w+lr3qqzru2B88Pms9SZSF1ie2/xBd0Zbw+4=;
 b=ev32vM2mSnEbGv/yjoOU4dxMVD79EowhrJ5iFazvuRLR4WHohuvlJIms
 gQMnDUDvoZP80xBmYCVegXhvWJuXs6z1cS/+A5umwJrVxiJJAEJj2Ovco
 OaHuHmZxlhRJsLiBlFY0NUe+wsn/aygbkWp5DhKo5QVJB67Bt/6Uj5QSf
 87pVC9ucMr/j1C+yuvNc6LPQhMxkHves3gNoUH9BaiSDGuSNhDgYyfosw
 JuZ7WXphjCyq1+RbzmE8fZ6p4E7V7qSyzL0siraGhOX5zVU7pg1eLahGj
 UIQKKil/KzzX2UVXnl69E/oXlum+uA1NH8JvCw4WVxotelBlgUCEA+nIA w==;
X-CSE-ConnectionGUID: rFW0cj/XT+iqj12NZXtWKg==
X-CSE-MsgGUID: WaYUam1cTdeUB2kY+8AJ+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41428394"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="41428394"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:05:14 -0700
X-CSE-ConnectionGUID: IRHMGGf3QEmfmXXrYLbIaw==
X-CSE-MsgGUID: 8cquC7FgSMKNE+jAo3S+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64528768"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.251.221.173])
 ([10.251.221.173])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:05:12 -0700
Message-ID: <4c126777-6899-407c-911f-27e25ca8191e@linux.intel.com>
Date: Tue, 3 Sep 2024 14:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v5] runner/executor: Detect when child process is killed
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

Make igt-runner aware about tests being killed by signals. Before this
patch, manually killing a test process would result in igt-runner silently
marking the test as incomplete.

Now igt-runner aborts the run verbosely. As an example the following was
extracted from results.json:
 This test caused an abort condition: Test terminated by a signal Killed (-9).

 v5: do not use sigdescr_np() as it seems to be a fairly new lib function that does
     not compile on older Ubuntu
 v4: improve abort code path to not interfere with igt-runner timeouts
 v3: do not interfere with igt-runner killing tests due to timeout and diskspace
 v2: fix race condition

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>
---
 runner/executor.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..990d932f3 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -888,6 +888,8 @@ static int monitor_output(pid_t child,
 	const int interval_length = 1;
 	int wd_timeout;
 	int killed = 0; /* 0 if not killed, signal number otherwise */
+	bool child_reaped = false;
+	bool child_killed_by_signal = false;
 	struct timespec time_beg, time_now, time_last_activity, time_last_subtest, time_killed;
 	unsigned long taints = 0;
 	bool aborting = false;
@@ -960,6 +962,25 @@ static int monitor_output(pid_t child,
 
 		igt_gettime(&time_now);
 
+		/* Testing for !killed to prevent aborting too early after igt-runner
+		 * decides to kill a process.
+		 */
+		if (!killed && (child == waitpid(child, &status, WNOHANG))) {
+			child_reaped = true;
+			if (WIFSIGNALED(status)) {
+				child_killed_by_signal = true;
+				killed = WTERMSIG(status);
+
+				/*
+				 * Do not abort just yet, because igt-runner can kill the test
+				 * due to a timeout for example. Aborting here prevents
+				 * igt-runner from reporting a timeout. The code that aborts
+				 * the run after the test was killed is at the end of the
+				 * while() loop.
+				 */
+			}
+		}
+
 		/* TODO: Refactor these handlers to their own functions */
 		if (outfd >= 0 && FD_ISSET(outfd, &set)) {
 			char *newline;
@@ -1241,7 +1262,11 @@ static int monitor_output(pid_t child,
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
@@ -1483,6 +1508,17 @@ static int monitor_output(pid_t child,
 				return -1;
 			time_killed = time_now;
 		}
+
+		if (child_killed_by_signal) {
+			aborting = true;
+
+			sprintf(buf, "Test terminated by a signal %s (%d).\n",
+					strsignal(killed), -killed);
+			errf("%s", buf);
+			*abortreason = strdup(buf);
+
+			break;
+		}
 	}
 
 	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
-- 
2.34.1

