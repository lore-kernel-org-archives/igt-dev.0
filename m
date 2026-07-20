Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F90C44520
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 16:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5B010E9E5;
	Mon, 20 Jul 2026 16:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVULbwmS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA6310E9D0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 16:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784564134; x=1816100134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eCgP9QTTIZAeU/yQAg4htdw3bUdhDYzznH2dRuq8b5c=;
 b=TVULbwmSZSGaHizy0PWR+JI3zTzhYL6VaCcjqahn6PY6dLvYO9+kpUR6
 oH+4tW+afpswqKLQHeN9vLlFSYDrlu3KFG1aWggqxPOXqypFT+tYPYmuw
 T3oVhg9Z2z1gNHXWzCL350DpUoxolz+xHVTDt2BYAXTaYCfXaLzZbLZUW
 rAIuiUK0qqnp4mffX5ezRwWso3IWccJr2EDL1jFzRRkSHYnzeMNHadWK9
 oOkpsT+9LdTjxzMEMmyww+WJmIM78ENw7bL9qKPL4aL0vAJZYKjdRbu3m
 zb8b8aBCH5Q4sIZsaqwazkaQo5wh7JN/x5ECZcipozGSg5fRj5pLq9Q3Q w==;
X-CSE-ConnectionGUID: PtJ3JfnyQTuZ/biGberOjg==
X-CSE-MsgGUID: 61enaHnYQsSvtImVzqo1Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95743141"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="95743141"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 09:15:34 -0700
X-CSE-ConnectionGUID: dfz9PO2LSxuvREQX/3aOQg==
X-CSE-MsgGUID: hb2R5zVDQ8enup8ZcedyYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="281975825"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 09:15:33 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/2] runner: Create results after each tests end
Date: Mon, 20 Jul 2026 18:15:25 +0200
Message-ID: <20260720161526.64709-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260720161526.64709-1-kamil.konieczny@linux.intel.com>
References: <20260720161526.64709-1-kamil.konieczny@linux.intel.com>
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

Sometimes it is desireable to have results present after an
execution of each test, so if any unexpected reboot happen, there
is at least result with already executed ones. Before creating
new results.json, previous one from test before is saved into
results.old file.

This will have one drawback of not containing any info about last
test which causes sudden machine reboot.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c  | 50 ++++++++++++++++++++++++++++++++++++++++++----
 runner/resultgen.c |  6 +++++-
 2 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index a8907c575..b204fdffc 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -41,6 +41,7 @@
 #include "executor.h"
 #include "kmemleak.h"
 #include "output_strings.h"
+#include "resultgen.h"
 #include "runnercomms.h"
 
 #define KMSG_HEADER "[IGT] "
@@ -2466,6 +2467,40 @@ static int open_comms_if_valid(int resdirfd, size_t testidx)
 	return -1;
 }
 
+static void write_endtime(int resdirfd, double a_time)
+{
+	int timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666);
+
+	if (timefd >= 0) {
+		dprintf(timefd, "%f\n", a_time);
+		close(timefd);
+	}
+}
+
+static bool generate_results_with_endtime(int resdirfd, struct settings *settings)
+{
+	char *results_path = settings->results_path;
+	double beg_time = timeofday_double();
+	double end_time;
+	bool ret;
+
+	remove_file(resdirfd, "results.bak");
+	renameat(resdirfd, "results.json", resdirfd, "results.bak");
+
+	write_endtime(resdirfd, beg_time);
+	ret = generate_results_path(results_path);
+	if (settings->sync)
+		fsync(resdirfd);
+
+	end_time = timeofday_double();
+	if (settings->log_level >= LOG_LEVEL_NORMAL) {
+		outf("generating results took: %.6ffs\n", end_time - beg_time);
+		fflush(stdout);
+	}
+
+	return ret;
+}
+
 bool execute(struct execute_state *state,
 	     struct settings *settings,
 	     struct job_list *job_list)
@@ -2718,8 +2753,18 @@ bool execute(struct execute_state *state,
 			if (!initialize_execute_state_from_resume(resdirfd, state, settings, job_list))
 				return false;
 			state->time_left = time_left;
+			/* it should check option, also measure time taken */
+			if (!generate_results_with_endtime(resdirfd, settings))
+				return false;
+
 			return execute(state, settings, job_list);
 		}
+
+		/* it should check option, also measure time taken */
+		if (!generate_results_with_endtime(resdirfd, settings)) {
+			status = false;
+			break;
+		}
 	}
 
 	/* Collect facts after the last test runs */
@@ -2731,10 +2776,7 @@ bool execute(struct execute_state *state,
 				     settings->kmemleak_each, settings->sync))
 			errf("Failed to collect kmemleak logs after the last test\n");
 
-	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
-		dprintf(timefd, "%f\n", timeofday_double());
-		close(timefd);
-	}
+	write_endtime(resdirfd, timeofday_double());
 
  end:
 	if (settings->enable_code_coverage && !settings->cov_results_per_test) {
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 1ee167fb0..f5a91f542 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -2555,9 +2555,13 @@ bool generate_results(int dirfd)
 bool generate_results_path(char *resultspath)
 {
 	int dirfd = open(resultspath, O_DIRECTORY | O_RDONLY);
+	bool ret;
 
 	if (dirfd < 0)
 		return false;
 
-	return generate_results(dirfd);
+	ret = generate_results(dirfd);
+	close(dirfd);
+
+	return ret;
 }
-- 
2.54.0

