Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45279CA101E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 06:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E4810E37C;
	Tue,  3 Sep 2024 06:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBgxrnqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C687D10E37C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 06:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725344369; x=1756880369;
 h=message-id:date:mime-version:from:subject:in-reply-to:to:
 cc:content-transfer-encoding;
 bh=6P/frHmCdEyxZ85qn2gYemI+SDUmEVPEkaoXo/Bs5cA=;
 b=YBgxrnqCXvuJtI8OxKWjyBV3n3JacZSvFFO1PhV1bGzXo5lLc92gbaXR
 OZmRFSsFh76zg8Kn5yPKSHx0F5ep508QFMZoD4KCviEcUcspeFzsp4Z5I
 l4fXghXjyV9WL+Uzpcgm1QDdDZHbB9H6T1TxRwyTy1mjvQOGUMIxnKwzp
 KSrAI5vm40B2YOyOu5sslzZcKgZ3BZoIziE7rJy6Se67ugTl5uVHNdXke
 uXXs30K+yd9l5yBB20nyfCV+KsYm7WtPCOgvA+HkLZFz8l3D+DIn09jF2
 +k4umy8WTT04tLvelcBqsjkvaQXloRWcVbQ5zt4s1g+xHDFw8eMenTAr2 w==;
X-CSE-ConnectionGUID: qex2k1PhRG2JAZpLTRa9Kg==
X-CSE-MsgGUID: 8X/DYYE0T7+x/jRLuhLVKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27800182"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="27800182"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 23:19:28 -0700
X-CSE-ConnectionGUID: yHEIcsZ5Qp+nGSWxbLY6gg==
X-CSE-MsgGUID: VwepGakrQGSmIRRpjxSXfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="102238826"
Received: from mmazarex-mobl.ger.corp.intel.com (HELO [10.251.221.62])
 ([10.251.221.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 23:19:27 -0700
Message-ID: <18d2557e-8373-40fd-a701-25f468d79979@linux.intel.com>
Date: Tue, 3 Sep 2024 08:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v4] runner/executor: Detect when child process is killed
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
 This test caused an abort condition: Test terminated by a signal Killed (-9): Killed

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
index ac73e1dde..4466461c1 100644
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
+			sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
+					strsignal(killed), -killed, sigdescr_np(killed));
+			errf("%s", buf);
+			*abortreason = strdup(buf);
+
+			break;
+		}
 	}
 
 	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
-- 
2.34.1

