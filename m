Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C25C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 16:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298E910EA66;
	Fri, 28 Mar 2025 16:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drAqNSZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9069F10EA66
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 16:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743179661; x=1774715661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LOianbrWj0KEzLNZeuI0aD+vNMP3UlvX9FDGJC/+EBk=;
 b=drAqNSZLMerkYEHZb+pUrmxdtE3L6XJSTKk7p4gPYwojbWTkphf+bAkM
 1yvpfVSCkuPUK0p6R+4OikQXAe/8qU1nZIyRw7WiykXZTFxCzzELr3r+j
 UFmPyyu2mqG5bdJP2b4Jv5Oi96PbEeJ0WwTZIA75AMrEHBQVf98SnEUb1
 EUqOHxZX1id608Ico4NTvtElpmvvTwvFbUOxxTidh1C6jfVs2cdLkwLEG
 d/1nhW5k+xtUE0mlXBn2+kWjRpCVJKP86m8gjXA1yvmEB3XY0UZyyrIH9
 eYrO5dokubTs/Fm+36OsBkSr3bgudg6G/AcWRvCGafTehXYXm9wl8d8YS A==;
X-CSE-ConnectionGUID: 16mp227TR7+WQIPCGv+STQ==
X-CSE-MsgGUID: 9MKyWH+YQD+BU/zVFbkRNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44676534"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44676534"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:34:21 -0700
X-CSE-ConnectionGUID: xhHz5DYCTgG4Sbd8oS3d9g==
X-CSE-MsgGUID: gaI69xsMSEa6u9KA8ntupg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130699218"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.53])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:34:20 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Karol Krol <karol.krol@intel.com>
Subject: [PATCH i-g-t v1 1/1] runner/executor: Use bootime for time checks
Date: Fri, 28 Mar 2025 17:33:42 +0100
Message-ID: <20250328163342.119140-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328163342.119140-1-kamil.konieczny@linux.intel.com>
References: <20250328163342.119140-1-kamil.konieczny@linux.intel.com>
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

Runner is printing time to stdout/stderr with CLOCK_BOOTTIME but
when measuring time for a test it is using an igt library which
uses CLOCK_MONOTONIC. This leads to an errors when calculating
time left for tests using suspend or hibernate. For example log:

[77.376851] [020/123] (932s left) kms_flip (2x-flip-vs-suspend)
[77.592412] Starting subtest: 2x-flip-vs-suspend
[77.604996] Starting dynamic subtest: AB-DP2-HDMI-A3
[115.135795] Dynamic subtest AB-DP2-HDMI-A3: SUCCESS (6.776s)

shows test runs for around 6 seconds, while wall time shows
it took around 38 seconds.

  Create a separate, runner specific function for time measure
and use it where current time is needed.

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Reported-by: Karol Krol <karol.krol@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 9c8bf90f0..30e2420af 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -47,6 +47,12 @@ static struct {
 	size_t num_dogs;
 } watchdogs;
 
+static void runner_gettime(struct timespec *tv)
+{
+	if (clock_gettime(CLOCK_BOOTTIME, tv))
+		clock_gettime(CLOCK_REALTIME, tv);
+}
+
 __attribute__((format(printf, 2, 3)))
 static void __logf__(FILE *stream, const char *fmt, ...)
 {
@@ -54,8 +60,7 @@ static void __logf__(FILE *stream, const char *fmt, ...)
 	struct timespec tv;
 	va_list ap;
 
-	if (clock_gettime(CLOCK_BOOTTIME, &tv))
-		clock_gettime(CLOCK_REALTIME, &tv);
+	runner_gettime(&tv);
 	fprintf(stream, "[%ld.%06ld] ", tv.tv_sec, tv.tv_nsec / 1000);
 
 	va_start(ap, fmt);
@@ -961,7 +966,7 @@ static int monitor_output(pid_t child,
 	bool socket_comms_used = false; /* whether the test actually uses comms */
 	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
 
-	igt_gettime(&time_beg);
+	runner_gettime(&time_beg);
 	time_last_activity = time_last_subtest = time_killed = time_beg;
 
 	if (errfd > nfds)
@@ -1024,7 +1029,7 @@ static int monitor_output(pid_t child,
 			return -1;
 		}
 
-		igt_gettime(&time_now);
+		runner_gettime(&time_now);
 
 		/* TODO: Refactor these handlers to their own functions */
 		if (outfd >= 0 && FD_ISSET(outfd, &set)) {
-- 
2.49.0

