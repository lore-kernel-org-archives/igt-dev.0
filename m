Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0402C83F0A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 12:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D99410E051;
	Thu, 29 Aug 2024 12:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxEtG92M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A9D10E051
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724933606; x=1756469606;
 h=message-id:date:mime-version:from:subject:in-reply-to:to:
 cc:content-transfer-encoding;
 bh=3F2M0Vq1hBw77Ume6D8/9XhaQLFfLPKRJZUuLj58epc=;
 b=TxEtG92MxQtCniD0UAC+HsPSvy+D0dxxYrA+W6Ke7xwXLP3fTKYVPJPY
 4J6OweGc2a5yM3SogNBdEd7sK45CKp4dbPU0k/d2/49ouRkcmw5K/vOxr
 SrqaTBYTSYk4pVlQ6U1QalKq+cRmCvNpZdBDSUAmpEGwIQIriSCUpOtHv
 Zo/b+Z2bpP+VjP14jC+fRBMYCazFSZU3+HhpuWmmjmBYgRIOeabWPDpY9
 ihUMKugkTTCfbDIteH+RUL6arcJYUnrjS4uK9cb+FpEzRwdZX4+nwhK80
 hRl3zFigXmpgrk8dAXtVhGoF1X6kpyNE92t1FWbjteHL+A+84kFUtpwcW Q==;
X-CSE-ConnectionGUID: TfFDPFNuQZOVWwXE+smFzQ==
X-CSE-MsgGUID: D1zxK2RfQwq8CoCiRTi/DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34132690"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34132690"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 05:13:26 -0700
X-CSE-ConnectionGUID: 9jFBF+TxTnie0hug/luMbA==
X-CSE-MsgGUID: uzcYOeHsSlC99DyVkiQ+dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="63244048"
Received: from rromines-mobl1.ger.corp.intel.com (HELO [10.251.220.222])
 ([10.251.220.222])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 05:13:25 -0700
Message-ID: <c61aa457-b2b3-45a5-90ed-a8d0af4f700d@linux.intel.com>
Date: Thu, 29 Aug 2024 14:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v2] runner/executor: Detect when child process is killed
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

v2: fix race condition

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>
---
 runner/executor.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..5f653b0d4 100644
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
@@ -960,6 +961,24 @@ static int monitor_output(pid_t child,
 
 		igt_gettime(&time_now);
 
+		if (child == waitpid(child, &status, WNOHANG))
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
@@ -1241,7 +1260,11 @@ static int monitor_output(pid_t child,
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

